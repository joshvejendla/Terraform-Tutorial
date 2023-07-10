# Source: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
# Provisions an NGINX server using Docker
#
# To use this, you will need to download Terraform CLI and Docker Engine
# Every Terraform configuration must be in its own working directory

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}
