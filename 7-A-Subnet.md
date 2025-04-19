# A Subnet 

- Review the [Azure Subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) Resource on the Terraform Registry
- Adding the resource into the ```main.tf`` file
```bash
resource "azurerm_subnet" "mtc-subnet" {
  name                 = "mtc-subnet"
  resource_group_name  = azurerm_resource_group.mtc-rg.name
  virtual_network_name = azurerm_virtual_network.mtc-vn.name
  address_prefixes     = ["10.123.1.0/24"]
}
```
- Run the ```terraform fmt``` and ```terraform apply```
