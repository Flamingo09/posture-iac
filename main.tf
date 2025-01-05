provider "google" {
  project = "terraform-cloud-445206"
  region  = "global"
}

resource "google_org_policy_policy" "primary" {
 name   = "projects/302158293184/policies/compute.requireOsLogin"
 parent = "projects/302158293184"


 spec {
   rules {
     enforce = "FALSE"
   }
 }
}
