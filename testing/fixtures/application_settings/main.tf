terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_application_settings" "app" {
  # please note that the arguments 'guid' and 'name' are mutually exclusive
  # using the 'guid' argument is preferred over using the 'name' argument
  guid                   = "Mxxxxxxxxxxxxxxxxxxxxx"
  name                   = "Sample New Relic APM Application"
  app_apdex_threshold    = "0.7"
  use_server_side_config = true
  transaction_tracer {
    explain_query_plans {
      query_plan_threshold_type  = "VALUE"
      query_plan_threshold_value = "0.5"
    }
    sql {
      record_sql = "RAW"
    }
    stack_trace_threshold_value = "0.5"
    transaction_threshold_type  = "VALUE"
    transaction_threshold_value = "0.5"
  }
  error_collector {
    expected_error_classes = []
    expected_error_codes   = []
    ignored_error_classes  = []
    ignored_error_codes    = []
  }
  enable_slow_sql        = true
  tracer_type            = "NONE"
  enable_thread_profiler = true
}
