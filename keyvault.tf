data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "newkeyvm" {
  name                        = "${var.env}-newkeyv"
  location                    = azurerm_resource_group.aks_rg.location
  resource_group_name         = azurerm_resource_group.aks_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id 
              
        
    

    key_permissions = [
      "Get", "List", "Import", "Create"
    ]

    secret_permissions = [
      "Get", "List", "Set"
    ]

    storage_permissions = [
      "Get", "List",
    ]
    
   
  }
  
}

