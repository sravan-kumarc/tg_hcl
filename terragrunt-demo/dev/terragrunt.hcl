terraform{
    source = "tfr:///terraform-aws-modules/ec2-instance/aws?version=6.4.0"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  instance_type = "t3.micro"
  ami           = "ami-0e38835daf6b8a2b9"
  key_name      = "clieks"
  subnet_id  = "subnet-0f6b70d424b4b9d29"

  vpc_security_group_ids = []
  create_security_group = true

  security_group_rules =[
    {
      type = "ingress"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello from user_data" > /var/tmp/hello.txt
              EOF

  tags = {
    Name = "My EC2 Instance -dev"
  }
}
