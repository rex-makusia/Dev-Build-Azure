# A Network Interface
Manages a Network Interface.
- Create a network interaface that we will attached to our virtual machine inorder to provide network connectivity. This NIC  will recieve its public address from the IP address in lesson 10.
- Refer to the [Azure Network Interface](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) on the Azurerm Documentation
- Starter Confirugration
```HCL
resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}
```
- ./terraform plan
```HCL
$ ./terraform plan

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_network_interface.mtc-nic will be created
  + resource "azurerm_network_interface" "mtc-nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "australiaeast"
      + mac_address                   = (known after apply)
      + name                          = "mtc-nic"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "mtc-resources"
      + tags                          = {
          + "environment" = "dev"
        }
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)    
          + name                                               = "internal"
          + primary                                            = (known after apply)    
          + private_ip_address                                 = (known after apply)    
          + private_ip_address_allocation                      = "Dynamic"
          + private_ip_address_version                         = "IPv4"
          + public_ip_address_id                               = (known after apply)    
          + subnet_id                                          = (known after apply)    
        }
    }

  # azurerm_network_security_group.mtc-sg will be created
  + resource "azurerm_network_security_group" "mtc-sg" {
      + id                  = (known after apply)
      + location            = "australiaeast"
      + name                = "mtc-sg"
      + resource_group_name = "mtc-resources"
      + security_rule       = (known after apply)
      + tags                = {
          + "environment" = "dev"
        }
    }

  # azurerm_network_security_rule.mtc-dev-rule will be created
  + resource "azurerm_network_security_rule" "mtc-dev-rule" {
      + access                      = "Allow"
      + destination_address_prefix  = "*"
      + destination_port_range      = "*"
      + direction                   = "Inbound"
      + id                          = (known after apply)
      + name                        = "mtc-dev-rule"
      + network_security_group_name = "mtc-sg"
      + priority                    = 100
      + protocol                    = "*"
      + resource_group_name         = "mtc-resources"
      + source_address_prefix       = "*"
      + source_port_range           = "*"
    }

  # azurerm_public_ip.mtc-ip will be created
  + resource "azurerm_public_ip" "mtc-ip" {
      + allocation_method       = "Dynamic"
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "australiaeast"
      + name                    = "mtc-ip"
      + resource_group_name     = "mtc-resources"
      + sku                     = "Basic"
      + sku_tier                = "Regional"
      + tags                    = {
          + "environment" = "dev"
        }
    }

  # azurerm_resource_group.mtc-rg will be created
  + resource "azurerm_resource_group" "mtc-rg" {
      + id       = (known after apply)
      + location = "australiaeast"
      + name     = "mtc-resources"
      + tags     = {
          + "environment" = "dev"
        }
    }

  # azurerm_subnet.mtc-subnet will be created
  + resource "azurerm_subnet" "mtc-subnet" {
      + address_prefixes                               = [
          + "10.123.1.0/24",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "mtc-subnet"
      + resource_group_name                            = "mtc-resources"
      + virtual_network_name                           = "mtc-network"
    }

  # azurerm_subnet_network_security_group_association.mtc-sga will be created
  + resource "azurerm_subnet_network_security_group_association" "mtc-sga" {
      + id                        = (known after apply)
      + network_security_group_id = (known after apply)
      + subnet_id                 = (known after apply)
    }

  # azurerm_virtual_network.mtc-vn will be created
  + resource "azurerm_virtual_network" "mtc-vn" {
      + address_space       = [
          + "10.123.0.0/16",
        ]
      + dns_servers         = (known after apply)
      + guid                = (known after apply)
      + id                  = (known after apply)
      + location            = "australiaeast"
      + name                = "mtc-network"
      + resource_group_name = "mtc-resources"
      + subnet              = (known after apply)
      + tags                = {
          + "environment" = "dev"
        }
    }

Plan: 8 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to 
take exactly these actions if you run "terraform apply" now.

Admin@SEA-DEV MINGW64 /c/Dev/Dev-Build-Azure (main)
$ git  pull
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (3/3), 941 bytes | 33.00 KiB/s, done.
From https://github.com/rex-makusia/Dev-Build-Azure
   fdb38cb..0c3e637  main       -> origin/main
Updating fdb38cb..0c3e637
Fast-forward
 main.tf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Admin@SEA-DEV MINGW64 /c/Dev/Dev-Build-Azure (main)
$ ./terraform plan

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_network_interface.mtc-nic will be created
  + resource "azurerm_network_interface" "mtc-nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "australiaeast"
      + mac_address                   = (known after apply)
      + name                          = "mtc-nic"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "mtc-resources"
      + tags                          = {
          + "environment" = "dev"
        }
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)    
          + name                                               = "internal"
          + primary                                            = (known after apply)    
          + private_ip_address                                 = (known after apply)    
          + private_ip_address_allocation                      = "Dynamic"
          + private_ip_address_version                         = "IPv4"
          + public_ip_address_id                               = (known after apply)    
          + subnet_id                                          = (known after apply)    
        }
    }

  # azurerm_network_security_group.mtc-sg will be created
  + resource "azurerm_network_security_group" "mtc-sg" {
      + id                  = (known after apply)
      + location            = "australiaeast"
      + name                = "mtc-sg"
      + resource_group_name = "mtc-resources"
      + security_rule       = (known after apply)
      + tags                = {
          + "environment" = "dev"
        }
    }

  # azurerm_network_security_rule.mtc-dev-rule will be created
  + resource "azurerm_network_security_rule" "mtc-dev-rule" {
      + access                      = "Allow"
      + destination_address_prefix  = "*"
      + destination_port_range      = "*"
      + direction                   = "Inbound"
      + id                          = (known after apply)
      + name                        = "mtc-dev-rule"
      + network_security_group_name = "mtc-sg"
      + priority                    = 100
      + protocol                    = "*"
      + resource_group_name         = "mtc-resources"
      + source_address_prefix       = "*"
      + source_port_range           = "*"
    }

  # azurerm_public_ip.mtc-ip will be created
  + resource "azurerm_public_ip" "mtc-ip" {
      + allocation_method       = "Dynamic"
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "australiaeast"
      + name                    = "mtc-ip"
      + resource_group_name     = "mtc-resources"
      + sku                     = "Basic"
      + sku_tier                = "Regional"
      + tags                    = {
          + "environment" = "dev"
        }
    }

  # azurerm_resource_group.mtc-rg will be created
  + resource "azurerm_resource_group" "mtc-rg" {
      + id       = (known after apply)
      + location = "australiaeast"
      + name     = "mtc-resources"
      + tags     = {
          + "environment" = "dev"
        }
    }

  # azurerm_subnet.mtc-subnet will be created
  + resource "azurerm_subnet" "mtc-subnet" {
      + address_prefixes                               = [
          + "10.123.1.0/24",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "mtc-subnet"
      + resource_group_name                            = "mtc-resources"
      + virtual_network_name                           = "mtc-network"
    }

  # azurerm_subnet_network_security_group_association.mtc-sga will be created
  + resource "azurerm_subnet_network_security_group_association" "mtc-sga" {
      + id                        = (known after apply)
      + network_security_group_id = (known after apply)
      + subnet_id                 = (known after apply)
    }

  # azurerm_virtual_network.mtc-vn will be created
  + resource "azurerm_virtual_network" "mtc-vn" {
      + address_space       = [
          + "10.123.0.0/16",
        ]
      + dns_servers         = (known after apply)
      + guid                = (known after apply)
      + id                  = (known after apply)
      + location            = "australiaeast"
      + name                = "mtc-network"
      + resource_group_name = "mtc-resources"
      + subnet              = (known after apply)
      + tags                = {
          + "environment" = "dev"
        }
    }

Plan: 8 to add, 0 to change, 0 to destroy.
```
