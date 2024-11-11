output "group_id" {
  description = "The ID of the created Azure AD security group."
  value       = azuread_group.security_group.id
}

output "group_name" {
  description = "The display name of the security group."
  value       = azuread_group.security_group.display_name
}

output "invited_users" {
  description = "List of users who were sent invitations."
  value       = [for invite in azuread_invitation.invitations : invite.user_email_address]
}

output "invited_user_ids" {
  description = "Map of invited user emails to their Azure AD object IDs."
  value       = { for email, invite in azuread_invitation.invitations : email => invite.invited_user_id }
}
