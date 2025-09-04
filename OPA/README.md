## Why Policies & Drift Detection Are Important
### 🚩 The Problem

In cloud environments, teams often provision resources using **Terraform** or **Terragrunt**.

**Risks include:**
- A developer might create an unsecured S3 bucket (publicly accessible).
- Someone could launch an EC2 instance without tags (making it hard to track).
- Manual changes in the AWS console can cause Terraform state to drift from reality.

### 🛠️ The Solution

- **OPA (Open Policy Agent):** Enables "Policy as Code"—define rules that infrastructure must follow.
- **Drift Detection:** Identifies when infrastructure changes outside of Terraform.

**Benefits:**
- **Security:** Prevent public S3 buckets.
- **Compliance:** Enforce encryption and tagging standards.
- **Consistency:** Ensure code matches real infrastructure, avoiding drift.

---

#### What is OPA (Open Policy Agent)?

OPA is a policy engine that evaluates JSON input (like Terraform plan output).

Policies are written in the **Rego** language.

You define rules like:

- “All resources must have Owner tag.”
- “EC2 instances must not be larger than t3.medium.”
- “No security groups with 0.0.0.0/0 allowed.”

**Example Policy (English):**  
_Deny S3 buckets without encryption._

**Rego Code:**
```rego
package terraform

deny[msg] {
   some r
   input.resource_changes[r].type == "aws_s3_bucket"
   not input.resource_changes[r].change.after.server_side_encryption_configuration
   msg = sprintf("Bucket %s must have encryption enabled", [input.resource_changes[r].name])
}
```

If a Terraform plan creates an S3 bucket without encryption, this policy denies it.

---

#### OPA Workflow with Terraform

1. **Run Terraform plan:**
    ```sh
    terraform plan -out=tfplan.binary
    terraform show -json tfplan.binary > tfplan.json
    ```
    _Produces JSON with details of all infrastructure changes._

2. **Run OPA evaluation:**
    ```sh
    opa eval --data policy.rego --input tfplan.json "data.terraform.deny"
    ```
    _If any deny rules trigger, stop Terraform apply._


