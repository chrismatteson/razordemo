class razordemo::params {
  $dnsmasq_config_dir  = '/etc/dnsmasq.d'
  $dnsmasq_config_file = '/etc/dnsmasq.conf'
  $brokers = {
    'puppet-enterprise' => {
      'ensure'      => 'present',
      'broker_type' => 'puppet-pe',
      'configuration' => {
        'server' => 'master.inf.puppetlabs.demo',
        'windows_agent_download_url' => 'https://pm.puppetlabs.com/puppet-agent/2015.2.1/latest/repos/windows/puppet-agent-x64.msi',
      },
    },
    'esxi' => {
      'ensure'      => 'present',
      'broker_type' => 'esxi',
      'configuration' => {
        'vc_server' => 'tse-vc1-prod.corp.puppetlabs.net',
        'vc_username' => 'tseadmin@vsphere.local',
        'vc_password' => 'PuppetLabs=>10',
      },
    }
  }
  $tags = {
    'virtual' => {
      'ensure' => 'present',
      'rule'   => ['=', ['fact', 'is_virtual'], true ],
    },
    'small'   => {
      'ensure' => 'present',
      'rule'   => [ '=', ['fact', 'processorcount'], 1],
    },
    'medium'   => {
      'ensure' => 'present',
      'rule'   => [ '=', ['fact', 'processorcount'], 2],
    },
    'large'   => {
      'ensure' => 'present',
      'rule'   => [ '=', ['fact', 'processorcount'], 3],
    },
  }
  $tasks = 'undef'
}
