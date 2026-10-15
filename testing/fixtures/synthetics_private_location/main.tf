terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_synthetics_private_location" "location" {
  description = "The private location description"
  name        = "The name of the private location"
}
