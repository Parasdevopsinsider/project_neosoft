terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg_backend"
    storage_account_name = "backendstgabc"
    container_name       = "contbackend"
    key                  = "backend.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "7b0035a3-2bdd-440f-b694-5b328a80d3bd"

}