# Output
Utilizing outputs to display valuable information

- [Reference Docs](https://developer.hashicorp.com/terraform/language/values/outputs)
- Output Syntax
```hcl
output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
```
- State show
```hcl
$ ./terraform state show data.azurerm_public_ip.mtc-ip-data
# data.azurerm_public_ip.mtc-ip-data:
data "azurerm_public_ip" "mtc-ip-data" {
    allocation_method       = "Dynamic"
    domain_name_label       = null
    fqdn                    = null
    id                      = "/subscriptions/47326273-dc21-48de-a246-1e8bc30f2577/resourceGroups/mtc-resources/providers/Microsoft.Network/publicIPAddresses/mtc-ip"
    idle_timeout_in_minutes = 4
    ip_address              = "4.196.74.169"
    ip_tags                 = {}
    ip_version              = "IPv4"
    location                = "australiaeast"
    name                    = "mtc-ip"
    resource_group_name     = "mtc-resources"
    reverse_fqdn            = null
    sku                     = "Basic"
    tags                    = {
        "environment" = "dev"
    }
    zones                   = []
}
```
