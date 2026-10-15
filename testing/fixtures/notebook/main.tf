terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_notebook" "incident_runbook" {
  title = "Production API Incident - Investigation"

  content = <<-JSON
    {
      "type": "declarative",
      "version": 1,
      "content": [
        {
          "type": "container",
          "props": { "layout": "stack" },
          "content": [
            {
              "type": "widget",
              "content": {
                "type": "visualization",
                "id": "viz.markdown",
                "props": {
                  "text": "# Production API Incident\n\n**Status**: Resolved\n**Impact**: ~15% of API requests failed\n\nUse this notebook to walk through what happened and track action items."
                }
              }
            },
            {
              "type": "widget",
              "props": { "title": "Peak error rate" },
              "content": {
                "type": "visualization",
                "id": "viz.billboard",
                "props": {
                  "nrqlQueries": [
                    {
                      "accountIds": [1234567],
                      "query": "SELECT percentage(count(*), WHERE httpResponseCode >= 400) AS 'Error Rate %' FROM Transaction WHERE appName = 'api-production' SINCE 1 hour ago"
                    }
                  ],
                  "thresholdsWithSeriesOverrides": {
                    "thresholds": [
                      { "to": 1,   "severity": "success"  },
                      { "from": 1, "to": 5, "severity": "warning"  },
                      { "from": 5, "severity": "critical" }
                    ]
                  }
                }
              }
            },
            {
              "type": "widget",
              "props": { "title": "Error rate over time" },
              "content": {
                "type": "visualization",
                "id": "viz.line",
                "props": {
                  "nrqlQueries": [
                    {
                      "accountIds": [1234567],
                      "query": "SELECT percentage(count(*), WHERE httpResponseCode >= 400) FROM Transaction WHERE appName = 'api-production' TIMESERIES 1 minute SINCE 1 hour ago"
                    }
                  ],
                  "legend":    { "enabled": true },
                  "yAxisLeft": { "zero": true },
                  "nullValues": { "nullValue": "zero" }
                }
              }
            }
          ]
        }
      ]
    }
  JSON
}
