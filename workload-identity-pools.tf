resource "random_id" "ghpool_suffix" {
  byte_length = 2
}
resource "google_iam_workload_identity_pool" "github_pool" {
  provider                  = google
  workload_identity_pool_id = "wifp-p-ghpool-g-${random_id.ghpool_suffix.hex}"
  display_name              = "GitHub Pool"
  description               = "Workload Identity Pool for GitHub Actions"
}

resource "random_id" "ghprovider_suffix" {
  byte_length = 2
}
resource "google_iam_workload_identity_pool_provider" "github_provider" {
  provider                           = google
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "wifpr-p-ghprovider-g-${random_id.ghprovider_suffix.hex}"
  display_name                       = "GitHub Provider"
  description                        = "Workload Identity Pool Provider for GitHub Actions"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }
  attribute_condition = "assertion.sub == 'GitHub Actions CI/CD' && assertion.repository == '${var.github_orga}/${var.github_repo}'"

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_member" "github_actions_impersonation" {
  service_account_id = google_service_account.accounts["sa-p-afr-writer-ghactions"].name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool.name}/attribute.repository/${var.github_orga}/${var.github_repo}"
}
