resource "yandex_compute_instance" "zabbix" {
  name  = "zabbix"
  hostname = "zabbix"
  platform_id = "standard-v3"
  zone  = yandex_vpc_subnet.mysubnet-d.zone
  resources {
    cores         = 2
    memory        = 4
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
    subnet_id = "${yandex_vpc_subnet.mysubnet-d.id}"
    nat = true
    security_group_ids = [ 
      yandex_vpc_security_group.balancer.id,
      yandex_vpc_security_group.kibana.id,
      yandex_vpc_security_group.zabbix.id,
      yandex_vpc_security_group.bastion.id,
      yandex_vpc_security_group.elasticsearch.id,      
      ]
    }
}