class razordemo::client {

  package { ['pe-razor-client','json_pure'] :
    ensure   => present,
    provider => pe_gem,
  }

  file { '/usr/bin/razor' :
    ensure  => link,
    targer  => '/opt/puppet/bin/razor',
    require => Package['pe-razor-client'],
  }
}
