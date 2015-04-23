class razordemo::config (
  $repos    = hiera_hash(razordemo::config::repos,'undef'),
  $brokers  = hiera_hash(razordemo::config::brokers,'undef'),
  $tasks    = hiera_hash(razordemo::config::tasks,'undef'),
  $policies = hiera_hash(razordemo::config::policies,'undef'),
  $tags     = hiera_hash(razordemo::config::tags,'undef')
  ) {

  unless $repos == 'undef' {
    create_resources('razor_repo',$repos)
  }
  unless $brokers == 'undef' {
    create_resources('razor_broker',$brokers)
  }
  unless $tasks == 'undef' {
    create_resources('razor_task',$tasks)
  }
  unless $policies == 'undef' {
    create_resources('razor_policy',$policies)
  }
  unless $tags == 'undef' {
    create_resources('razor_tag',$tags)
  }
}
