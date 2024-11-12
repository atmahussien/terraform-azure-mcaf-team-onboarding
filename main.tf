# Provider Configuration
provider "azuread" {
  use_msi   = var.managed_identity_client_id != null
  client_id = var.managed_identity_client_id
}

# Step 1: Send invitations to all users
resource "azuread_invitation" "invitations" {
  for_each = toset(var.emails)

  user_email_address = each.value
  redirect_url       = var.redirect_url

  message {
    body                  = var.invitation_body
    additional_recipients = var.additional_recipients
  }
}

# Step 2: Create the security group
resource "azuread_group" "security_group" {
  display_name     = var.group_display_name
  security_enabled = true
  mail_enabled     = false
}

# Step 3: Add invited users to the group
resource "azuread_group_member" "invited_members" {
  for_each = azuread_invitation.invitations

  group_object_id  = azuread_group.security_group.id
  member_object_id = each.value.user_id
}
