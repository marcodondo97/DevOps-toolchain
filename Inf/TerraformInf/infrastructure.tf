terraform {
  required_providers {
    awslightsail = {
      source = "deyoungtech/awslightsail"
    }
  }
}

provider "awslightsail" {
  region = "eu-west-1"
}

resource "aws_lightsail_instance" "my_instance" {
  name              = "my-instance-1"
  availability_zone = "eu-west-1a"
  blueprint_id      = "amazon_linux_2"
  key_pair_name     = "my-key-1"
  bundle_id         = "nano_2_0"
}

resource "aws_lightsail_static_ip" "my_static_ip" {
  name = "my-static-ip-1"
}

resource "aws_lightsail_static_ip_attachment" "my_static_ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.my_static_ip.name
  instance_name  = aws_lightsail_instance.my_instance.name
}

resource "awslightsail_container_service" "my_container_service" {
  name        = "my-container-service-1"
  power       = "nano"
  scale       = 2
  is_disabled = false
}

resource "awslightsail_database" "my_db" {
  name                 = "my-db-1"
  availability_zone    = "eu-west-1a"
  master_username      = "myusername"
  master_database_name = "mydatabase"
  master_password      = "mypassword123!"
  blueprint_id         = "mysql_8_0"
  bundle_id            = "micro_1_0"
}

output "public_ip" {
  value = aws_lightsail_static_ip.my_static_ip.ip_address
}

output "container_service_domain" {
  value = awslightsail_container_service.my_container_service.url
}

output "database_endpoint" {
  value = awslightsail_database.my_db.master_endpoint_address
}
