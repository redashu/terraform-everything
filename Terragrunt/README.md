# Terragrunt: Overview, Benefits & Usage

---

## Concept of Terragrunt

Terraform is *powerful*, but as projects grow, some pain points appear:

- **Code duplication:** You repeat the same provider, backend, and variable blocks across multiple modules/environments.
- **Remote state configuration:** Each module needs S3/DynamoDB backend configs (repeated everywhere).
- **Dependencies between modules:** Example: You want VPC created before EC2, but Terraform itself doesn’t enforce ordering across separate modules.
- **DRY (Don't Repeat Yourself):** Terraform alone doesn’t have a native mechanism to share configurations easily across multiple environments (`dev/stage/prod`).
- **Multi-environment management:** With `dev`, `stage`, and `prod`, you’ll often copy-paste Terraform code into separate folders and tweak variables—messy.

👉 **Terragrunt** is a thin wrapper around Terraform that solves these.

---

## What is Terragrunt?

- **Terragrunt** is an open-source tool written in Go.
- It is a **wrapper for Terraform CLI**: When you run `terragrunt plan` or `terragrunt apply`, it internally calls Terraform, but with extra features.
- It focuses on:
  - Keeping your Terraform code **DRY**
  - **Managing remote state** automatically
  - **Handling dependencies** between modules
  - Structuring multi-environment repos in a **clean way**

---

## Why Use Terragrunt?

Here’s how it helps in real projects:

### a) DRY Principle (Don't Repeat Yourself)
- Instead of writing backend configs in every `main.tf`, you define remote state once in a root `terragrunt.hcl`.
- Child modules inherit it → **Less copy-paste.**

### b) Environment Management
- You can have a structure like:

```
live/
dev/
vpc/
ec2/
prod/
vpc/
ec2/
```

- Each environment just has a small `terragrunt.hcl` file with environment-specific inputs.
- The actual Terraform modules stay in `modules/`.

### c) Automatic Remote State Setup
- Terragrunt **auto-injects backend config (S3 + DynamoDB) into all modules**.
- No need to repeat backend `"s3"` everywhere.

### d) Dependency Management
- Example: EC2 depends on VPC ID.
- In Terraform, you pass it manually.
- In Terragrunt, you can **declare dependencies**, and it automatically fetches outputs from other modules.

### e) Run-All Commands
- `terragrunt plan-all` → runs plan in all child modules (in parallel).
- `terragrunt apply-all` → applies modules respecting dependencies.

### f) Multi-Cloud Ready
- **Same structure** works for AWS, Azure, GCP.

---

## Where Terragrunt Fits in Your Flow

- **Terraform alone** works great for small projects (one VPC + few EC2s).
- But if in a real-world team managing multiple environments, multiple accounts, 10–50 modules, Terragrunt gives you:
- **Cleaner repo**
- **Easier CI/CD integration**
- **Less human error** (remote state + backend enforced at root)

---

## ✅ In Summary

**Terragrunt is like Terraform++.**  
It doesn’t replace Terraform. Instead, it makes Terraform **manageable**, **DRY**, and **production-grade**.
