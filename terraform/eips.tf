resource "aws_eip" "eip_a" {

  depends_on = [
    aws_internet_gateway.main_gw
  ]

  tags = {
    "Name"    = "EIP for NAT A"
    "Project" = var.resource_tag
  }
}

resource "aws_eip" "eip_b" {

  depends_on = [
    aws_internet_gateway.main_gw
  ]

  tags = {
    "Name"    = "EIP for NAT B"
    "Project" = var.resource_tag
  }
}