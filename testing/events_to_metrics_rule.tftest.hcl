run "plan" {
  command = plan
  module { source = "./fixtures/events_to_metrics_rule" }
}
