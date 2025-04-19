# Terraform Destory

- The ```terraform destory``` command will delete all the terraform project created.
- Run the ```terraform plan -destroy``` command
```bash
$ ./terraform.exe plan -destroy
azurerm_resource_group.mtc-rg: Refreshing state... [id=/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources]        
azurerm_virtual_network.mtc-vn: Refreshing state... [id=/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network]

Terraform used the selected providers to generate the following
execution plan. Resource actions are indicated with the following       
symbols:
  - destroy

Terraform will perform the following actions:

  # azurerm_resource_group.mtc-rg will be destroyed
  - resource "azurerm_resource_group" "mtc-rg" {
      - id       = "/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources" -> null
      - location = "australiaeast" -> null
      - name     = "mtc-resources" -> null
      - tags     = {
          - "environment" = "dev"
        } -> null
    }

  # azurerm_virtual_network.mtc-vn will be destroyed
  - resource "azurerm_virtual_network" "mtc-vn" {
      - address_space           = [
          - "10.123.0.0/16",
        ] -> null
      - dns_servers             = [] -> null
      - flow_timeout_in_minutes = 0 -> null
      - guid                    = "0f1072fc-9a9a-4e5c-9ef7-258ddad1d64d"
 -> null
      - id                      = "/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network" -> null
      - location                = "australiaeast" -> null
      - name                    = "mtc-network" -> null
      - resource_group_name     = "mtc-resources" -> null
      - subnet                  = [] -> null
      - tags                    = {
          - "environment" = "dev"
        } -> null
        # (2 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 2 to destroy.
```
