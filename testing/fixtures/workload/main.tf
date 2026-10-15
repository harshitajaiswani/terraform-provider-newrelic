terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_workload" "foo" {
  name       = "Example workload"
  account_id = 12345678

  entity_guids = ["MjUyMDUyOHxBUE18QVBQTElDQVRJT058MjE1MDM3Nzk1"]

  entity_search_query {
    query = "name like '%Example application%'"
  }

  scope_account_ids = [12345678]
}
