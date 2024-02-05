resource "yandex_vpc_security_group" "bastion" {
  name = "bastion public" 
  description = "подключение к bastion по SSH из сети Интернет"
  network_id = yandex_vpc_network.network-main.id 
  ingress {
    protocol = "TCP" 
    description = "allow SSH connections from internet" 
    v4_cidr_blocks = ["0.0.0.0/0"]
    port = 22
  }
  ingress {
    protocol = "ICMP" 
    description = "allow ping" 
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "ANY" 
    description = "allow any outgoing connection" 
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_vpc_security_group" "kibana" {
  name = "kibana public" 
  description = "подключение к kibana из сети Интернет"
  network_id = yandex_vpc_network.network-main.id 
  ingress {
    protocol = "TCP" 
    description = "allow kibana connections from internet" 
    v4_cidr_blocks = ["0.0.0.0/0"]
    port = 5601
  }

  ingress {
    protocol = "ICMP" 
    description = "allow ping" 
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "ANY" 
    description = "allow any outgoing connection" 
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_vpc_security_group" "elasticsearch" {
  name = "elasticsearch" 
  description = "подключение к elasticsearch из сети Интернет"
  network_id = yandex_vpc_network.network-main.id 
  ingress {
    protocol = "TCP" 
    description = "allow kibana connections from internet" 
    v4_cidr_blocks = ["0.0.0.0/0"]
    port = 9200
  }

  ingress {
    protocol = "ICMP" 
    description = "allow ping" 
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "ANY" 
    description = "allow any outgoing connection" 
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "yandex_vpc_security_group" "zabbix" {
  name = "zabbix public" 
  description = "подключение к zabbix из сети Интернет"
  network_id = yandex_vpc_network.network-main.id 
  ingress {
    protocol = "TCP" 
    description = "allow zabbix connections from internet" 
    v4_cidr_blocks = ["0.0.0.0/0"]
    port = 80
  }
  ingress {
    protocol = "ICMP" 
    description = "allow ping" 
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "ANY" 
    description = "allow any outgoing connection" 
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_vpc_security_group" "balancer" {  
  name = "balancer public"
  description =  "подключение к alb из сети Инертнет по HHTP (80)" 
  network_id = yandex_vpc_network.network-main.id 
  ingress {
    protocol = "ANY" 
    description = "Health checks"
    v4_cidr_blocks = ["0.0.0.0/0"]
    predefined_target = "loadbalancer_healthchecks"
  }
  ingress {
    protocol = "TCP" 
    description = "allow HTTP connections from internet" 
    v4_cidr_blocks = ["0.0.0.0/0"]
    port = 80
  }
  ingress {
    protocol = "ICMP" 
    description = "allow ping" 
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "ANY" 
    description = "allow any outgoing connection" 
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

