terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_synthetics_secure_credential" "foo" {
  key = "MY_KEY"
  value = "My value"
  description = "My description"
}
