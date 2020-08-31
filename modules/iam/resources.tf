resource "google_service_account" "sa" {
  for_each = var.service_accounts

  account_id = each.key
  display_name = title(each.key)
}

resource "google_project_iam_member" "roles" {
  count = length(local.account_role_pairs)

  role = local.account_role_pairs[count.index].role
  member = "serviceAccount:${google_service_account.sa[local.account_role_pairs[count.index].account].email}"
}
