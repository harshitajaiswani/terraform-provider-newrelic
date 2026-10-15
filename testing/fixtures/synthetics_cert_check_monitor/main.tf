terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_synthetics_cert_check_monitor" "foo" {
  name                   = "Sample Cert Check Monitor"
  domain                 = "www.example.com"
  locations_public       = ["AP_SOUTH_1"]
  certificate_expiration = "10"
  period                 = "EVERY_6_HOURS"
  status                 = "ENABLED"
  runtime_type           = "NODE_API"
  runtime_type_version   = "22.20.0"
  tag {
    key    = "some_key"
    values = ["some_value"]
  }
}
