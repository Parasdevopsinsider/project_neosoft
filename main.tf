resource "azurerm_resource_group" "rg1" {
  name       = "rg-sme"
  location   = "centralindia"
  managed_by = "Lead"
  tags = {
    environment = "dev"
    owner       = "sme"
  }
}

resource "azurerm_resource_group" "rg2" {
  name       = "rg-sme2"
  location   = "centralindia"
  managed_by = "Lead"
  tags = {
    environment = "dev"
    owner       = "sme"
  }
}

resource "azurerm_storage_account" "stg1" {
  name                     = "stgsme"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account" "stg2" {
    depends_on = [ azurerm_resource_group.rg2 ]
  name                     = "stgsme2"
  resource_group_name      = "rg-sme2"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}