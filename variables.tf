variable "emails" {
  description = "List of user email addresses for onboarding."
  type        = list(string)
}

variable "group_display_name" {
  description = "Display name for the Azure AD security group."
  type        = string
}

variable "invitations" {
  description = "Map of invitations to create."
  type = map(object({
    redirect_url       = string   # The URL to which the user will be redirected after accepting the invitation
    user_email_address = string   # The email address of the user to invite
    # Include any other required or optional attributes
  }))
}
