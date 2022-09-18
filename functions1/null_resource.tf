resource "null_resource" "exec-file-script" {
  count = var.env == "prod" ? 3 : 1
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("9AMsg.pem")
      host        = element(aws_instance.public.*.public_ip, count.index)
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/script.sh",
      #"sudo sed -i '/opt\\/data/d' /etc/fstab"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("9AMsg.pem")
      host        = element(aws_instance.public.*.public_ip, count.index)

    }
  }
}

