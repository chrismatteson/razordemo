class razordemo::config (
  $brokers,
  $tasks,
  $tags
  ) {

  unless $brokers == 'undef' {
    create_resources('razor_broker',$brokers)
  }
  unless $tasks == 'undef' {
    create_resources('razor_task',$tasks)
  }
  unless $tags == 'undef' {
    create_resources('razor_tag',$tags)
  }
}
