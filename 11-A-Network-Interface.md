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
