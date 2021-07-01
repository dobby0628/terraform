# Create volume
resource "openstack_blockstorage_volume_v3" "CentOS7_vol" {
  region      = "RegionOne"
  name        = "CentOS7_vol"
  description = "first test volume"
  size        = 20
  image_id    = "${openstack_images_image_v2.CentOS7.id}"
}
