provider "google" {
  project = "terraform-cloud-445206"
  region  = "global"
}

module "gcp_org_policy_v2" {
 source           = "terraform-google-modules/org-policy/google//modules/org_policy_v2"

 policy_root      = "organization"
 policy_root_id   = "9454078371"
 constraint       = "iam.disableServiceAccountKeyUpload"
 policy_type      = "boolean"
 exclude_folders  = []
 exclude_projects = []


 rules = [
   # Rule 1
   {
    // Modification(enforcement - false ->true).
     enforcement = true
     allow       = []
     deny        = []
     conditions  = []
   },
 ]
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
