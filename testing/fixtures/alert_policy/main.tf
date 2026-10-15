terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_alert_policy" "foo" {
  name = "example"
  incident_preference = "PER_POLICY" # PER_POLICY is default
}
