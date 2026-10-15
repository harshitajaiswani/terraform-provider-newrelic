run "plan" {
  command = plan
  module { source = "./fixtures/synthetics_cert_check_monitor" }
}
