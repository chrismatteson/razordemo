class razordemo::esxi55 {
  require razordemo

  razor_repo { 'esxi55_repo':
    ensure  => present,
    iso_url => 'http://int-resources.ops.puppetlabs.net/ISO/VMware/ESXi/VMware-VMvisor-Installer-5.5.0-1331820.x86_64.iso',
    task    => 'vmware_esxi',
  }

  razor_policy { 'esxi55_policy':
    ensure        => 'present',
    repo          => 'esxi55_repo',
    task          => 'vmware_esxi',
    broker        => 'esxi',
    hostname      => 'esxi-razor${id}',
    root_password => 'puppet',
    max_count     => 20,
    node_metadata => {},
    tags          => ['virtual'],
  }
}
