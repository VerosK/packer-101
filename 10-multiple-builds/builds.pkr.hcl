# builds

build {
  sources = [
    "source.amazon-ebs.webserver",
    "source.docker.webserver"
  ]

  provisioner "shell" {
    only = [ "docker.webserver" ]
    inline = [
      "apt clean",
      "apt update",
      "apt install sudo -y",
    ]
  }

  provisioner "shell" {
    inline = [
      "sudo apt-get clean",
      "sudo apt-get update",
      "sudo apt-get install -y python3"
    ]
  }

  post-processor "docker-tag" {
    only = [ "docker.webserver" ]
    repository = "localhost.demo"
    tag = [ "latest"  ]
  }

}

