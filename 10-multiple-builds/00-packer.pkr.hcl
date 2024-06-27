# 
packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
    docker = {
      source  = "github.com/hashicorp/docker"
      version = "~> 1"
    }
  }
}
