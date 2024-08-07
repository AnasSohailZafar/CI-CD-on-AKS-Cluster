terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.74.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.45.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "29e44bcb-77c5-41cf-a0ca-50f415f078b2"
    resource_group_name  = "rg-terraformstate-prod"
    storage_account_name = "ahlensstterraform01"
    container_name       = "sandbox"
    key                  = "Test/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "df0a020f-3e1c-4b42-938f-165c9c7f96ce"
}
