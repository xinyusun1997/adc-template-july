variable "project_number" {
  description = "Tenant project number for cloud resources."
  type        = string
}

variable "project_id" {
  type = string
}

variable "bsa_email" {
  description = "Borg Service account email to grant project IAM role."
  type        = string
}

variable "bucket_location" {
  description = "The location of the storage bucket."
  type        = string
}

variable "bucket_storage_class" {
  description = "The Storage Class of the new bucket."
  type        = string
}

variable "reasoning_engine_region" {
  description = "The region for the Vertex AI Agent Engine."
  type        = string
}

