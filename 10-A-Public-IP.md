# A Public IP

- Give our furture virtual machine to the Internet by using a Public IP.
- We will use the [Azure Public IP Resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)
- Starter configuration
```HCL
resource "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
```
