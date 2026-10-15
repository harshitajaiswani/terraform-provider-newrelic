terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_notification_destination" "foo" {
  account_id = 12345678
  name = "foo"
  type = "WEBHOOK"

  secure_url {
    prefix = "https://webhook.mywebhook.com/"
    secure_suffix = "service_id/123456"
  }

  property {
    key = "source"
    value = "terraform"
  }

  auth_custom_header {
    key = "API_KEY"
    value = "test-api-key"
  }
}
