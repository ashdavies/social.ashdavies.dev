terraform {
  backend "gcs" {
    bucket  = "4dc89f0b-bucket-tfstate"
    prefix  = "terraform/state"
  }
}
