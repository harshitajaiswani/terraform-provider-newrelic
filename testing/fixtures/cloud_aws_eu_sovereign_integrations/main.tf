terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_cloud_aws_eu_sovereign_link_account" "foo" {
  arn                    = "arn:aws-eusc:iam::123456789012:role/NewRelicInfrastructure-Integrations"
  metric_collection_mode = "PULL"
  name                   = "my-eu-sovereign-account"
}

resource "newrelic_cloud_aws_eu_sovereign_integrations" "bar" {
  linked_account_id = newrelic_cloud_aws_eu_sovereign_link_account.foo.id

  billing {
    metrics_polling_interval = 3600
  }

  cloudtrail {
    metrics_polling_interval = 300
    aws_regions              = ["eusc-de-east-1"]
  }

  x_ray {
    metrics_polling_interval = 300
    aws_regions              = ["eusc-de-east-1"]
  }
}
