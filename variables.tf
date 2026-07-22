variable "tenant_project_number" {
  description = "Tenant project number for cloud resources."
  type        = string
}

variable "tenant_project_id" {
  type = string
}

variable "location" {
  description = "The location of the storage bucket."
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "The Storage Class of the new bucket."
  type        = string
  default     = "MULTI_REGIONAL"
}

variable "reasoning_engine_display_name" {
  description = "The display name of the Vertex AI Agent Engine."
  type        = string
  default     = "agent-engine"
}

variable "reasoning_engine_region" {
  description = "The region for the Vertex AI Agent Engine."
  type        = string
  default     = "us-central1"
}

