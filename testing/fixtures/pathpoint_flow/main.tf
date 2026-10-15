terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_pathpoint_flow" "checkout" {
  account_id       = 1234
  name             = "Checkout Flow"
  description      = "End-to-end checkout pipeline"
  refresh_interval = "ONE_MINUTE"  # defaults to ONE_MINUTE if not set

  kpis {
    name        = "Order Success Rate"
    description = "Percentage of orders completed successfully"
    category    = "Revenue"

    query {
      from  = "Transaction"
      where = "name='checkout'"

      select {
        aggregation_type = "COUNT"
        alias            = "orders"
      }
    }
  }

  stages {
    name          = "Revenue"
    health_rollup = "ALERT_CONDITIONS"
    link          = "https://runbooks.example.com/checkout/revenue"

    related {
      source = false
      target = true
    }

    stage_kpis {
      name     = "Payment Errors"
      category = "Reliability"

      query {
        from = "TransactionError"

        select {
          aggregation_type = "COUNT"
          alias            = "errors"
        }
      }
    }

    levels {
      steps {
        name = "Order Service"
        entity_search_query {
          query = "accountId=123 AND domain='APM' AND name='OrderService'"
        }
      }
    }
  }

  stages {
    name = "Frontend"
    link = "https://runbooks.example.com/checkout/frontend"
    # health_rollup defaults to AUTOMATIC_ROLL_UP: health rolls up from the step signals below.

    related {
      source = true
      target = false
    }

    levels {
      steps {
        name = "Login Page"

        # Entity signal: a specific New Relic entity pinned by GUID.
        signals {
          guid = "GUID1"
          name = "Cart Service"
          type = "ENTITY"
        }

        # Alert signal: an alert condition pinned by its entity GUID.
        signals {
          guid = "GUID2"
          name = "Checkout Error Rate"
          type = "ALERT"
        }

        # Dynamic query: API auto-discovers entities matching the filter at each refresh.
        entity_search_query {
          query = "accountId=1234 AND domain='BROWSER' AND name='Login'"
        }
      }
    }
  }
}
