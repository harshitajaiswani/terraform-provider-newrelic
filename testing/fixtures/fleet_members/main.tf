terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_fleet" "example" {
  name                = "my-fleet"
  managed_entity_type = "HOST"
  operating_system    = "LINUX"
}

resource "newrelic_fleet_members" "example" {
  fleet_id = newrelic_fleet.example.id

  ring {
    name       = "default"
    entity_ids = [
      "MXxOR0VQfEhPU1R8MTIzNDU2Nzg",
      "MXxOR0VQfEhPU1R8ODc2NTQzMjE",
    ]
  }
}
