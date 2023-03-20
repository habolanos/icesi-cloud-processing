# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "aws-icesi-2023"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_vpc" "default" {
	default = true
}

# Crear instancia ec2

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "servidor-web"
  }
}

# Crear una segunda y tercera instancia de EC2

resource "aws_instance" "servidor-backend" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor-backend"
  }
}

resource "aws_instance" "servidor-bd" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor-bd"
  }
}

resource "aws_instance" "servidor-firewall" {
  ami           = "ami-09a41e26df464c548"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor-firewall"
  }
}