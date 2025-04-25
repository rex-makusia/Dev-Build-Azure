# A Security Group Association

Associates a Network Security Group with a Subnet within a Virtual Network.

- Review the  Azure Provider documentation for [Azure Subnet Network Group Association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association)
- Starter confuguration
```HCL
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}
```
