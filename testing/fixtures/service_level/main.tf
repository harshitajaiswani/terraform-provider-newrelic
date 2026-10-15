terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_service_level" "foo" {
    guid = "MXxBUE18QVBQTElDQVRJT058MQ"
    name = "Latency"
    description = "Proportion of requests that are served faster than a threshold."

    events {
        account_id = 12345678
        valid_events {
            from = "Transaction"
            where = "appName = 'Example application' AND (transactionType='Web')"
        }
        good_events {
            from = "Transaction"
            where = "appName = 'Example application' AND (transactionType= 'Web') AND duration < 0.1"
        }
    }

    objective {
        target = 99.00
        time_window {
            rolling {
                count = 7
                unit = "DAY"
            }
        }
    }
}
