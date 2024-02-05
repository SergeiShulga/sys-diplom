output "public_ip_bastion" {
   value = yandex_compute_instance.bastion.network_interface[0].nat_ip_address
}
output "public_ip_kibana" {
    value = yandex_compute_instance.kibana.network_interface[0].nat_ip_address
}
output "public_ip_zabbix" {
    value = yandex_compute_instance.zabbix.network_interface[0].nat_ip_address
}
output "private_ip_connect_ssh_web1" {
    value = yandex_compute_instance.nginx1.network_interface[0].ip_address
}
output "private_ip_connect_ssh_web2" {
    value = yandex_compute_instance.nginx2.network_interface[0].ip_address
}
output "private_ip_connect_ssh_elastic" {
    value = yandex_compute_instance.elasticsearch.network_interface[0].ip_address
}
output "private_ip_connect_ssh_kibana" {
    value = yandex_compute_instance.kibana.network_interface[0].ip_address
}
output "private_ip_connect_ssh_zabbix" {
    value = yandex_compute_instance.zabbix.network_interface[0].ip_address
}
