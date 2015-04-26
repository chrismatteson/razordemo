class razordemo::config (
  $repos,
  $brokers,
  $tasks,
  $policies,
  $tags
  ) {

  unless $repos == 'undef' {
    create_resources('razor_repo',$repos)
  }
  unless $brokers == 'undef' {
    create_resources('razor_broker',$brokers)
  }
  unless $tasks == 'undef' {
    create_resources('razor_task',$tasks)
  }
  unless $policies == 'undef' {
    create_resources('razor_policy',$policies)
  }
  unless $tags == 'undef' {
    create_resources('razor_tag',$tags)
  }
  firewall { '200 forwarding rule':
    chain    => 'POSTROUTING',
    jump     => 'MASQUERADE',
    proto    => 'all',
    outiface => 'eth0',
    table    => 'nat',
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
