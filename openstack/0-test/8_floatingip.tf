# Create floating ip
resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool = "${openstack_networking_network_v2.external_network.name}"
}

# Connect floating ip and instance
resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.floatip_1.address}"
  instance_id = "${openstack_compute_instance_v2.web1.id}"
}

# Create floating ip 2
resource "openstack_networking_floatingip_v2" "floatip_2" {
  pool = "${openstack_networking_network_v2.external_network.name}"
}

# Connect floating ip and instance 2
resource "openstack_compute_floatingip_associate_v2" "fip_2" {
  floating_ip = "${openstack_networking_floatingip_v2.floatip_2.address}"
  instance_id = "${openstack_compute_instance_v2.web2.id}"
}

# Create floating ip 3
resource "openstack_networking_floatingip_v2" "floatip_3" {
  pool = "${openstack_networking_network_v2.external_network.name}"
}

resource "openstack_networking_floatingip_associate_v2" "fip_3" {
  floating_ip = "${openstack_networking_floatingip_v2.floatip_3.address}"
  port_id     = "${openstack_lb_loadbalancer_v2.centos_lb.vip_port_id}"
}
