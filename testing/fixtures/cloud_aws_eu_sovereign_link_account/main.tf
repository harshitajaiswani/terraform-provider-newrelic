terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_cloud_aws_eu_sovereign_link_account" "foo" {
  account_id             = 1234567
  name                   = "My New Relic - AWS EU Sovereign Linked Account"
  metric_collection_mode = "PUSH" # Options: "PUSH", "PULL", or "BOTH"
  arn                    = "arn:aws-eusc:iam::123456789012:role/NewRelicInfrastructure-Integrations"
}
