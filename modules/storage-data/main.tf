
locals {
  prefix = "${lower(var.country)}-${var.env}"
}
resource "google_storage_bucket" "bucket_ods" {
  name     = "${local.prefix}-original-data"
  location = "EU"
}
resource "google_storage_bucket" "bucket_cds" {
  name     = "${local.prefix}-computed-data"
  location = "EU"
}


