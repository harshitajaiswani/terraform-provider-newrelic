terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_notification_channel" "foo" {
  account_id = 12345678
  name = "webhook-example"
  type = "WEBHOOK"
  destination_id = "00b6bd1d-ac06-4d3d-bd72-49551e70f7a8"
  product = "IINT" // (Workflows)

  // must be valid json
  property {
    key = "payload"
    value = "name: {{ foo }}"
    label = "Payload Template"
  }
}
