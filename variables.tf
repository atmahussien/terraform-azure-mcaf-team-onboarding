# modules/aad_user_onboard/variables.tf

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

variable "invitation_body" {
  description = "The body of the invitation email."
  type        = string
  default     = "Hello! You are invited to join our Azure AD tenant. Please accept the invitation to gain access."
}

variable "additional_recipients" {
  description = "Additional email addresses to include in the invitation."
  type        = list(string)
  default     = []
}

variable "managed_identity_client_id" {
  description = "The client ID of the managed identity to use for authentication."
  type        = string
  default     = null
}
