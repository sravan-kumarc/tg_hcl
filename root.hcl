# When using this terragrunt config, terragrunt will generate the file "provider.tf" with the aws provider block before
# calling to OpenTofu/Terraform. Note that this will overwrite the `provider.tf` file if it already exists.
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
provider "aws" {
  region              = "ap-south-1"
}
EOF
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "testbucketcreatedbysravankumar"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-south-1"
    
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }


}