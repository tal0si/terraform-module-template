 terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.26.0"
    }
  }
}

provider "google" {
  credentials = file("formation-terraform-405813-932629fa596b.json")
  project     = "formation-terraform-405813"
  region      = "europe-west1"
}


module "storage" {
  source = "./modules/storage-data"
  country = "IT"
  env = "int"
}

output "buckets_urls" {
  value = [module.storage.ods_url, module.storage.cds_url]
}

output "buckets_urldds" {
  value = module.storage
}




