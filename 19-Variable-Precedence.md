# Variable Precedence

A ```tfvars file``` in Terraform is used to define input variables for a Terraform configuration. It’s a plain text file, typically written in HashiCorp Configuration Language (HCL) or JSON format., that contains variable assignments, making it easy to customize deployments without modifying the core configuration files. Using a tfvars file helps keep your configurations reusable and avoids hardcoding values.

```hcl
$ ./terraform console
> var.host_os
"windows"
>
```
