resource "google_sql_database_instance" "mysql-from-tf" {
  name                = "mysql-from-tf-kishore"
  deletion_protection = false
  region              = "us-central1"
  database_version    = "MYSQL_5_6"

  settings {
    tier = "db-f1-micro"
  }

}

resource "google_sql_user" "myuser" {
  name     = "kishore"
  password = "kishore@123"
  instance = google_sql_database_instance.mysql-from-tf.name
}
