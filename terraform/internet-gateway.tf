resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name"    = "Main GW"
    "Project" = var.resource_tag
  }
}