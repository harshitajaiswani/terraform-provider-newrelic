terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_metric_pruning_rule" "example" {
  nrql        = "SELECT collector.name FROM Metric WHERE metricName = 'http.server.duration'"
  description = "Remove collector.name attribute from http.server.duration to reduce cardinality"
}
