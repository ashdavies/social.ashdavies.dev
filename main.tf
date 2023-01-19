resource "google_service_account" "default" {
  display_name = "Mastodon service account"
  account_id   = "mastodon-social"
  # account_id   = "mastodon"
}

resource "google_storage_bucket" "default" {
  # location                    = var.google_project_region
  # name                        = var.google_storage_bucket
  # public_access_prevention    = "enforced"
  name                        = "files-social-ashdavies-dev"
  uniform_bucket_level_access = true
  location                    = "EU"
}

resource "google_storage_bucket_iam_binding" "default" {
  members = ["serviceAccount:${google_service_account.default.email}"]
  bucket  = google_storage_bucket.default.name
  role    = "roles/storage.admin"
}

resource "google_storage_hmac_key" "default" {
  service_account_email = google_service_account.default.email
}
