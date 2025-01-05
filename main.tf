provider "google" {
  project = "terraform-cloud-445206-1"
  region  = "global"
}

module "gcp_org_policy_v2" {
 source           = "terraform-google-modules/org-policy/google//modules/org_policy_v2"

 policy_root      = "organization"
 policy_root_id   = "34857634875"
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
