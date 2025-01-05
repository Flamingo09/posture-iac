provider "google" {
  project = "terraform-cloud-445206-1"
  region  = "global"
}

resource "google_compute_network" "network1"{
  name                                        = "network-vpc1"
  delete_default_routes_on_create = false
  auto_create_subnetworks           = false
  routing_mode                      = "REGIONAL"
  mtu = 1301
  project = "terraform-cloud-445206-1"
}
