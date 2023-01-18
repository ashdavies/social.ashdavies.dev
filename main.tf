resource "google_storage_bucket" "main" {
  location                    = var.google_project_region
  name                        = var.google_storage_bucket
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
}
