class razordemo::forward_ipv4 {

  file_line { 'ipv4.forward':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv4.ip_forward = 1',
    match => '^net.ipv4.ip_forward = [01]',
  }

  service { 'network':
    ensure    => 'running',
    subscribe => File_line['ipv4.forward'],
  }
  firewall { '200 forwarding masquerade':
    chain    => 'POSTROUTING',
    jump     => 'MASQUERADE',
    proto    => 'all',
    outiface => 'eth0',
    table    => 'nat',
  }
  firewall { '190 fowarding rule':
    chain    => 'FORWARD',
    proto    => 'all',
    action   => 'accept',
  }
  firewall { '150 Allow DNS DHCP and TFTP':
    proto  => 'udp',
    port   => [53, 67, 68, 69],
    action => 'accept',
  }
  firewall { '175 Allow Razor Ports':
   proto  => 'tcp',
   port   => [8150, 8151],
   action => 'accept',
  }
}
