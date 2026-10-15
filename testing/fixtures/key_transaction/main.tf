terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_key_transaction" "foo" {
  application_guid     = "MzgfNjUyNnxBUE19QVBQTElDQVHJT068NTUfNDT4MjUy"
  apdex_index          = 0.5
  browser_apdex_target = 0.5
  metric_name          = "WebTransaction/Function/__main__:foo_bar"
  name                 = "Sample Key Transaction"
}
