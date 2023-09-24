build {
  sources = [
    "source.amazon-ebs.webserver",
  ]

  // add Python to make Ansible connection possible
  provisioner "shell" {
    inline = [
      "sudo apt-get clean",
      "sudo apt-get update",
      "sudo apt-get install -y python3"
    ]
  }

  provisioner "ansible" {
    ansible_env_vars = [
      "ANSIBLE_HOST_KEY_CHECKING=False",
      "CACHE_PLUGIN_TIMEOUT=10"
    ]
    extra_arguments = [
      "--become"
    ]
    groups = [ "webservers" ]
    host_alias = "webserver"
    playbook_file = "ansible/setup-nginx.yml"
    user = "ubuntu"
  }
}

