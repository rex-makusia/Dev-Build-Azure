terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

provider "azurerm" {
  feature {}
}

resource "azurerm_resource_group" "mtc-rg" {
  name     = "mtc-resourcs"
  location = "Australia East"
  tags = {
      environment = "dev"
  }
}
