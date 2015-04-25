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
  firewall { '150 Allow DHCP and TFTP':
    proto  => 'udp',
    port   => [67, 68, 69],
    action => 'accept',
  }
  firewall { '175 Allow Razor Ports':
   proto  => ['udp','tcp'],
   port   => [8150, 8151],
   action => 'accept',
  }
  file_line { '/etc/hosts':
    ensure => 'absent',
    path   => '/etc/hosts',
    line   => "127.0.1.1 $::fqdn $::hostname"
  }
}
