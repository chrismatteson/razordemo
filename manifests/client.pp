class razordemo::client {
  
  if ( versioncmp( $::facterversion,'3.0.0' ) == -1 ) {
    $link_target = '/opt/puppet/bin/razor' 
  } else {
    $link_target = '/opt/puppetlabs/puppet/bin/razor'
  }    

  package { ['pe-razor-client','json_pure'] :
    ensure   => present,
    provider => puppet_gem, 
  }

  file { '/usr/bin/razor' :
    ensure  => link,
    target  => $link_target,
    require => Package['pe-razor-client'],
  }
}
