variable "emails" {
  description = "List of user email addresses for onboarding."
  type        = list(string)
}

variable "group_display_name" {
  description = "Display name for the Azure AD security group."
  type        = string
}

variable "redirect_url" {
  description = "The URL to redirect users to after they accept the invitation."
  type        = string
  default     = "https://myapplications.microsoft.com/"
}

variable "managed_identity_client_id" {
  description = "The client ID of the user-assigned managed identity to use for authentication."
  type        = string
  default     = null
}
