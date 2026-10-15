terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_monitor_downtime" "foo" {
  name = "Sample Monitor Downtime"
  monitor_guids = [
    "<GUID-1>",
    "<GUID-2>"
  ]
  mode       = "WEEKLY"
  start_time = "2023-11-30T10:30:00"
  end_time   = "2023-12-10T02:45:30"
  time_zone  = "Asia/Kolkata"
  end_repeat {
    on_date = "2023-12-20"
  }
  maintenance_days = [
    "FRIDAY",
    "SATURDAY",
  ]
}
