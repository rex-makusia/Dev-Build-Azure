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
- Run the ```terraform fmt``` and ```terraform plan```
- Go ahead now to run ```terraform apply -auto-approve```
```bash
$ ./terraform.exe apply -auto-approve 
azurerm_resource_group.mtc-rg: Refreshing state... [id=/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources]        
azurerm_virtual_network.mtc-vn: Refreshing state... [id=/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network]

Terraform used the selected providers to generate the following
execution plan. Resource actions are indicated with the following       
symbols:
  + create

Terraform will perform the following actions:

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

Plan: 1 to add, 0 to change, 0 to destroy.
azurerm_subnet.mtc-subnet: Creating...
azurerm_subnet.mtc-subnet: Creation complete after 7s [id=/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network/subnets/mtc-subnet]  

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Admin@SEA-DEV MINGW64 ~/Documents/Vault/Dev-Build-Azure (main)
$
```
- Verify again with the ```terraform state list``` command
```bash
$ ./terraform.exe state list
azurerm_resource_group.mtc-rg
azurerm_subnet.mtc-subnet
azurerm_virtual_network.mtc-vn
```
