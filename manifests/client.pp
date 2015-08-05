class razordemo::client {

  package { ['pe-razor-client','json_pure'] :
    ensure   => present,
    provider => puppet_gem, # modified by kai
  }

  file { '/usr/bin/razor' :
    ensure  => link,
    # This was changed -Kai
    target  => '/opt/puppetlabs/puppet/bin/razor',
    require => Package['pe-razor-client'],
  }
}
