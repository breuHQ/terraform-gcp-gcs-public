resource google_storage_bucket default {
  name    = var.name
  project = var.project
}

resource google_storage_bucket_iam_member service_account {
  bucket = google_storage_bucket.default.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${var.service_account_email}"
}

resource google_storage_bucket_access_control public_rule {
  bucket = google_storage_bucket.default.name
  role   = "READER"
  entity = "allUsers"
}
