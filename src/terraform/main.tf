resource "random_string" "random" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}

locals {
  suffix = random_string.random.result
}

resource "azurerm_resource_group" "main" {
  name      = "rg-loadtest-${local.suffix}"
  location  = var.location
}

resource "azurerm_load_example" "main" {
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  name                = "loadtest-${local.suffix}"
}