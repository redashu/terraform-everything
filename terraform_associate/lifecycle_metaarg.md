🔹 Lifecycle Meta-Arguments in Terraform
1. create_before_destroy

Ensures a new resource is created before the old one is destroyed.

Prevents downtime for replaceable resources.

lifecycle {
  create_before_destroy = true
}

2. prevent_destroy

Protects critical resources from accidental deletion.

Terraform will error out if destroy is attempted.

lifecycle {
  prevent_destroy = true
}

3. ignore_changes

Ignores changes to specific arguments.

Useful when some attributes are managed outside Terraform (e.g., tags, user_data).

lifecycle {
  ignore_changes = [tags, user_data]
}

4. replace_triggered_by ✅ (since Terraform 0.13+)

Explicitly defines dependencies that will trigger replacement of this resource.

Example: If a subnet changes, recreate the instance.

lifecycle {
  replace_triggered_by = [
    aws_subnet.my_subnet
  ]
}


or trigger replacement when a variable changes:

lifecycle {
  replace_triggered_by = [var.ami_id]
}

5. precondition / postcondition ✅ (since 1.2+)

Lets you add validation rules inside resources.

Example: only allow t2.micro in dev.

lifecycle {
  precondition {
    condition     = var.env == "dev" ? self.instance_type == "t2.micro" : true
    error_message = "Only t2.micro is allowed in dev!"
  }

  postcondition {
    condition     = self.public_ip != null
    error_message = "Instance must have a public IP!"
  }
}

✅ Summary of Lifecycle Options
Lifecycle Option	Purpose
create_before_destroy	Avoid downtime by creating new first
prevent_destroy	Protect resource from deletion
ignore_changes	Ignore drift or manual changes
replace_triggered_by	Explicit dependency-triggered replacement
precondition / postcondition	Add validation rules for safety
