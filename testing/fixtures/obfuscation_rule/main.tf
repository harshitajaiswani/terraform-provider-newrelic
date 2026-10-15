terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}


resource "newrelic_obfuscation_expression" "bar" {
  name        = "expressionName"
  description = "description of the expression"
  regex       = "(^http)"
}

resource "newrelic_obfuscation_rule" "foo" {
  name        = "ruleName"
  description = "description of the rule"
  filter      = "hostStatus=running"
  enabled     = true
  action {
    attribute    = ["message"]
    expression_id = newrelic_obfuscation_expression.bar.id
    method       = "MASK"
  }
}
