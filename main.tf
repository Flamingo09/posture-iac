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
    subscription_id = "7a7b34d9-6f14-482e-90df-44be6bef083d"
    tenant_id = "c74f9791-f0d8-4764-826d-f0393bafd5b9"
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
