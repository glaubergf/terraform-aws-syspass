data "aws_ami" "debian" {
  most_recent = true
  owners      = var.owners

  filter {
    name   = "name"
    values = var.ami
  }
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.debian.id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = file("scripts/bootstrap.sh")

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 20
  }

  tags = {
    Name        = var.name
    Environment = var.env
    Provision   = "terraform"
    Description = var.project
    #Repo        = var.repo
  }

  vpc_security_group_ids = [aws_security_group.sg_syspass.id]
}

resource "aws_eip" "eip-us-east-1" {
  instance = aws_instance.server.id
  vpc      = true

  tags = {
    Name        = var.name
    Environment = var.env
    Provision   = "terraform"
  }
}

resource "null_resource" "sshd_config" {

  connection {
    type        = "ssh"
    user        = "admin"
    private_key = file(".note/bondedaaws.pem")
    host        = aws_instance.server.public_ip
    timeout     = "3m"
  }

  provisioner "file" {
    source      = "conf/sshd_config"
    destination = "/tmp/sshd_config"
  }

  depends_on = [aws_instance.server]
}
