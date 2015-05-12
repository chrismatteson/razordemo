class razordemo::config (
  $repos,
  $brokers,
  $tasks,
  $policies,
  $tags
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
