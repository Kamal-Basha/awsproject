terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region     = "ap-northeast-1"
  access_key = "AKIAU6CVY2DNYB6BQ6O4"
  secret_key = "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"
}
resource "aws_instance" "web1" {
  ami           = "ami-0ffac3e16de16665e"
  instance_type = "t2.micro"
  security_groups= [aws_security_group.tf-TG.name]
  tags = {
    Name = "HelloWorld1"
  }
}
resource "aws_security_group" "tf-TG" {
  name        = "tf-TG"
  description = "terraform-tg"
  vpc_id      = "vpc-037ee573243bff6e0"

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      =["0.0.0.0/0"]
    ipv6_cidr_blocks =["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      =["0.0.0.0/0"]
    ipv6_cidr_blocks =["::/0"]
  }
  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      =["0.0.0.0/0"]
    ipv6_cidr_blocks =["::/0"]


  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "tf-TG"
  }
}
