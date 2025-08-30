## How to migration local terraform state to remote

```
terraform init -migrate-state
```

### to update tfstate file if so changes in realinfra

```
terraform refresh # deprecated 
terraform apply -refresh-only

```