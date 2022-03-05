terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "Dhebal76-Test"
    workspaces {
      name = "Example-Workspace"
    }
  }
}



provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westus2"

  tags = {
    Enviorment = "Terraform"
    Team = "DevOps"
  }

}

resource "azurerm_virtual_network" "vnet" {
    name = "MyTFVnet"
    address_space = [ "10.0.0.0/16" ]
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}
