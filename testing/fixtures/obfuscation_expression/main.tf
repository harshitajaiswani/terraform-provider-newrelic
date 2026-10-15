terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_obfuscation_expression" "foo"{ 
  account_id = 12345
  name = "OExp"
  description = "The description"
  regex = "(regex.*)"
}
