# A Security Group

- Review the [Azure Network Security Group ](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group)documentation
- Deploy our security group as a different resource
- Terraform state listing
```terraform
Admin@SEA-DEV MINGW64 /c/Dev-Build/Dev-Build-Azure (main)
$ ./terraform state list
azurerm_network_security_group.mtc-sg
azurerm_network_security_rule.mtc-dev-rule
azurerm_resource_group.mtc-rg
azurerm_subnet.mtc-subnet
azurerm_virtual_network.mtc-vn
```
