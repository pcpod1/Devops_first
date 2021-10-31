#Terraform Settings block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.83.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.8.0"
    }
  }
}

terraform {
	required_version = ">= 0.13"
}