terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_pipeline_cloud_rule" "foo" {
  account_id  = 1000100
  name        = "Test Pipeline Cloud Rule"
  description = "This rule deletes all DEBUG logs from the dev environment."
  nrql        = "DELETE FROM Log WHERE logLevel = 'DEBUG' AND environment = 'dev'"
}
