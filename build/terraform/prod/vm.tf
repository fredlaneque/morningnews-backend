# Deploy EC2 Instance on AWS
resource "aws_instance" "prod_morningnews_backend" {
  ami           = "ami-087da76081e7685da"
  instance_type = "t2.micro"
  key_name      = "aws-key-pub"
  security_groups = [aws_security_group.prod_morningnews_backend_sg.name]
  tags = var.AWS_INSTANCE_TAGS
  user_data = <<-EOF
#!/bin/bash
sudo DEBIAN_FRONTEND=noninteractive dpkg --configure -a
sudo DEBIAN_FRONTEND=noninteractive apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq upgrade
sudo sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo service sshd restart
EOF
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "admin"
      private_key = file("/builds/lacapsule-batch6/morningnews-backend/build/conf/.ssh/id_rsa")
      host        = aws_instance.prod_morningnews_backend.public_ip
    }
    inline = [
      "sudo DEBIAN_FRONTEND=noninteractive dpkg --configure -a && sudo DEBIAN_FRONTEND=noninteractive apt-get update && sudo DEBIAN_FRONTEND=noninteractive apt-get -yq upgrade",
      "sudo sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config",
      "sudo sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config",
      "sudo service sshd restart"
    ]
  }
}