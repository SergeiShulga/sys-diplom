resource "yandex_compute_instance" "elasticsearch" {
  name  = "elastsicsearch"
  platform_id = "standard-v3"
  zone  = yandex_vpc_subnet.mysubnet-b.zone
  resources {
    cores         = 2
    memory        = 6
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = "fd8o41nbel1uqngk0op2"
      size     = 10
    }
  }

scheduling_policy{
    preemptible = true
  }

  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.mysubnet-b.id}"
    security_group_ids = [ 
      yandex_vpc_security_group.ssh-access-local.id,
      yandex_vpc_security_group.elasticsearch-service.id,
      yandex_vpc_security_group.kibana-service.id,
      yandex_vpc_security_group.filebeat-service.id
      ]
  }
}