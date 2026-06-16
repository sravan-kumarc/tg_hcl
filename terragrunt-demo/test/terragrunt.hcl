terraform{
    source = "tfr:///terraform-aws-modules/ec2-instance/aws?version=6.4.0"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  instance_type = "t3.small"
  ami           = "ami-0e38835daf6b8a2b9"
  key_name      = "clieks"
  tags = {
    Name = "My EC2 Instance - TEST"
  }
}