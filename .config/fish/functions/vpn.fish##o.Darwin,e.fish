function __existing_search_domains -a dns_key
  echo -e "get $dns_key\nd.show" \
     | scutil \
     | sed -n '/SearchDomains/,/ServerAddresses/p' \
     | grep -v -E '{|}' \
     | cut -d : -f 2 \
     | string trim
end

function __replace_search_domains -a dns_key
  set search_domains $argv[2..-1]

  if set -q $search_domains
    echo Removing SearchDomains
    echo on service $dns_key
    echo "\
      get $dns_key
      d.remove SearchDomains
      set $dns_key
      show $dns_key
      exit" | sudo scutil
  else
    echo Replacing SearchDomains with $search_domains
    echo on service $dns_key
    echo "\
      get $dns_key
      d.remove SearchDomains
      d.add SearchDomains $search_domains
      set $dns_key
      show $dns_key
      exit" | sudo scutil
  end
end

function __add_search_domains
  set vpn_domains $argv

  # echo 'list .*/utun.*/DNS' | scutil | read subKey index equals dns_key
  echo 'list State:/Network/Service/.*/DNS' | scutil | read subKey index equals dns_key
  if not string length -q -- $dns_key
    echo "ERROR: Unable to find DNS entry! Is vpn connection established?"
    return 1
  end

  set search_domains (__existing_search_domains $dns_key)

  for domain in $vpn_domains
    if not contains $domain $search_domains
      set -a add_domains $domain
    end
  end

  # If there is nothing to add then we are done.
  if set -q $add_domains
    echo "All search domains already configured ($vpn_domains)"
    return 0
  end

  __replace_search_domains $dns_key $search_domains $add_domains
end

function __remove_search_domains
  set vpn_domains $argv

  # echo 'list .*/utun.*/DNS' | scutil | read subKey index equals dns_key
  echo 'list State:/Network/Service/.*/DNS' | scutil | read subKey index equals dns_key
  if not string length -q -- $dns_key
    echo "ERROR: Unable to find DNS entry! Is vpn connection established?"
    return 1
  end

  set search_domains (__existing_search_domains $dns_key)

  for domain in $search_domains
    if not contains $domain $vpn_domains
      set -a remaining_domains $domain
    end
  end

  # If there is nothing to add then we are done.
  if [ "$search_domains" = "$remaining_domains" ]
    echo "All search domains already removed ($search_domains)"
    return 0
  end

  __replace_search_domains $dns_key $remaining_domains
end

function __load_config -a file
  cat ~/.config/vpn/$file | grep -v "#" | tr '\n' ' ' | string trim
end

function vpn -a cmd
  __load_config 'vpn-host' | read vpn_host
  __load_config 'vpn-user' | read vpn_user
  __load_config 'vpn-domains' | read -la vpn_domains
  __load_config 'vpn-slice-routes' | read -la vpn_slice_routes

  set vpn_log_dir ~/.cache/vpn
  set logfile $vpn_log_dir/$vpn_host.log

  mkdir -p $vpn_log_dir

  switch $cmd
    case up
      set vpn_slice_domains (string join , $vpn_domains)
      set vpn_slice_cmd "vpn-slice -v -D --domains-vpn-dns=$vpn_slice_domains $vpn_slice_routes"
      sudo openconnect --background --user=$vpn_user $vpn_host --script="$vpn_slice_cmd" >> $logfile
      gtail -n 7 -f $logfile | sed '/Established DTLS/ q'
      __add_search_domains $vpn_domains
    case down
      sudo pkill -SIGINT openconnect
      gtail -n 7 -f $argv[2..-1] $logfile | sed '/User cancelled/ q'
      __remove_search_domains $vpn_domains
    case status
      pgrep -fl openconnect
    case logs
      tail $argv[2..-1] $logfile
    case cleanup
      echo "killing openconnect"
      sudo pkill -SIGINT openconnect
      for i in $vpn_domains
        echo "removing resolver domain-file /etc/resolver/$i"
        sudo rm /etc/resolver/$i
      end
      __remove_search_domains $vpn_domains
  end
end
