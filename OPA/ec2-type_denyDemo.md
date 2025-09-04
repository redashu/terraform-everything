# Simple Demo (Local)

## Step 1: Install OPA

```sh
curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
chmod +x opa
mv opa /usr/local/bin/
```

## Step 2: Create a Policy File (`policy.rego`)

```rego
package terraform

deny[msg] {
    input.resource_changes[_].type == "aws_instance"
    input.resource_changes[_].change.after.instance_type == "t2.micro"
    msg = "t2.micro instances are not allowed!"
}
```

## Step 3: Run Terraform Plan on AWS EC2

```hcl
resource "aws_instance" "demo" {
    ami           = "ami-0861f4e788f5069dd"
    instance_type = "t2.micro"   # This should be blocked
}
```

## Run the Following Commands

```sh
terraform plan -out=tfplan.binary
terraform show -json tfplan.binary > tfplan.json
opa eval --data policy.rego --input tfplan.json "data.terraform.deny"
```

➡️ **Output:**

```json
[
    "t2.micro instances are not allowed!"
]
```

OPA catches the violation.