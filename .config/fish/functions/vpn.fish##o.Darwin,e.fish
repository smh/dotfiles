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

function vpn -a cmd
  cat ~/.config/vpn/vpn-host | read vpn_host
  cat ~/.config/vpn/vpn-user | read vpn_user
  cat ~/.config/vpn/vpn-domains | tr '\n' ' ' | read -la vpn_domains
  cat ~/.config/vpn/vpn-slice-routes | tr '\n' ' ' | read vpn_slice_routes
  set vpn_log_dir ~/.cache/vpn
  mkdir -p $vpn_log_dir
  set logfile $vpn_log_dir/$vpn_host.log
  switch $cmd
    case up
      set vpn_slice_domains (string join , $vpn_domains)
      set vpn_slice_cmd "vpn-slice --domains-vpn-dns=$vpn_slice_domains $vpn_slice_routes"
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
      sudo pkill -SIGINT openconnect
      __remove_search_domains $vpn_domains
  end
end
