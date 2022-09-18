resource "aws_eip" "my-aws_eip" {
  tags = {
    Name = "my-aws_eip"
  }

}

resource "aws_nat_gateway" "MYNAT" {
  allocation_id = aws_eip.my-aws_eip.id
  subnet_id     = aws_subnet.public-subnet.0.id

  tags = {
    Name = "my-aws_eip-nat"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.MYIGW]
}
