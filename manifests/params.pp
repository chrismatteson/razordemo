class razordemo::params (
  $dnsmasq_config_dir  = '/etc/dnsmasq.d',
  $dnsmasq_config_file = '/etc/dnsmasq.conf',
  $repos = {
    'centos-6.7' => {
      'ensure'  => 'present',
      'iso_url' => 'https://s3-us-west-2.amazonaws.com/tse-builds/razor-images/CentOS-6.7-x86_64-minimal.iso',
      'task'    => 'centos/6',
    },
#    'esxi-5.5' => {
#      'ensure'  => 'present',
#      'iso_url' => 'https://s3-us-west-2.amazonaws.com/tse-builds/razor-images/VMware-VMvisor-Installer-5.5.0-1331820.x86_64.iso',
#      'task'    => 'vmware_esxi',
#    },

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
    'centos-6.7-for-virtual' => {
      'ensure'        => 'present',
      'repo'          => 'centos-6.7',
      'task'          => 'centos/6',
      'broker'        => 'puppet-enterprise',
      'hostname'      => 'host${id}',
      'root_password' => 'puppet',
      'max_count'     => 20,
      'node_metadata' => {},
      'tags'          => ['virtual'],
    },
#    'esxi-5.5-for-virtual' => {
#      'ensure'        => 'present',
#      'repo'          => 'esxi-5.5',
#      'task'          => 'vmware_esxi',
#      'broker'        => 'puppet-enterprise',
#      'hostname'      => 'host${id}',
#      'root_password' => 'puppet',
#      'max_count'     => 20,
#      'node_metadata' => {},
#      'tags'          => ['virtual'],
#    }
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
