output "group_id" {
  description = "The ID of the created security group."
  value       = azuread_group.security_group.id
}

output "group_name" {
  description = "The display name of the security group."
  value       = azuread_group.security_group.display_name
}

output "invited_users" {
  description = "List of users who were sent invitations."
  value       = local.missing_emails
}

output "existing_users" {
  description = "Map of existing user emails to their Azure AD object IDs."
  value       = local.existing_users
}
