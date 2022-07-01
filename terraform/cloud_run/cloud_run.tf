resource "google_cloud_run_service" "run-app-from-tf" {
  name     = "run-app-from-tf"
  location = "asia-southeast1"
  template {
    spec {
      containers {
        # image = "marketplace.gcr.io/google/nginx1:1.16"
        # image = "gcr.io/google-samples/hello-app:1.0"
        image = "gcr.io/google-samples/hello-app:2.0"

        # image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }
  #   traffic {
  #     percent         = 100
  #     latest_revision = true
  #   }

  traffic {
    revision_name = "run-app-from-tf-wbxtt"
    percent       = 50
  }
  traffic {
    revision_name = "run-app-from-tf-spdwq"
    percent       = 50
  }

}

resource "google_cloud_run_service_iam_policy" "pub_access" {
  location    = google_cloud_run_service.run-app-from-tf.location
  project     = google_cloud_run_service.run-app-from-tf.project
  service     = google_cloud_run_service.run-app-from-tf.name
  policy_data = data.google_iam_policy.pub-tf-policy.policy_data
}

data "google_iam_policy" "pub-tf-policy" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}
