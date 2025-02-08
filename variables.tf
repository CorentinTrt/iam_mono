variable "provisioner_sa_credentials" {
  description = "Credentials of the IAM Provisioner SA"
  default     = "./.iam_provisioner.json"
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "github_orga" {
  description = "Name of the Github organization"
  type        = string
}

variable "github_repo" {
  description = "Name of the Github repository"
  type        = string
}

variable "service_accounts" {
  description = "List of service accounts to create"
  type = list(object({
    account_id   = string
    display_name = string
    description  = string
    roles        = list(string)
  }))
}
