terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_browser_application" "foo" {
  name                        = "example-browser-app"
  cookies_enabled             = true
  distributed_tracing_enabled = true
  loader_type                 = "SPA"
}
