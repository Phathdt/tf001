resource "aws_instance" "ansible_server" {
  ami                    = "ami-01581ffba3821cdf3"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name               = aws_key_pair.key_pair.key_name

  tags = {
    Name = "Ansible Server"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_ip
      private_key = tls_private_key.key.private_key_pem
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u ubuntu --key-file ansible-key.pem -T 300 -i '${self.public_ip}, ' app.yml"
  }
}
