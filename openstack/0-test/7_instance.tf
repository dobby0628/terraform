# Create instance
resource "openstack_compute_instance_v2" "web" {
  name            = "web"
  flavor_id       = "${openstack_compute_flavor_v2.t2_small.flavor_id}"
  key_pair        = "test"
  security_groups = ["${openstack_networking_secgroup_v2.web_secgroup.name}"]
  

  block_device {
    uuid                  = "${openstack_blockstorage_volume_v3.CentOS7_vol.id}"
    source_type           = "volume"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = false
  }

  metadata = {
    this = "that"
  }

  network {
    name = "internal_network"
  }
}

