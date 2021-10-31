resource "azuread_group" "new" {
  display_name     = "${azurerm_resource_group.aks_rg.name}-${var.env}-grp"
  security_enabled = true
}

data "azuread_domains" "aad_domains" {}

resource "azuread_user" "xyz" {
  user_principal_name = "xyz@pushpendawnyahoo.onmicrosoft.com"
  display_name        = "XYZ"
  mail_nickname       = "XYZ"
  password            = "Spider@123"
}

data "azuread_user" "xyz" {
    object_id = azuread_user.xyz.id
    
    
}

resource "azuread_group_member" "example" {
  group_object_id  = azuread_group.new.id
  member_object_id = data.azuread_user.xyz.id
}