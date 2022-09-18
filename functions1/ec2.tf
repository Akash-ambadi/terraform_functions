resource "aws_instance" "public" {
  count = var.env == "prod" ? 3 : 1
  #count = length(var.sub_pub_cidr)
  #ami                         = var.image
  ami                         = lookup(var.amis, var.region)
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnet.*.id, count.index)
  security_groups             = ["${aws_security_group.allow_all.id}"]


  tags = {
    Name        = "public-server-${count.index + 1}"
    Environment = "prod"
    Owner       = "akash"
    CostCenter  = "ABCD"
  }
  lifecycle {
    create_before_destroy = true
  }
  #   provisioner "file" {
  #     source      = "script.sh"
  #     destination = "/tmp/script.sh"
  #     connection {
  #       type        = "ssh"
  #       user        = "ec2-user"
  #       private_key = file("9AMsg")
  #       host        = element(aws_instance.public.*.public_ip, count.index)
  #     }
  #     provisioner "remote-exec" {
  #       inline = [
  #         "sudo chmod 777 /tmp/script.sh",
  #         "sudo /tmp/script.sh",
  #         "sudo sed -i '/opt\\/data/d' /etc/fstab"
  #       ]
  #       connection {
  #         type        = "ssh"
  #         user        = "ec2-user"
  #         private_key = file("9AMsg")
  #         host        = element(aws_instance.public.*.public_ip, count.index)

  #       }
  #     }
  #   }

  #   user_data = <<EOF
  #     #!/bin/bash
  #     sudo yum update -y
  #     sudo yum install git -y
  #     sudo yum install httpd -y
  #     sudo service httpd start
  #     sudo git clone https://github.com/Akash-ambadi/Essence.git 
  #     sudo cp Essence.git /var/www/html/
  #     sudo service httpd restart
  #     EOF
}

resource "aws_instance" "private" {
  count = var.env == "prod" ? 3 : 0
  #count = length(var.sub_pvt_cidr)
  #ami           = var.image
  ami           = lookup(var.amis, var.region)
  instance_type = var.instance_type
  #   associate_public_ip_address = true
  key_name        = var.key_name
  subnet_id       = element(aws_subnet.private-subnet.*.id, count.index)
  security_groups = ["${aws_security_group.allow_all.id}"]
  tags = {
    Name        = "private-server-${count.index + 1}"
    Environment = "database"
    Owner       = "akash"
    CostCenter  = "ABCD"
  }
  lifecycle {
    create_before_destroy = true
  }
}
