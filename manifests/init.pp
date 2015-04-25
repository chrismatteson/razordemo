class razordemo (
  $dnsmasq_config_dir  = $demomodule::params::dnsmasq_config_dir,
  $dnsmasq_config_file = $demomodule::params::dnsmasq_config_file,
  $repos               = hiera_hash('demomodule::repos_hash',$demomodule::params::repos),
  $brokers             = hiera_hash('demomodule::brokers_hash',$demomodule::params::brokers),
  $tasks               = hiera_hash('demomodule::tasks_hash',$demomodule::params::tasks,
  $policies            = hiera_hash('demomodule::policies_hash',$demomodule::params::policies),
  $tags                = hiera_hash('demomodule::tags_hash',$demomodule::params::tags),
  ) inherits razordemo::params {

  include razordemo::client
  include razordemo::forward_ipv4
  contain razordemo::dnsmasq
  contain razordemo::config

  Class {'razordemo::dnsmasq':
    dnsmasq_config_dir  => $dnsmasq_config_dir,
    dnsmasq_config_file => $dnsmasq_config_file,   
  } ->
  Class {'razordemo::config':
    repos    => $repos,
    brokers  => $brokers,
    tasks    => $tasks,
    policies => $policies,
    tags     => $tags,
  }
}
