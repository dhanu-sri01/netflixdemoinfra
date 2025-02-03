provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                    = 5
  ami                      = "ami-0f214d1b3d031dc53"  # AMI ID (make sure it's correct)
  instance_type            = "t2.micro"
  key_name                 = "keys_ec2"
  vpc_security_group_ids   = ["sg-0cd50267c97e57021"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins","nexus" "AppServer-1", "AppServer-2", "Monitoring server"]
}

