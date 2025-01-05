provider "google" {
  project = "terraform-cloud-445206"
  region  = "global"
}

resource "google_storage_bucket" "good_bucket" {
  name          = "good_bucket"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = true

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


