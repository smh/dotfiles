function vpn -a cmd
  set -l vpncmd /opt/cisco/anyconnect/bin/vpn
  switch $cmd
    case connect
      cat ~/.config/vpn/vpn-host | read vpn_host
      cat ~/.config/vpn/append_domains | read append_domains
      $vpncmd -s connect $vpn_host \
      && echo enter password to enable nets searchdomains \
      && sudo add-searchdomains $append_domains
    case disconnect
      $vpncmd disconnect
    case status
      $vpncmd status
    case '*'
      $vpncmd $argv
  end
end
