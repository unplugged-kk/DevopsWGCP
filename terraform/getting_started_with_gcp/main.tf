terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.27.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "hasicorp-tf-vault-kishore"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_storage_bucket" "GCS1" {
  name     = "bucket_from_tf_up_kishore"
  location = "US"
}

