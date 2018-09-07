resource "ibm_container_cluster" "demo_cluster" {
  name         = "test"
  datacenter   = "dal10"
  hardware     = "dedicated"
  machine_type = "free"
}
