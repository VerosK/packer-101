

source "amazon-ebs" "webserver" {
  ami_name = "packer-example {{timestamp}}"
  region = var.aws_region
  instance_type = "t2.micro"

  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type = "ebs"
    }
    owners = [ "099720109477" ]
    most_recent = true
  }

  communicator = "ssh"
  ssh_username = "ubuntu"

  force_delete_snapshot = true
  force_deregister = true
  tags = {
    Name = "Webserver example {{timestamp}}",
    build_user = var.build_user
  }
}

build {
  sources = [
      "source.amazon-ebs.webserver"
  ]

  provisioner "shell" {
    inline = [
      "sudo apt-get clean",
      "sudo apt-get update",
      "sudo apt-get install -y python"
    ]
  }
}
