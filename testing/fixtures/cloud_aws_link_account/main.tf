terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_cloud_aws_link_account" "foo" {
  arn = "arn:aws:service:region:account-id:resource-id"
  metric_collection_mode = "PUSH"
  name = "account name"
}
