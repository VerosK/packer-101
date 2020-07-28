
build {
  sources = [
    "source.amazon-ebs.webserver",
    "source.docker.webserver"
  ]

  provisioner "shell" {
    only = [ "source.docker.webserver" ]
    inline = [
      "apt install sudo -y",
    ]
  }

  provisioner "shell" {
    inline = [
      "apt install sudo -y",
      "sudo apt-get clean",
      "sudo apt-get update",
      "sudo apt-get install -y python"
    ]
  }
}

