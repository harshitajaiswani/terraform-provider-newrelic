terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_cardinality_management" "account_default" {
  mode              = "DEFAULT"
  cardinality_limit = 150000
}
