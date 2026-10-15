terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_alert_policy" "example" {
  name = "my-policy"
}

# Create component NRQL conditions
resource "newrelic_nrql_alert_condition" "high_response_time" {
  policy_id = newrelic_alert_policy.example.id
  name      = "High Response Time"
  enabled   = true

  nrql {
    query = "SELECT average(duration) FROM Transaction WHERE appName = 'MyApp'"
  }

  critical {
    operator              = "above"
    threshold             = 5.0
    threshold_duration    = 300
    threshold_occurrences = "all"
  }

  violation_time_limit_seconds = 3600
}

resource "newrelic_nrql_alert_condition" "high_error_rate" {
  policy_id = newrelic_alert_policy.example.id
  name      = "High Error Rate"
  enabled   = true

  nrql {
    query = "SELECT percentage(count(*), WHERE error IS true) FROM Transaction WHERE appName = 'MyApp'"
  }

  critical {
    operator              = "above"
    threshold             = 5.0
    threshold_duration    = 300
    threshold_occurrences = "all"
  }

  violation_time_limit_seconds = 3600
}

# Create alert compound condition combining both
resource "newrelic_alert_compound_condition" "critical_service_health" {
  policy_id          = newrelic_alert_policy.example.id
  name               = "Critical Service Health"
  enabled            = true
  trigger_expression = "A AND B"
  runbook_url        = "https://example.com/runbooks/critical-health"
  threshold_duration = 120

  component_conditions {
    id    = newrelic_nrql_alert_condition.high_response_time.id
    alias = "A"
  }

  component_conditions {
    id    = newrelic_nrql_alert_condition.high_error_rate.id
    alias = "B"
  }

  facet_matching_behavior = "FACETS_IGNORED"
}
