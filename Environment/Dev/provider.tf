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
  subscription_id = "b6172f60-9a69-46ff-b334-298e40a9d743"

}