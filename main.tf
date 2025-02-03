provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                    = 4
  ami                      = "ami-0f214d1b3d031dc53"  # AMI ID (make sure it's correct)
  instance_type            = "t2.micro"
  key_name                 = "keys_ec2"
  vpc_security_group_ids   = ["sg-0cd50267c97e57021"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_instance" "two" {
  ami                      = "ami-0f214d1b3d031dc53"
  instance_type            = "t2.medium"
  key_name                 = "keys_ec2"
  vpc_security_group_ids   = ["sg-0cd50267c97e57021"]
  tags = {
    Name = "Nexus"
  }
}

variable "instance_names" {
  default = ["jenkins", "AppServer-1", "AppServer-2", "Monitoring server"]
}

