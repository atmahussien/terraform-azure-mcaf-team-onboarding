locals {
  existing_user_emails = [for user in data.azuread_user.existing_users : lower(try(user.user_principal_name, ""))]
  missing_user_emails  = [for email in var.emails : email if !contains(local.existing_user_emails, lower(email))]
}
