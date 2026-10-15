terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_synthetics_script_monitor" "monitor" {
  status               = "ENABLED"
  name                 = "script_monitor"
  type                 = "SCRIPT_API"
  locations_public     = ["AP_SOUTH_1", "AP_EAST_1"]
  period               = "EVERY_6_HOURS"
  
  script               = "console.log('it works!')"

  script_language      = "JAVASCRIPT"
  runtime_type         = "NODE_API"
  runtime_type_version = "22.20.0"

  tag {
    key    = "some_key"
    values = ["some_value"]
  }
}
