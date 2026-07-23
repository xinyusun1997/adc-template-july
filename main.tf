resource "google_storage_bucket" "gcs_bucket" {
  name                        = "${var.project_id}-${var.project_number}"
  project                     = var.project_number
  location                    = var.bucket_location
  storage_class               = var.bucket_storage_class
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      days_since_custom_time = 14
    }
  }
}

resource "google_vertex_ai_reasoning_engine" "agent_engine" {
  provider     = google-beta
  display_name = "agent-engine"
  project      = var.project_number
  region       = var.reasoning_engine_region

  spec {
  }

  context_spec {
    memory_bank_config {
      ttl_config {
        default_ttl = "86400s"
      }
    }
  }
}

resource "google_project_iam_member" "sa_iam" {
  for_each = toset([
    "roles/editor",
  ])

  project = var.project_id
  role    = each.key
  member  = var.bsa_email
}
