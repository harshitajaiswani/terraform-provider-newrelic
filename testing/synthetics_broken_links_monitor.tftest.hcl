run "plan" {
  command = plan
  module { source = "./fixtures/synthetics_broken_links_monitor" }
}
