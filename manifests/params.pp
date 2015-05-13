class razordemo::params (
  $dnsmasq_config_dir  = '/etc/dnsmasq.d',
  $dnsmasq_config_file = '/etc/dnsmasq.conf',
  $repos = {
    'centos-6.6' => {
      'ensure'  => 'present',
      'iso_url' => 'http://mirror.san.fastserv.com/pub/linux/centos/6.6/isos/x86_64/CentOS-6.6-x86_64-minimal.iso',
      'task'    => 'centos',
    }
  },
  $brokers = {
    'puppet-enterprise' => {
      'ensure'      => 'present',
      'broker_type' => 'puppet-pe',
      'configuration' => {
        'server' => 'master.inf.puppetlabs.demo',
      },
    }
  },
  $policies = {
    'centos-for-virtual' => {
      'ensure'        => 'present',
      'repo'          => 'centos-6.6',
      'task'          => 'centos',
      'broker'        => 'puppet-enterprise',
      'hostname'      => 'host${id}',
      'root_password' => 'puppet',
      'max_count'     => 20,
      'node_metadata' => {},
      'tags'          => ['virtual'],
    }
  },
  $tags = {
    'virtual' => {
      'ensure' => 'present',
      'rule'   => ['=', ['fact', 'is_virtual'], true ],
    }
  },
  $tasks = 'undef'
  ){
}
