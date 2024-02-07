provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "instance_security_group" {
  name        = "instance-security-group"
  description = "Allow all traffic and SSH from anywhere"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example_ec2" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"

  security_groups = [aws_security_group.instance_security_group.name]
}
