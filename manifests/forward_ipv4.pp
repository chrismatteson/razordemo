class razordemo::forward_ipv4 {

  file_line { 'ipv4.foward':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv4.ip_forward = 1',
    match => '^net.ipv4.ip_forward = [01]',
  }

  server { 'network':
    ensure    => 'running',
    subscribe => File_line['ipv4.forward'],
  }
}
