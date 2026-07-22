resource "google_storage_bucket" "gcs_bucket" {
  name                        = "${var.tenant_project_id}-scm-repo${var.tenant_project_number}"
  project                     = var.tenant_project_number
  location                    = var.location
  storage_class               = var.storage_class
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
  display_name = var.reasoning_engine_display_name
  project      = var.tenant_project_number
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


