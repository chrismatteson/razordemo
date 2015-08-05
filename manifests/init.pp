class razordemo (
  $dnsmasq_config_dir  = $razordemo::params::dnsmasq_config_dir,
  $dnsmasq_config_file = $razordemo::params::dnsmasq_config_file,
  $repos               = hiera_hash('razordemo::repos_hash', $razordemo::params::repos),
  $brokers             = hiera_hash('razordemo::brokers_hash', $razordemo::params::brokers),
  $tasks               = hiera_hash('razordemo::tasks_hash', $razordemo::params::tasks),
  $policies            = hiera_hash('razordemo::policies_hash', $razordemo::params::policies),
  $tags                = hiera_hash('razordemo::tags_hash', $razordemo::params::tags),
  ) inherits razordemo::params { 

  Class['pe_razor::server', 'pe_razor'] -> 
  Class['razordemo::forward_ipv4'] ->
  file_line { '/etc/hosts':
    ensure => 'absent',
    path   => '/etc/hosts',
    line   => "127.0.1.1 $::fqdn $::hostname",
    notify => Service['dnsmasq'],
  } ~>
  class {'razordemo::dnsmasq':
    dnsmasq_config_dir  => $dnsmasq_config_dir,
    dnsmasq_config_file => $dnsmasq_config_file,   
  } ->
  class {'razordemo::config':
    repos    => $repos,
    brokers  => $brokers,
    tasks    => $tasks,
    policies => $policies,
    tags     => $tags,
  } 

  require pe_razor
  include razordemo::client
  include razordemo::forward_ipv4
}
