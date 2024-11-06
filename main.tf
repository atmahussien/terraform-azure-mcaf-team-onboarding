// Step 1: Retrieve existing users (handle missing users gracefully)
data "azuread_user" "existing_users" {
  for_each = { for email in var.emails : email => email }

  user_principal_name = each.value
}

// Step 3: Send invitations to missing users
resource "azurerm_invitation" "this" {
  for_each = var.invitations

  name                = each.key
  redirect_url        = each.value.redirect_url
  user_email_address  = each.value.user_email_address
  # Include any other required or optional attributes
}


// Step 4: Create the security group
resource "azuread_group" "security_group" {
  display_name     = var.group_display_name
  security_enabled = true
  mail_enabled     = false
}

// Step 5: Add existing users to the group
resource "azuread_group_member" "existing_members" {
  for_each         = { for user in data.azuread_user.existing_users : user.user_principal_name => user if user.id != null }
  group_object_id  = azuread_group.security_group.object_id
  member_object_id = each.value.id
}

// Step 6: Attempt to add invited users to the group (may fail if user not yet provisioned)
resource "azuread_group_member" "invited_members" {
  for_each = azuread_invitation.invites

  group_object_id  = azuread_group.security_group.object_id
  member_object_id = each.value.invited_user_id

  depends_on = [azuread_invitation.invites]
}
