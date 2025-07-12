terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>3.3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.36.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.7.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}