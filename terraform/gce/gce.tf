resource "google_compute_instance" "vm-from-tf" {
  name         = "vm-from-tf"
  zone         = "asia-southeast1-a"
  machine_type = "e2-small"

  network_interface {
    network    = "custom-vpc-tf"
    subnetwork = "sg-subnetwork-tf"
  }

  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20210916"
      size  = 10
    }
    auto_delete = false
  }
  allow_stopping_for_update = true

  labels = {
    "env" = "terraform-gcp-practice"
  }

  scheduling {
    preemptible       = false
    automatic_restart = false
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "hasicorp-tf-vault-kishore@hasicorp-tf-vault-kishore.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }


}

resource "google_compute_disk" "disk-from-tf" {
  name = "disk-from-tf"
  type = "pd-ssd"
  size = 10
  zone = "asia-southeast1-a"
  labels = {
    environment = "disk-from-tf"
  }
  physical_block_size_bytes = 4096
}

resource "google_compute_attached_disk" "tf-disk-attach" {
  disk     = google_compute_disk.disk-from-tf.id
  instance = google_compute_instance.vm-from-tf.id
}
