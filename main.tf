provider "aws" {
  region = "eu-west-2"
}

# create vpc
resource "aws_vpc" "static_web_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.static_web_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.static_web_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "Main"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.static_web_vpc.id

  route = []

  tags = {
    Name = "Main"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.static_web_vpc.id

  route = []

  tags = {
    Name = "Main"
  }
}

resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_internet_gateway" "static_web_igw" {
  vpc_id = aws_vpc.static_web_vpc.id

  tags = {
    Name = "prod-igw"
  }
}

resource "aws_route" "public-internet-route" {
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id   = aws_internet_gateway.static_web_igw.id
}

# create security group for EC2
resource "aws_security_group" "static_web_ec2" {
  name        = "static_web_ec2"
  description = "security group for static web hosting"
  vpc_id      = aws_vpc.static_web_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }

  tags = {
    Name = "Main"
  }
}


