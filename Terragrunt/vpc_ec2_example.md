# Understanding the Example

```
infrastructure-live/
├── terragrunt.hcl         # Root settings (remote backend, provider, etc.)
├── dev/
│   ├── vpc/terragrunt.hcl
│   └── ec2/terragrunt.hcl
├── prod/
│   ├── vpc/terragrunt.hcl
│   └── ec2/terragrunt.hcl
infrastructure-modules/
├── vpc/
│   └── main.tf
└── ec2/
    └── main.tf
```

## 1. Without Terragrunt (Plain Terraform)

Managing multiple environments (e.g., `dev` and `prod`) typically looks like:

```
terraform/
├── dev/
│   ├── vpc.tf
│   └── ec2.tf
├── prod/
│   ├── vpc.tf
│   └── ec2.tf
```

Each environment repeats the same code (VPC, EC2, etc.), with only minor differences (CIDR ranges, instance types, etc.).

> **Drawback:**  
> This breaks [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) (Don’t Repeat Yourself).  
> You end up copy-pasting code, which is hard to maintain.

## 2. With Terragrunt

You split your setup into two main directories:

- **infrastructure-modules/**  
  Contains generic Terraform modules (reusable building blocks).  
  - Example: `vpc/main.tf` defines how to create a VPC.  
  - Example: `ec2/main.tf` defines how to create an EC2 instance.

- **infrastructure-live/**  
  Contains environment-specific Terragrunt configurations that reference the modules.  
  - Example: `dev/vpc/terragrunt.hcl` says “use the vpc module with these dev-specific inputs”.  
  - Example: `prod/ec2/terragrunt.hcl` says “use the ec2 module with prod-specific inputs”.

## 3. Where DRY Comes In

- **Backend config, provider config, tags, etc.:**  
  Instead of repeating them in every module, put them once in `infrastructure-live/terragrunt.hcl` (root).  
  Terragrunt makes all children automatically inherit these settings.

- **Module code:**  
  Write it once in `infrastructure-modules/`. All environments reuse it.

- **Environment inputs:**  
  Only the variables change between dev and prod (like CIDR block, instance type).

Instead of copy-pasting 50 lines of VPC code per environment, each environment just has ~5 lines in Terragrunt:

```hcl
terraform {
  source = "../../../infrastructure-modules/vpc"
}

inputs = {
  cidr_block = "10.0.0.0/16"
}
```

## 4. Flow (How It Works)

1. Run `terragrunt apply` inside `infrastructure-live/dev/vpc/`.
2. Terragrunt reads `terragrunt.hcl` there.
3. It sees the `terraform { source = … }` block and pulls code from `infrastructure-modules/vpc`.
4. Merges in shared configs from parent `infrastructure-live/terragrunt.hcl`.
5. Runs Terraform with the right module and inputs.

---

**Result:**

- Code is modular, reusable, and clean.
- Dev and Prod use the same modules, just with different inputs.
- One change in a module affects all environments safely.