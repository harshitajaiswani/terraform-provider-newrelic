terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_events_to_metrics_rule" "foo" {
  account_id = 12345
  name = "Example events to metrics rule"
  description = "Example description"
  nrql = "SELECT uniqueCount(account_id) AS ``Transaction.account_id`` FROM Transaction FACET appName, name"
}
