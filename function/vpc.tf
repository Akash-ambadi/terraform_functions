resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "myIGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "myIGW"
  }
}
