# Root Terragrunt: global settings like remote state
remote_state {
  backend = "s3"
  config = {
    bucket         = "ashubackstores111"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "ashu-lock-table1"
    encrypt        = true
  }
}

# Optional: global locals
locals {
  company = "ashu-inc"
}
