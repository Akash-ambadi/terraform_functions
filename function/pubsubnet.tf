resource "aws_subnet" "public-subnet" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.sub_pub_cidr, count.index)
  availability_zone = element(var.sub_pub_AZ, count.index)
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }

}

resource "aws_subnet" "private-subnet" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.sub_pvt_cidr, count.index)
  availability_zone = element(var.sub_pub_AZ, count.index)
  tags = {
    Name = "private-subnet-${count.index + 1}"
  }

}
