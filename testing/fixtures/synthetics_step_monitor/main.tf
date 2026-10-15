terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_synthetics_step_monitor" "foo" {
  name                                    = "Sample Step Monitor"
  enable_screenshot_on_failure_and_script = true
  locations_public                        = ["US_EAST_1", "US_EAST_2"]
  period                                  = "EVERY_6_HOURS"
  status                                  = "ENABLED"
  runtime_type                            = "CHROME_BROWSER"
  runtime_type_version                    = "LATEST"
  devices                                 = ["DESKTOP", "MOBILE_PORTRAIT", "TABLET_LANDSCAPE"]
  browsers                                = ["CHROME"]
  steps {
    ordinal = 0
    type    = "NAVIGATE"
    values  = ["https://www.newrelic.com"]
  }
  tag {
    key    = "some_key"
    values = ["some_value"]
  }
}
