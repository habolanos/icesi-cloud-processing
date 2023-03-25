# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "aws-icesi-2023"
}

resource "aws_instance" "servidor-01-aws" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor-01-aws"
  }
}

resource "aws_instance" "servidor-02" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor-02-aws"
  }
}

resource "aws_instance" "servidor-04" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor-04-ubuntu"
  }
}

resource "aws_instance" "servidor-05" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"

  tags = {
    Name = "servidor-05-ubuntu"
  }
}