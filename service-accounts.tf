resource "random_id" "service_account_suffix" {
  for_each    = { for account in var.service_accounts : account.account_id => account }
  byte_length = 2
  keepers = {
    account_id = each.key
  }
}

resource "google_service_account" "accounts" {
  for_each     = { for account in var.service_accounts : account.account_id => account }
  account_id   = "${each.value.account_id}-${random_id.service_account_suffix[each.key].hex}"
  display_name = each.value.display_name
  description  = each.value.description
  project      = var.project_id
}

locals {
  role_pairs = distinct(flatten([
    for account in var.service_accounts : [
      for role in account.roles : {
        account_id = account.account_id
        role       = role
      }
    ]
  ]))
}
resource "google_project_iam_member" "sa_roles" {
  for_each = {
    for pair in local.role_pairs : "${pair.account_id}-${pair.role}" => pair
  }

  project = var.project_id
  role    = each.value.role
  member  = "serviceAccount:${google_service_account.accounts[each.value.account_id].email}"
}
