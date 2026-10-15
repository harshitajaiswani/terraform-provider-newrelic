terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_cloud_aws_govcloud_link_account" "foo" {
  account_id             = 1234567
  name                   = "My New Relic - AWS GovCloud Linked Account"
  metric_collection_mode = "PUSH"
  arn                    = "arn:aws:service:region:account-id:resource-id"
}
