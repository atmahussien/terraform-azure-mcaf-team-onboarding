output "group_id" {
  description = "The ID of the created security group."
  value       = module.user_onboarding.group_id
}

output "group_name" {
  description = "The display name of the security group."
  value       = module.user_onboarding.group_name
}

output "invited_users" {
  description = "List of users who were sent invitations."
  value       = module.user_onboarding.invited_users
}

output "existing_users" {
  description = "Map of existing user emails to their Azure AD object IDs."
  value       = module.user_onboarding.existing_users
}
