resource "google_service_account" "main" {
  display_name = "Mastodon service account"
  account_id   = "mastodon"
}

resource "google_storage_bucket" "main" {
  location                    = var.google_project_region
  name                        = var.google_storage_bucket
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "main" {
  members = ["serviceAccount:${google_service_account.main.email}"]
  bucket  = google_storage_bucket.main.name
  role    = "roles/storage.admin"
}

resource "google_storage_hmac_key" "mastodon" {
  service_account_email = google_service_account.main.email
}
