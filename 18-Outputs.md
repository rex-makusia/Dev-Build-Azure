# Output
Utilizing outputs to display valuable information

- [Reference Docs](https://developer.hashicorp.com/terraform/language/values/outputs)
- Output Syntax
```hcl
output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
```
- Terraform State show
```hcl
$ ./terraform state show data.azurerm_public_ip.mtc-ip-data
# data.azurerm_public_ip.mtc-ip-data:
data "azurerm_public_ip" "mtc-ip-data" {
    allocation_method       = "Dynamic"
    domain_name_label       = null
    fqdn                    = null
    id                      = "/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/publicIPAddresses/mtc-ip"
    idle_timeout_in_minutes = 4
    ip_address              = "4.196.74.169"
    ip_tags                 = {}
    ip_version              = "IPv4"
    location                = "australiaeast"
    name                    = "mtc-ip"
    resource_group_name     = "mtc-resources"
    reverse_fqdn            = null
    sku                     = "Basic"
    tags                    = {
        "environment" = "dev"
    }
    zones                   = []
}
```
- Terraform apply ```-refresh-only```
```hcl
$ ./terraform apply -refresh-only 
azurerm_resource_group.mtc-rg: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources]
azurerm_public_ip.mtc-ip: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/publicIPAddresses/mtc-ip]
azurerm_virtual_network.mtc-vn: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network]
azurerm_network_security_group.mtc-sg: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/networkSecurityGroups/mtc-sg]
azurerm_subnet.mtc-subnet: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network/subnets/mtc-subnet]
data.azurerm_public_ip.mtc-ip-data: Reading...
azurerm_network_security_rule.mtc-dev-rule: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/networkSecurityGroups/mtc-sg/securityRules/mtc-dev-rule]
data.azurerm_public_ip.mtc-ip-data: Read complete after 0s [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/publicIPAddresses/mtc-ip]
azurerm_subnet_network_security_group_association.mtc-sga: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network/subnets/mtc-subnet]
azurerm_network_interface.mtc-nic: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/networkInterfaces/mtc-nic]
azurerm_linux_virtual_machine.mtc-vm: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Compute/virtualMachines/mtc-vm]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last       
"terraform apply" which may have affected this plan:

  # azurerm_network_interface.mtc-nic has changed
  ~ resource "azurerm_network_interface" "mtc-nic" {
        id                            = "/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/networkInterfaces/mtc-nic"
      - internal_domain_name_suffix   = "uetlfsf50nhepoeinzld3w5lxe.px.internal.cloudapp.net" -> null
        name                          = "mtc-nic"
        tags                          = {
            "environment" = "dev"
        }
        # (12 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # azurerm_public_ip.mtc-ip has changed
  ~ resource "azurerm_public_ip" "mtc-ip" {
        id                      = "/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/publicIPAddresses/mtc-ip"       
      ~ ip_address              = "4.197.88.149" -> "4.196.74.169"
        name                    = "mtc-ip"
        tags                    = {
            "environment" = "dev"
        }
        # (10 unchanged attributes hidden)
    }


This is a refresh-only plan, so Terraform will not take any actions to undo these. If   
you were expecting these changes then you can apply this plan to record the updated     
values in the Terraform state without changing any remote objects.

Would you like to update the Terraform state to reflect these detected changes?
  Terraform will write these changes to the state without modifying any real infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ git pull
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (3/3), 2.14 KiB | 156.00 KiB/s, done.
From https://github.com/rex-makusia/Dev-Build-Azure
   65e0612..e0e9613  main       -> origin/main
Updating 65e0612..e0e9613
Fast-forward
 17-Data-Source.md | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ ./terraform.state list
bash: ./terraform.state: No such file or directory

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ ./terraform state list
data.azurerm_public_ip.mtc-ip-data
azurerm_linux_virtual_machine.mtc-vm
azurerm_network_interface.mtc-nic
azurerm_network_security_group.mtc-sg
azurerm_network_security_rule.mtc-dev-rule
azurerm_public_ip.mtc-ip
azurerm_resource_group.mtc-rg
azurerm_subnet.mtc-subnet
azurerm_subnet_network_security_group_association.mtc-sga
azurerm_virtual_network.mtc-vn

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ git pull
remote: Enumerating objects: 8, done.
remote: Counting objects: 100% (8/8), done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 6 (delta 3), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (6/6), 2.10 KiB | 102.00 KiB/s, done.
From https://github.com/rex-makusia/Dev-Build-Azure
   e0e9613..c83c5ac  main       -> origin/main
Updating e0e9613..c83c5ac
Fast-forward
 18-Outputs.md | 10 ++++++++++
 main.tf       |  3 +++
 2 files changed, 13 insertions(+)
 create mode 100644 18-Outputs.md

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ git pull
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (3/3), 935 bytes | 103.00 KiB/s, done.
From https://github.com/rex-makusia/Dev-Build-Azure
   c83c5ac..d0afe5b  main       -> origin/main
Updating c83c5ac..d0afe5b
Fast-forward
 main.tf | 1 +
 1 file changed, 1 insertion(+)

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ ./terraform.state list data.azurerm_public_ip.mtc-ip-data
bash: ./terraform.state: No such file or directory

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ ./terraform state list data.azurerm_public_ip.mtc-ip-data
data.azurerm_public_ip.mtc-ip-data

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ ./terraform state show data.azurerm_public_ip.mtc-ip-data
# data.azurerm_public_ip.mtc-ip-data:
data "azurerm_public_ip" "mtc-ip-data" {
    allocation_method       = "Dynamic"
    domain_name_label       = null
    fqdn                    = null
    id                      = "/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/publicIPAddresses/mtc-ip"
    idle_timeout_in_minutes = 4
    ip_address              = "4.196.74.169"
    ip_tags                 = {}
    ip_version              = "IPv4"
    location                = "australiaeast"
    name                    = "mtc-ip"
    resource_group_name     = "mtc-resources"
    reverse_fqdn            = null
    sku                     = "Basic"
    tags                    = {
        "environment" = "dev"
    }
    zones                   = []
}

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ git pull 
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
Unpacking objects: 100% (3/3), 1.42 KiB | 132.00 KiB/s, done.
From https://github.com/rex-makusia/Dev-Build-Azure
   d0afe5b..d942cea  main       -> origin/main
Updating d0afe5b..d942cea
Fast-forward
 18-Outputs.md | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ ./terraform apply -refresh-only 
azurerm_resource_group.mtc-rg: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources]
azurerm_public_ip.mtc-ip: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/publicIPAddresses/mtc-ip]
azurerm_virtual_network.mtc-vn: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network]
azurerm_network_security_group.mtc-sg: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/networkSecurityGroups/mtc-sg]
azurerm_subnet.mtc-subnet: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network/subnets/mtc-subnet]
data.azurerm_public_ip.mtc-ip-data: Reading...
azurerm_network_security_rule.mtc-dev-rule: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/networkSecurityGroups/mtc-sg/securityRules/mtc-dev-rule]
azurerm_subnet_network_security_group_association.mtc-sga: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network/subnets/mtc-subnet]
azurerm_network_interface.mtc-nic: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/networkInterfaces/mtc-nic]
data.azurerm_public_ip.mtc-ip-data: Read complete after 1s [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/publicIPAddresses/mtc-ip]
azurerm_linux_virtual_machine.mtc-vm: Refreshing state... [id=/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Compute/virtualMachines/mtc-vm]

Changes to Outputs:
  + public_ip_address = "mtc-vm: 4.196.74.169"

You can apply this plan to save these new output values to the Terraform state, without 
changing any real infrastructure.

Would you like to update the Terraform state to reflect these detected changes?
  Terraform will write these changes to the state without modifying any real infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

public_ip_address = "mtc-vm: 4.196.74.169"

Admin@SEA-DEV MINGW64 /c/Vault/Dev-Build-Azure (main)
$ ./terraform output
public_ip_address = "mtc-vm: 4.196.74.169"
```
