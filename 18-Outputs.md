# Output
Utilizing outputs to display valuable information

- [Reference Docs](https://developer.hashicorp.com/terraform/language/values/outputs)
- Output Syntax
```hcl
output "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
```
