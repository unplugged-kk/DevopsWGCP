resource "google_bigtable_instance" "bt-from-tf" {

  name                = "kishore-bt-from-tf"
  deletion_protection = false
  labels = {
    "env" = "testing"
  }
  cluster {
    cluster_id   = "kk-bt-from-tf-1"
    num_nodes    = 1
    storage_type = "SSD"
  }

}


resource "google_bigtable_table" "tbl1" {
  name          = "kk-tbl-from-tf"
  instance_name = google_bigtable_instance.bt-from-tf.name
}
