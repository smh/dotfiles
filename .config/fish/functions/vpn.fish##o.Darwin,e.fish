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

function __add_search_domains
  set append_domains $argv

  echo 'list .*/utun.*/DNS' | scutil | read subKey index equals dns_key
  if not string length -q -- $dns_key
    echo "ERROR: Unable to find DNS entry! Is vpn connection established?"
    return 1
  end

  set search_domains (__existing_search_domains $dns_key)

  for domain in $append_domains
    if not contains $domain $search_domains
      set -a add_domains $domain
    end
  end

  # If there is nothing to add then we are done.
  if set -q $add_domains
    echo "All search domains already configured ($append_domains)"
    return 0
  end

  set -l DOMAINS $search_domains $add_domains

  __replace_search_domains $dns_key $search_domains $add_domains
end

function vpn -a cmd
  cat ~/.config/vpn/append_domains | read -la append_domains
  cat ~/.config/vpn/vpn-host | read vpn_host
  cat ~/.config/vpn/vpn-user | read vpn_user
  set vpn_log_dir ~/.cache/vpn
  mkdir -p $vpn_log_dir
  set logfile $vpn_log_dir/$vpn_host.log
  switch $cmd
    case up
      sudo openconnect --background --user=$vpn_user $vpn_host >> $logfile
      gtail -n 7 -f $logfile | sed '/add net default:/ q'
      __add_search_domains $append_domains
    case down
      sudo pkill -SIGINT openconnect
      gtail -n 7 -f $argv[2..-1] $logfile | sed '/User cancelled/ q'
    case status
      pgrep -fl openconnect
    case logs
      tail $argv[2..-1] -f $logfile
  end
end
