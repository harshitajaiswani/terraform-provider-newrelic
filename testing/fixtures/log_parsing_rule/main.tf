terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}


resource "newrelic_log_parsing_rule" "foo"{
    name        = "log_parse_rule"
    attribute   = "message"
    enabled     = true
    grok        = "sampleattribute='%%{NUMBER:test:int}'"
    lucene      = "logtype:linux_messages"
    nrql        = "SELECT * FROM Log WHERE logtype = 'linux_messages'"
}

