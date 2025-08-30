terraform {

  # backend "azurerm" {
  #   resource_group_name  = "Himmat_Rg_group"
  #   storage_account_name = "himmatstorage8000"
  #   container_name       = "infracontaner"
  #   key                  = "devterraform.tfstate"

  # }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "5fbead97-423e-4814-809c-114db991d911"

}