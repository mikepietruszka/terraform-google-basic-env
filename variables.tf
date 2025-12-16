variable "tenant_project_id" {
  type        = string
  description = "The name of the GCP project"
  default     = "sada-mpietruszka-dev"
}

variable "tenant_project_number" {
  type        = number
  description = "The number of the GCP project"
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID"
}

variable "region" {
  type        = string
  description = "The region to deploy the instance in"
}

variable "machine_type" {
  type        = string
  description = "The machine type to use for the instance"
  default     = "f1-micro"
}

variable "image" {
  type        = string
  description = "The image to use for the instance"
  default     = "debian-cloud/debian-13"
}

variable "disk_size_gb" {
  type        = number
  default     = 20
  description = "The disk size in GB"
}