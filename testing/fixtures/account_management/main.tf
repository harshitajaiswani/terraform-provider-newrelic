terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}

resource "newrelic_account_management" "foo"{
	name = "Test Account Name"
}
