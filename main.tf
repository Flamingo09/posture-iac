provider "google" {
  project = "terraform-cloud-445206"
  region  = "global"
}

resource "google_storage_bucket" "akanksha_tf_testing" {
  name          = "akanksha_tf_testing"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = false

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

resource "google_storage_bucket" "akanksha_tf_testing_1" {
  name          = "akanksha_tf_testing_1"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = false

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

resource "google_container_node_pool" "primary_node_pool" {
  name       = "primary-node-pool-1"
  cluster    = "cluster-1"
  project = "conductive-ward-411007"
  initial_node_count = 2

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
  }
}
