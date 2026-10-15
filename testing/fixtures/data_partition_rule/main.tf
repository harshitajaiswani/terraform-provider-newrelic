terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_data_partition_rule" "foo"{
  description = "description"
  enabled = true
  nrql = "logtype='node'"
  retention_policy = "STANDARD"
  target_data_partition = "Log_name"
}
