# Terraform State

- In our Terraform project we have the ```terraform.tfstate``` file and the ```terraform.tfstate.backup``` file
- Run the ```terraform state list``` to view the state
```bash
$ ./terraform.exe state list
azurerm_resource_group.mtc-rg
azurerm_virtual_network.mtc-vn
```
- To view the details for each resoure
```bash
$ ./terraform.exe state show azurerm_resource_group.mtc-rg
# azurerm_resource_group.mtc-rg:
resource "azurerm_resource_group" "mtc-rg" {
    id       = "/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources"
    location = "australiaeast"
    name     = "mtc-resources"
    tags     = {
        "environment" = "dev"
    }
}
```
- To view the entire state file
```bash
# azurerm_resource_group.mtc-rg:
resource "azurerm_resource_group" "mtc-rg" {
    id       = "/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources"
    location = "australiaeast"
    name     = "mtc-resources"
    tags     = {
        "environment" = "dev"
    }
}
```
