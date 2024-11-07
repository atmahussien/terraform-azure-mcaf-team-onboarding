terraform {
  required_version = ">= 0.13"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.22.0"
    }
  }
}

provider "azuread" {
  use_msi   = var.managed_identity_client_id != null
  client_id = var.managed_identity_client_id
}
