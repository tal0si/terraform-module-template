output "ods_url" {
  value = google_storage_bucket.bucket_ods.url
  description = "value of the url for ods"
}

output "cds_url" {
  value = google_storage_bucket.bucket_cds.url
  description = "value of the url for cds"
}