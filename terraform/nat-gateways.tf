resource "aws_nat_gateway" "nat_gw_a" {
  allocation_id = aws_eip.eip_a.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    "Name"    = "NAT gw A"
    "Project" = var.resource_tag
  }
}

resource "aws_nat_gateway" "nat_gw_b" {
  allocation_id = aws_eip.eip_b.id
  subnet_id     = aws_subnet.public_b.id

  tags = {
    "Name"    = "NAT gw B"
    "Project" = var.resource_tag
  }
}