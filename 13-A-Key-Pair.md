# A Key Pair
Create a SSH Key Pair that will be used by the Linux Virtual  Machine we created and we can perform ssh functions
- Sample SSH Configuration
```HCL
 admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
```
- Run a ```ssh-key -t rsa``` on a our terminal
```Bash
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/Admin/.ssh/id_rsa): 
Created directory '/c/Users/Admin/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /c/Users/Admin/.ssh/id_rsa        
Your public key has been saved in /c/Users/Admin/.ssh/id_rsa.pub        
The key fingerprint is:
```
- terraform plan and apply
```Bash
$ ./terraform plan

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_linux_virtual_machine.mtc-vm will be created
  + resource "azurerm_linux_virtual_machine" "mtc-vm" {
      + admin_username                  = "adminuser"
      + allow_extension_operations      = true
      + computer_name                   = (known after apply)
      + disable_password_authentication = true
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "australiaeast"
      + max_bid_price                   = -1
      + name                            = "mtc-vm"
      + network_interface_ids           = (known after apply)
      + patch_mode                      = "ImageDefault"
      + platform_fault_domain           = -1
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "mtc-resources"
      + size                            = "Standard_B1s"
      + tags                            = {
          + "environment" = "dev"
        }
      + virtual_machine_id              = (known after apply)

      + admin_ssh_key {
          + public_key = <<-EOT
                ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCkgM04DzJ9mDY/pKf5kOKLI2KQbnGuCi9uRtJ4KjqqnXVj/CocMFxYAIFpA59br0JiaL+gLtVPFRP2MgrpCQdjHPYvq9oJvEPygr8Y/FgBh5dy6TB/+tTf1Tiab/5GR43voEsq+1mAefHGc/5/FLjVQJhNakfdVJEtIMLUKOSKbFB6DjkA66btD5QCgpRYK5ubLu1m1dADUqj1Lf12quAJSqrdeSRvYCf1RXfFLTk7Hd8J43hTFoBzSQcmXuGDGODoWUO7IWypN7aNAk6IMapU8WbD6FEeNVxCnqJJJVQ+NFpxSFVkrDVeV754aGk/0sXoYWgxBX6fdXTJDYI0aLxe6DYpfi5DLDm6olwF3tFwrVrFeAS31P2k1yDYgIEsxo+uzZklz1Zi30m39HuS2NBYoQFsgKjZQ/pS6F3sA5IGdXCi7QniRXfBxWF0LwsAObqdEvknYIwusaEtx+dnR/tefvme26+9A+WqLmnETgkkjb7mNxitvRT4Mabgek4vsa8= Admin@SEA-DEV
            EOT
          + username   = "adminuser"
        }

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = (known after apply)
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }

      + source_image_reference {
          + offer     = "UbuntuServer"
          + publisher = "Canonical"
          + sku       = "18.04-LTS"
          + version   = "latest"
        }

      + termination_notification (known after apply)
    }

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

Plan: 9 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to 
take exactly these actions if you run "terraform apply" now.

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ ./terraform apply -auto-approve 

Interrupt received.
Please wait for Terraform to exit or data loss may occur.
Gracefully shutting down...


Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_linux_virtual_machine.mtc-vm will be created
  + resource "azurerm_linux_virtual_machine" "mtc-vm" {
      + admin_username                  = "adminuser"
      + allow_extension_operations      = true
      + computer_name                   = (known after apply)
      + disable_password_authentication = true
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "australiaeast"
      + max_bid_price                   = -1
      + name                            = "mtc-vm"
      + network_interface_ids           = (known after apply)
      + patch_mode                      = "ImageDefault"
      + platform_fault_domain           = -1
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "mtc-resources"
      + size                            = "Standard_B1s"
      + tags                            = {
          + "environment" = "dev"
        }
      + virtual_machine_id              = (known after apply)

      + admin_ssh_key {
          + public_key = <<-EOT
                ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCkgM04DzJ9mDY/pKf5kOKLI2KQbnGuCi9uRtJ4KjqqnXVj/CocMFxYAIFpA59br0JiaL+gLtVPFRP2MgrpCQdjHPYvq9oJvEPygr8Y/FgBh5dy6TB/+tTf1Tiab/5GR43voEsq+1mAefHGc/5/FLjVQJhNakfdVJEtIMLUKOSKbFB6DjkA66btD5QCgpRYK5ubLu1m1dADUqj1Lf12quAJSqrdeSRvYCf1RXfFLTk7Hd8J43hTFoBzSQcmXuGDGODoWUO7IWypN7aNAk6IMapU8WbD6FEeNVxCnqJJJVQ+NFpxSFVkrDVeV754aGk/0sXoYWgxBX6fdXTJDYI0aLxe6DYpfi5DLDm6olwF3tFwrVrFeAS31P2k1yDYgIEsxo+uzZklz1Zi30m39HuS2NBYoQFsgKjZQ/pS6F3sA5IGdXCi7QniRXfBxWF0LwsAObqdEvknYIwusaEtx+dnR/tefvme26+9A+WqLmnETgkkjb7mNxitvRT4Mabgek4vsa8= Admin@SEA-DEV
            EOT
          + username   = "adminuser"
        }

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = (known after apply)
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }

      + source_image_reference {
          + offer     = "UbuntuServer"
          + publisher = "Canonical"
          + sku       = "18.04-LTS"
          + version   = "latest"
        }

      + termination_notification (known after apply)
    }

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

Plan: 9 to add, 0 to change, 0 to destroy.
╷
│ Error: execution halted
│
│
╵

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ ./terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_linux_virtual_machine.mtc-vm will be created
  + resource "azurerm_linux_virtual_machine" "mtc-vm" {
      + admin_username                  = "adminuser"
      + allow_extension_operations      = true
      + computer_name                   = (known after apply)
      + disable_password_authentication = true
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "australiaeast"
      + max_bid_price                   = -1
      + name                            = "mtc-vm"
      + network_interface_ids           = (known after apply)
      + patch_mode                      = "ImageDefault"
      + platform_fault_domain           = -1
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "mtc-resources"
      + size                            = "Standard_B1s"
      + tags                            = {
          + "environment" = "dev"
        }
      + virtual_machine_id              = (known after apply)

      + admin_ssh_key {
          + public_key = <<-EOT
                ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCkgM04DzJ9mDY/pKf5kOKLI2KQbnGuCi9uRtJ4KjqqnXVj/CocMFxYAIFpA59br0JiaL+gLtVPFRP2MgrpCQdjHPYvq9oJvEPygr8Y/FgBh5dy6TB/+tTf1Tiab/5GR43voEsq+1mAefHGc/5/FLjVQJhNakfdVJEtIMLUKOSKbFB6DjkA66btD5QCgpRYK5ubLu1m1dADUqj1Lf12quAJSqrdeSRvYCf1RXfFLTk7Hd8J43hTFoBzSQcmXuGDGODoWUO7IWypN7aNAk6IMapU8WbD6FEeNVxCnqJJJVQ+NFpxSFVkrDVeV754aGk/0sXoYWgxBX6fdXTJDYI0aLxe6DYpfi5DLDm6olwF3tFwrVrFeAS31P2k1yDYgIEsxo+uzZklz1Zi30m39HuS2NBYoQFsgKjZQ/pS6F3sA5IGdXCi7QniRXfBxWF0LwsAObqdEvknYIwusaEtx+dnR/tefvme26+9A+WqLmnETgkkjb7mNxitvRT4Mabgek4vsa8= Admin@SEA-DEV
            EOT
          + username   = "adminuser"
        }

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = (known after apply)
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }

      + source_image_reference {
          + offer     = "UbuntuServer"
          + publisher = "Canonical"
          + sku       = "18.04-LTS"
          + version   = "latest"
        }

      + termination_notification (known after apply)
    }

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

Plan: 9 to add, 0 to change, 0 to destroy.
azurerm_resource_group.mtc-rg: Creating...
azurerm_resource_group.mtc-rg: Creation complete after 2s [id=/subscriptions/450780e2-c7f3-4798-a2e3-6ce41665137e/resourceGroups/mtc-resources]
azurerm_network_security_group.mtc-sg: Creating...
azurerm_public_ip.mtc-ip: Creating...
azurerm_virtual_network.mtc-vn: Creating...
azurerm_public_ip.mtc-ip: Creation complete after 8s [id=/subscriptions/450780e2-c7f3-4798-a2e3-6ce41665137e/resourceGroups/mtc-resources/providers/Microsoft.Network/publicIPAddresses/mtc-ip]
azurerm_network_security_group.mtc-sg: Creation complete after 10s [id=/subscriptions/450780e2-c7f3-4798-a2e3-6ce41665137e/resourceGroups/mtc-resources/providers/Microsoft.Network/networkSecurityGroups/mtc-sg]
azurerm_network_security_rule.mtc-dev-rule: Creating...
azurerm_virtual_network.mtc-vn: Still creating... [10s elapsed]
azurerm_virtual_network.mtc-vn: Creation complete after 12s [id=/subscriptions/450780e2-c7f3-4798-a2e3-6ce41665137e/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network]
azurerm_subnet.mtc-subnet: Creating...
azurerm_network_security_rule.mtc-dev-rule: Creation complete after 4s [id=/subscriptions/450780e2-c7f3-4798-a2e3-6ce41665137e/resourceGroups/mtc-resources/providers/Microsoft.Network/networkSecurityGroups/mtc-sg/securityRules/mtc-dev-rule]
azurerm_subnet.mtc-subnet: Creation complete after 7s [id=/subscriptions/450780e2-c7f3-4798-a2e3-6ce41665137e/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network/subnets/mtc-subnet]
azurerm_subnet_network_security_group_association.mtc-sga: Creating...
azurerm_network_interface.mtc-nic: Creating...
azurerm_subnet_network_security_group_association.mtc-sga: Creation complete after 7s [id=/subscriptions/450780e2-c7f3-4798-a2e3-6ce41665137e/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network/subnets/mtc-subnet]
azurerm_network_interface.mtc-nic: Still creating... [10s elapsed]
azurerm_network_interface.mtc-nic: Creation complete after 12s [id=/subscriptions/450780e2-c7f3-4798-a2e3-6ce41665137e/resourceGroups/mtc-resources/providers/Microsoft.Network/networkInterfaces/mtc-nic]
azurerm_linux_virtual_machine.mtc-vm: Creating...
azurerm_linux_virtual_machine.mtc-vm: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.mtc-vm: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.mtc-vm: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.mtc-vm: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.mtc-vm: Still creating... [50s elapsed]
azurerm_linux_virtual_machine.mtc-vm: Creation complete after 55s [id=/subscriptions/450780e2-c7f3-4798-a2e3-6ce41665137e/resourceGroups/mtc-resources/providers/Microsoft.Compute/virtualMachines/mtc-vm]

Apply complete! Resources: 9 added, 0 changed, 0 destroyed.
```
```HCL
$ ./terraform state show azurerm_linux_virtual_machine.mtc-vm
# azurerm_linux_virtual_machine.mtc-vm:
resource "azurerm_linux_virtual_machine" "mtc-vm" {
    admin_username                  = "adminuser"
    allow_extension_operations      = true
    availability_set_id             = null
    computer_name                   = "mtc-vm"
    dedicated_host_group_id         = null
    dedicated_host_id               = null
    disable_password_authentication = true
    edge_zone                       = null
    encryption_at_host_enabled      = false
    eviction_policy                 = null
    extensions_time_budget          = "PT1H30M"
    id                              = "/subscriptions/450780e2-c7f3-4798-a2e3-6ce41665137e/resourceGroups/mtc-resources/providers/Microsoft.Compute/virtualMachines/mtc-vm"
    license_type                    = null
    location                        = "australiaeast"
    max_bid_price                   = -1
    name                            = "mtc-vm"
    network_interface_ids           = [
        "/subscriptions/450780e2-c7f3-4798-a2e3-6ce41665137e/resourceGroups/mtc-resources/providers/Microsoft.Network/networkInterfaces/mtc-nic",
    ]
    patch_mode                      = "ImageDefault"
    platform_fault_domain           = -1
    priority                        = "Regular"
    private_ip_address              = "10.123.1.4"
    private_ip_addresses            = [
        "10.123.1.4",
    ]
    provision_vm_agent              = true
    proximity_placement_group_id    = null
    public_ip_address               = "13.75.129.27"
    public_ip_addresses             = [
        "13.75.129.27",
    ]
    resource_group_name             = "mtc-resources"
    secure_boot_enabled             = false
    size                            = "Standard_B1s"
    source_image_id                 = null
    tags                            = {
        "environment" = "dev"
    }
    user_data                       = null
    virtual_machine_id              = "d75349bb-6430-4544-a364-f788bceec68b"
    virtual_machine_scale_set_id    = null
    vtpm_enabled                    = false
    zone                            = null

    admin_ssh_key {
        public_key = <<-EOT
            ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCkgM04DzJ9mDY/pKf5kOKLI2KQbnGuCi9uRtJ4KjqqnXVj/CocMFxYAIFpA59br0JiaL+gLtVPFRP2MgrpCQdjHPYvq9oJvEPygr8Y/FgBh5dy6TB/+tTf1Tiab/5GR43voEsq+1mAefHGc/5/FLjVQJhNakfdVJEtIMLUKOSKbFB6DjkA66btD5QCgpRYK5ubLu1m1dADUqj1Lf12quAJSqrdeSRvYCf1RXfFLTk7Hd8J43hTFoBzSQcmXuGDGODoWUO7IWypN7aNAk6IMapU8WbD6FEeNVxCnqJJJVQ+NFpxSFVkrDVeV754aGk/0sXoYWgxBX6fdXTJDYI0aLxe6DYpfi5DLDm6olwF3tFwrVrFeAS31P2k1yDYgIEsxo+uzZklz1Zi30m39HuS2NBYoQFsgKjZQ/pS6F3sA5IGdXCi7QniRXfBxWF0LwsAObqdEvknYIwusaEtx+dnR/tefvme26+9A+WqLmnETgkkjb7mNxitvRT4Mabgek4vsa8= Admin@SEA-DEV
        EOT
        username   = "adminuser"
    }

    os_disk {
        caching                   = "ReadWrite"
        disk_encryption_set_id    = null
        disk_size_gb              = 30
        name                      = "mtc-vm_OsDisk_1_3deb72312bbb4acc8ebfc0d309352353"  
        storage_account_type      = "Standard_LRS"
        write_accelerator_enabled = false
    }

    source_image_reference {
        offer     = "UbuntuServer"
        publisher = "Canonical"
        sku       = "18.04-LTS"
        version   = "latest"
    }
```
- ssh  login
```
$ ssh -i ~/.ssh/id_mtc adminuser@13.75.129.27
The authenticity of host '13.75.129.27 (13.75.129.27)' can't be established.
ED25519 key fingerprint is SHA256:1AJcXqPbQStm+QVP3U0WL7uie1jug30I8z0vuudw0oY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yesWarning: Permanently added '13.75.129.27' (ED25519) to the list of known hosts.
Welcome to Ubuntu 18.04.6 LTS (GNU/Linux 5.4.0-1109-azure x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sun Apr 27 12:41:36 UTC 2025

  System load:  0.08              Processes:           105
  Usage of /:   4.5% of 28.89GB   Users logged in:     0
  Memory usage: 20%               IP address for eth0: 10.123.1.4       
  Swap usage:   0%

Expanded Security Maintenance for Infrastructure is not enabled.        

0 updates can be applied immediately.

Enable ESM Infra to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the      
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by    
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

adminuser@mtc-vm:~$
adminuser@mtc-vm:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.6 LTS
Release:        18.04
Codename:       bionic
adminuser@mtc-vm:~$
```
