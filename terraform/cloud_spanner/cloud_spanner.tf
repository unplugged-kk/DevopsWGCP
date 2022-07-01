resource "google_spanner_instance" "spanner_tf" {
  name                = "kishore-spannertf"
  config              = "regional-asia-south1"
  display_name        = "Spanner from TF"
  deletion_protection = false
  num_nodes           = 1
  labels = {
    "env" = "practicetf2022"
  }

}


resource "google_spanner_database" "db1" {
  name     = "kishore-db1"
  instance = google_spanner_instance.spanner_tf.name
}
