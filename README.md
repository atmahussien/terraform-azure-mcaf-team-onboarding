# Azure AD User Onboarding Terraform Module

## Overview

Streamline your user onboarding process in Azure Active Directory (Entra ID) with this Terraform module. It automates key tasks to efficiently manage user access:

- **Consolidated Email Ingestion**: Accepts a unified list of user email addresses.
- **User Verification**: Checks for existing users within your Azure AD tenant.
- **Automated Invitations**: Sends B2B invitations to external users not found in your tenant.
- **Security Group Provisioning**: Creates an Azure AD security group tailored to your needs.
- **Unified Group Enrollment**: Adds all users—both existing and newly invited—to the security group seamlessly.

## Getting Started

Implement the module by adding the following to your Terraform configuration. This example demonstrates how to consume the module from a public GitHub repository.

### **Example `main.tf`**

```hcl
provider "azuread" {
  # Authenticate using Azure CLI or Managed Identity
  # If using Managed Identity, provide the client ID
  use_msi   = var.managed_identity_client_id != null
  client_id = var.managed_identity_client_id
}

module "user_onboarding" {
  source = "github.com/yourusername/azure-ad-user-onboarding//modules/user_onboarding"

  emails             = var.emails
  group_display_name = var.group_display_name
  redirect_url       = var.redirect_url

  # Optional: Use if authenticating with a managed identity
  managed_identity_client_id = var.managed_identity_client_id
}
