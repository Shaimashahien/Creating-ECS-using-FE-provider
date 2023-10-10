
resource "flexibleengine_vpc_v1" "vpc" {
  name = "${var.VPC}-vpc"
  cidr = var.CIDR
}

resource "flexibleengine_vpc_subnet_v1" "subnet" {
  name       = var.SUBNET
  cidr       = var.SUB_CIDR
  gateway_ip = var.GATEWAY_IP
  vpc_id     = flexibleengine_vpc_v1.vpc.id
}

resource "flexibleengine_compute_keypair_v2" "keypair" {
  name       = var.KEY_PAIR
}

resource "flexibleengine_networking_secgroup_v2" "secgroup" {
  name        = var.SEC_GROUP
  description = var.SEC_GROUP_DESCRIPTION
}

resource "flexibleengine_compute_instance_v2" "ECS" {
  name            = var.ECS
  image_name       = var.IMAGE_NAME
  flavor_name     = var.FLAVOR_NAME
  key_pair        = flexibleengine_compute_keypair_v2.keypair.name
  security_groups = [flexibleengine_networking_secgroup_v2.secgroup.id]
  network {
    uuid = flexibleengine_vpc_subnet_v1.subnet.id
  }
}
