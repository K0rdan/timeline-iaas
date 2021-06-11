resource "google_service_account" "sa" {
  for_each = var.service_accounts

  account_id   = each.key
  display_name = title(each.key)
}

resource "google_service_account_key" "api_keys" {
  for_each = var.service_accounts

  service_account_id = google_service_account.sa[each.key].name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "local_file" "api_keys" {
  for_each = var.service_accounts

  sensitive_content  = base64decode(google_service_account_key.api_keys[each.key].private_key)
  filename = "./secrets/${each.key}_key.json"
}

resource "google_project_iam_member" "roles" {
  count = length(local.account_role_pairs)

  role   = local.account_role_pairs[count.index].role
  member = "serviceAccount:${google_service_account.sa[local.account_role_pairs[count.index].account].email}"
}
