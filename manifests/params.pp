class razordemo::params {
  $dnsmasq_config_dir  = '/etc/dnsmasq.d'
  $dnsmasq_config_file = '/etc/dnsmasq.conf'
  $brokers = {
    'puppet-enterprise' => {
      'ensure'      => 'present',
      'broker_type' => 'puppet-pe',
      'configuration' => {
        'server' => 'master.inf.puppetlabs.demo',
      },
    }
  }
  $tags = {
    'virtual' => {
      'ensure' => 'present',
      'rule'   => ['=', ['fact', 'is_virtual'], true ],
    },
  }
  $tasks = 'undef'
}
