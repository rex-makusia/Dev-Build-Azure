# The Terraform DataSource
Data Source are ways we can query items from the provider in this case Azure API and utilize it within our code.
- A data source is accessed via a special kind of resource known as a data resource, declared using a data block
- Refer to the
  - [HashiCorp Data Source](https://developer.hashicorp.com/terraform/language/data-sources)
  - [Terraform Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/image)

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


Apply complete! Resources: 0 added, 0 changed, 0 destroyed
```
