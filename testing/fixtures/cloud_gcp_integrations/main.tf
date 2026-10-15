terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_cloud_gcp_link_account" "foo" {
  name = "example"
  project_id="<Your GCP project ID>"
}

resource "newrelic_cloud_gcp_integrations" "foo1" {
  linked_account_id = newrelic_cloud_gcp_link_account.foo.id
  app_engine {
    metrics_polling_interval = 300
  }
  big_query {
    metrics_polling_interval = 300
    fetch_tags = true
  }
  big_table {
    metrics_polling_interval = 300
  }
  composer {
    metrics_polling_interval = 300
  }
  data_flow {
    metrics_polling_interval = 300
  }
  data_proc {
    metrics_polling_interval = 300
  }
  data_store {
    metrics_polling_interval = 300
  }
  fire_base_database {
    metrics_polling_interval = 300
  }
  fire_base_hosting {
    metrics_polling_interval = 300
  }
  fire_base_storage {
    metrics_polling_interval = 300
  }
  fire_store {
    metrics_polling_interval = 300
  }
  functions {
    metrics_polling_interval = 300
  }
  interconnect {
    metrics_polling_interval = 300
  }
  kubernetes {
    metrics_polling_interval = 300
  }
  load_balancing {
    metrics_polling_interval = 300
  }
  mem_cache {
    metrics_polling_interval = 300
  }
  pub_sub {
    metrics_polling_interval = 300
    fetch_tags=true
  }
  redis {
    metrics_polling_interval = 300
  }
  router {
    metrics_polling_interval = 300
  }
  run {
    metrics_polling_interval = 300
  }
  spanner {
    metrics_polling_interval = 300
    fetch_tags=true
  }
  sql {
    metrics_polling_interval = 300
  }
  storage {
    metrics_polling_interval = 300
    fetch_tags=true
  }
  virtual_machines {
    metrics_polling_interval = 300
  }
  vpc_access {
    metrics_polling_interval = 300
  }
}
