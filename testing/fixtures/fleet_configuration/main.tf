terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_fleet_configuration" "infra" {
  name                  = "Production Infrastructure Config"
  agent_type            = "NRInfra"
  managed_entity_type   = "HOST"
  operating_system      = "LINUX"
  configuration_content = <<-EOT
    log:
      level: info
      file: /var/log/newrelic-infra/newrelic-infra.log
    metrics:
      enabled: true
      system_sample_rate: 15
  EOT
}
