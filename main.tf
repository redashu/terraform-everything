terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}


provider "docker" {
  host = "unix:///var/run/docker.sock"
}




