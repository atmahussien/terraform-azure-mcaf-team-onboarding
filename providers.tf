
terraform {
  required_version = ">= 0.13"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.0.0"
    }
  }
}

provider "azuread" {
    use_msi = true
}

