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
-  Terraform run
```HCL
Admin@SEA-DEV MINGW64 /c/Dev-Build/Dev-Build-Azure (main)
$ ./terraform state list
azurerm_network_security_group.mtc-sg
azurerm_network_security_rule.mtc-dev-rule
azurerm_public_ip.mtc-ip
azurerm_resource_group.mtc-rg
azurerm_subnet.mtc-subnet
azurerm_subnet_network_security_group_association.mtc-sga
azurerm_virtual_network.mtc-vn

Admin@SEA-DEV MINGW64 /c/Dev-Build/Dev-Build-Azure (main)
$ ./terraform state show azurerm_public_ip.mtc-ip
# azurerm_public_ip.mtc-ip:
resource "azurerm_public_ip" "mtc-ip" {
    allocation_method       = "Dynamic"
    edge_zone               = null
    id                      = "/subscriptions/a6dcdeb5-a369-4951-999e-f27d42a1eb30/resourceGroups/mtc-resources/providers/Microsoft.Network/publicIPAddresses/mtc-ip"
    idle_timeout_in_minutes = 4
    ip_address              = null
    ip_version              = "IPv4"
    location                = "australiaeast"
    name                    = "mtc-ip"
    resource_group_name     = "mtc-resources"
    sku                     = "Basic"
    sku_tier                = "Regional"
    tags                    = {
        "environment" = "dev"
    }
}
```
