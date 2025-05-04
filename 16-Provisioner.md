# The Provioner and Template File

You can use provisioners to model specific actions on the local machine or on a remote machine in order to prepare servers 
or other infrastructure objects for service.
- [Provisioner Syntax](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)
-Applying the Terraform replace
```HCL
$ terraform apply -replace auzrerm_linux_virtual_machine.mtc-vm
```
Fix ssh
```bash
Admin@SEA-DEV MINGW64 ~/.ssh
$ eval "$(ssh-agent -s)"
Agent pid 2673

Admin@SEA-DEV MINGW64 ~/.ssh
$ ssh-add ~/.ssh/id_mtc
Identity added: /c/Users/Admin/.ssh/id_mtc (Admin@SEA-DEV)
```
