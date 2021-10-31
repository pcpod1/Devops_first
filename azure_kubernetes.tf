resource "azurerm_kubernetes_cluster" "newclus" {
  name                = "${var.env}-aks1"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "${var.env}-aks1"
  kubernetes_version = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${var.env}-aks1-nrg"

  default_node_pool {
    name       = "syatempool"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    availability_zones = [1, 2, 3]
    enable_auto_scaling = true
    max_count = 5
    min_count = 1
    type = "VirtualMachineScaleSets"
    node_labels = {
        Environment = var.env
    }
    tags = {
        Environment = var.env
    }


  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
      azure_policy {
          enabled = true
      }
      oms_agent {
          enabled = true
          log_analytics_workspace_id = azurerm_log_analytics_workspace.new.id
      }
  }

  role_based_access_control {
         enabled = true
         azure_active_directory {
             managed = true
             admin_group_object_ids = [azuread_group.new.id]
         }
  }
  windows_profile {
            admin_username = var.Windowsusername
            admin_password = var.Windowspassword

        }
    linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.SSH-public-key)
    }
    }
    network_profile {
            network_plugin = "azure"
            load_balancer_sku = "Standard"
        }

        
      }


