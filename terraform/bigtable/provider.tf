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
  project     = "hasicorp-tf-vault-kishore"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "key.json"
}
