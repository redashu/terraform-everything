resource "docker_container" "foo" {
  name  = "foo"
  image = "nginx"

  ports {
    internal = "80"
    external = "8080"
  }
}

resource "docker_container" "ubuntu" {
  name  = "foo1"
  image = "${docker_image.ubuntu.name}"
  command = [ "sleep","50" ]
}
