# Step 1: Retrieve existing users using user_principal_names
data "azuread_users" "existing_users" {
  user_principal_names = var.emails
}

# Step 2: Identify existing and missing users
locals {
  existing_users = {
    for idx, upn in data.azuread_users.existing_users.user_principal_names :
    upn => data.azuread_users.existing_users.object_ids[idx]
  }

  missing_emails = [
    for upn in var.emails :
    upn
    if !contains(keys(local.existing_users), upn)
  ]
}

# Step 3: Send invitations to missing users
resource "azuread_invitation" "invitations" {
  for_each = toset(local.missing_emails)
  
  user_email_address = each.value
  redirect_url       = var.redirect_url
}

# Step 4: Create the security group
resource "azuread_group" "security_group" {
  display_name     = var.group_display_name
  security_enabled = true
  mail_enabled     = false
}

# Step 5: Add existing users to the group
resource "azuread_group_member" "existing_members" {
  for_each = local.existing_users
  
  group_object_id  = azuread_group.security_group.id
  member_object_id = each.value
}

# Step 6: Add invited users to the group
resource "azuread_group_member" "invited_members" {
  for_each = azuread_invitation.invitations
  
  group_object_id  = azuread_group.security_group.id
  member_object_id = each.value.invited_user_id
}
