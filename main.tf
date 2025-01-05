provider "google" {
  project = "terraform-cloud-445206"
  region  = "global"
}

resource "google_securityposture_posture" "posture_2" {
  posture_id  = "posture_2"
  parent      = "organizations/ewir7yi78437"
  location    = "global"
  state       = "ACTIVE"
  description = "a new posture"
  policy_sets {
      policy_set_id = "org_policy_set"
      description   = "set of org policies"
      policies {
          policy_id = "policy_1"
          constraint {
              org_policy_constraint {
                  canned_constraint_id = "storage.uniformBucketLevelAccess"
                  policy_rules {
                      enforce = true
                  }
              }
          }
      }
  }
}
