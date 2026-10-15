terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_alert_muting_rule" "foo" {
	name = "Example Muting Rule"
	enabled = true
	description = "muting rule test."
	condition {
		conditions {
			attribute 	= "product"
			operator 	= "EQUALS"
			values 		= ["APM"]
		}
		conditions {
			attribute 	= "targetId"
			operator 	= "EQUALS"
			values 		= ["Muted"]
		}
		operator = "AND"
	}
    schedule {
      start_time = "2021-01-28T15:30:00"
      end_time = "2021-01-28T16:30:00"
      time_zone = "America/Los_Angeles"
      repeat = "WEEKLY"
      weekly_repeat_days = ["MONDAY", "WEDNESDAY", "FRIDAY"]
      repeat_count = 42
    }
    action_on_muting_rule_window_ended = "CLOSE_ISSUES_ON_INACTIVE"
}
