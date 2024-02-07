provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ubuntu_instance" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name      = "terraform-key"

  tags = {
    Name = "ubuntu-nginx-instance"
  }

  user_data = file("install_nginx.sh")
}
