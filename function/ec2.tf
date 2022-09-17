resource "aws_instance" "public" {
  count                       = 3
  ami                         = var.image
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnet.*.id, count.index)
  security_groups             = ["${aws_security_group.allow_all.id}"]
  tags = {
    Name        = "public-subnet-${count.index + 1}"
    Environment = "prod"
    Owner       = "akash"
    CostCenter  = "ABCD"
  }
}

resource "aws_instance" "private" {
  count                       = 3
  ami                         = var.image
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.private-subnet.*.id, count.index)
  security_groups             = ["${aws_security_group.allow_all.id}"]
  tags = {
    Name        = "private-subnet-${count.index + 1}"
    Environment = "prod"
    Owner       = "akash"
    CostCenter  = "ABCD"
  }
}
