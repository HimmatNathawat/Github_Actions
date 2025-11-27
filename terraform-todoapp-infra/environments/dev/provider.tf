terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "rg-devopsinsiders"
  #   storage_account_name = "twostates"
  #   container_name       = "tfstate"
  #   key                  = "dev.tfstate"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "b6172f60-9a69-46ff-b334-298e40a9d743"
}
