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
- Run the ```terraform apply -destroy``` command
```bash
$ ./terraform.exe apply -destroy 
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

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

azurerm_virtual_network.mtc-vn: Destroying... [id=/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network]
azurerm_virtual_network.mtc-vn: Still destroying... [id=/subscriptions/fc85b008-38f6-4afe-9890-...ft.Network/virtualNetworks/mtc-network, 10s elapsed]
azurerm_virtual_network.mtc-vn: Destruction complete after 14s
azurerm_resource_group.mtc-rg: Destroying... [id=/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources]
azurerm_resource_group.mtc-rg: Still destroying... [id=/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources, 10s elapsed]
azurerm_resource_group.mtc-rg: Still destroying... [id=/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources, 20s elapsed]
azurerm_resource_group.mtc-rg: Destruction complete after 21s

Apply complete! Resources: 0 added, 0 changed, 2 destroyed.

Admin@SEA-DEV MINGW64 ~/Documents/Vault/Dev-Build-Azure (main)
$
```
- Re-create the resources again
```bash
$ ./terraform.exe apply -auto-approve

Terraform used the selected providers to generate the following
execution plan. Resource actions are indicated with the following       
symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.mtc-rg will be created
  + resource "azurerm_resource_group" "mtc-rg" {
      + id       = (known after apply)
      + location = "australiaeast"
      + name     = "mtc-resources"
      + tags     = {
          + "environment" = "dev"
        }
    }

  # azurerm_virtual_network.mtc-vn will be created
  + resource "azurerm_virtual_network" "mtc-vn" {
      + address_space       = [
          + "10.123.0.0/16",
        ]
      + dns_servers         = (known after apply)
      + guid                = (known after apply)
      + id                  = (known after apply)
      + location            = "australiaeast"
      + name                = "mtc-network"
      + resource_group_name = "mtc-resources"
      + subnet              = (known after apply)
      + tags                = {
          + "environment" = "dev"
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.
azurerm_resource_group.mtc-rg: Creating...
azurerm_resource_group.mtc-rg: Creation complete after 7s [id=/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources] 
azurerm_virtual_network.mtc-vn: Creating...
azurerm_virtual_network.mtc-vn: Creation complete after 10s [id=/subscriptions/fc85b008-38f6-4afe-9890-b914a964aa24/resourceGroups/mtc-resources/providers/Microsoft.Network/virtualNetworks/mtc-network]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

