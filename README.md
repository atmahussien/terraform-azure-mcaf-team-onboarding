# Azure AD User Onboarding Terraform Module

## Description

This Terraform module automates the onboarding process of users in Azure Active Directory (Entra ID). It:

- Accepts a list of user email addresses.
- Checks if the users already exist in your Azure AD tenant.
- Sends B2B invitations to users not found in the tenant.
- Creates an Azure AD security group.
- Adds existing users to the security group.
- Attempts to add invited users to the group after they accept the invitation.

## Usage

```hcl
module "user_onboarding" {
  source = "./path_to_module"

  emails             = ["user1@contoso.com", "user2@contoso.com", "newuser@contoso.com"]
  group_display_name = "Engineering Team"
}
