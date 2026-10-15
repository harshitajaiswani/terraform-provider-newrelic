terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_fleet" "linux_hosts" {
  name                = "Production Linux Hosts"
  managed_entity_type = "HOST"
  operating_system    = "LINUX"
  description         = "Fleet for managing Linux production hosts"

  tags = [
    "environment:production",
    "team:platform,ops"
  ]
}
