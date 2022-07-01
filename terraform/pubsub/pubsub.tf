resource "google_pubsub_topic" "topic_tf" {
  name = "kishore_topic_tf"
}

resource "google_pubsub_subscription" "sub_tf" {
  name  = "kishore_sub_tf"
  topic = google_pubsub_topic.topic_tf.name
}
