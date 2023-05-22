
locals {
  environment = var.environment
  tags = {
    Name = "${var.app_name}-${var.environment}"
  }
  key_name="${var.app_name}-${var.environment}"
}

resource "aws_instance" "webserver" {
  # meta  - args
  # for_each = toset(var.servers_name)

  instance_type =  var.instance_size
  ami           = data.aws_ami.ubuntu.id
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids  = [aws_security_group.allow_tls.id]
  tags = local.tags
  # user_data = file(var.bootstrap_script)

  connection {
    user  = "ubuntu"
    type = "ssh"
    private_key = file(var.private_key_path)
    host = self.public_ip
  }

  provisioner "remote-exec" {
    script = var.bootstrap_script
  }

  provisioner file {
    source = var.project_files
    destination = var.project_destination 
  }
}