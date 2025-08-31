# Inherit root settings (remote_state, etc.)
include {
  path = find_in_parent_folders()
}

# Environment-specific locals
locals {
  aws_region  = "ap-south-1"
  environment = "dev"
}

# Pass provider info to modules
inputs = {
  region = local.aws_region
  Env    = local.environment
}
