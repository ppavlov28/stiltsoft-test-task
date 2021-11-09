resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"    = "Public subnet A"
    "Project" = var.resource_tag
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.21.0/24"
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"    = "Public subnet B"
    "Project" = var.resource_tag
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    "Name"    = "Private subnet A"
    "Project" = var.resource_tag
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    "Name"    = "Private subnet B"
    "Project" = var.resource_tag
  }
}
