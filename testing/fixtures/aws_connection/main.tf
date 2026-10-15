terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_aws_connection" "foo" {
  name        = "test-aws-connection"
  description = "AWS Connection wrapping the role"
  region      = "us-east-1"
  enabled     = true

  scope_type = "ORGANIZATION"
  scope_id   = "YOUR_ORG_ID_HERE"

  credential {
    assume_role {
      role_arn    = "arn:aws:iam::123456789012:role/newrelic-fed-logs-ingest"
      external_id = "external id"
    }
  }
}
