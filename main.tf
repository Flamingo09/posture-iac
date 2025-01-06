provider "google" {
  project = "terraform-cloud-445206"
  region  = "global"
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.8.0"
    }
  }
}
provider "azurerm" {
    subscription_id = "11855aae-a901-49c4-aa6b-7b801656f554"
    features {
    }
}

resource "azurerm_network_security_group" "example" {
  name                = "acceptanceTestSecurityGroup1"
  location            = "westeurope"
  resource_group_name = "example-resources"

  security_rule {
    name                       = "test123"
    description                = "security_rule description"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    source_application_security_group_ids = ["acceptanceTestSecurityGroup1"]
  }

  tags = {
    environment = "Production"
  }
}
