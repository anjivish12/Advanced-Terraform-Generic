rgs = {
  rg1 = {
    name       = "rg-anjali-qa"
    location   = "West US"
    managed_by = "prod"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-test"
    resource_group_name = "rg-anjali-qa"
    location            = "West US"
    address_space       = ["10.0.0.0/16"]
    subnet = [
      {
        subnet_name      = "vmsubnet"
        address_prefixes = ["10.0.1.0/24"]

      },
      {
        subnet_name      = "AzureBastionSubnet"
        address_prefixes = ["10.0.2.0/27"]

      },
       {
        subnet_name      = "vmss-subnet"
        address_prefixes = ["10.0.3.0/24"]

      }
    ]

  }
}

pips = {
  # pip1 = {
  #   name                = "pip-test1"
  #   resource_group_name = "rg-anjali-qa"
  #   location            = "West US"
  #   allocation_method   = "Static"

  # }
  pip2 = {
    name                = "bastion-pip"
    resource_group_name = "rg-anjali-qa"
    location            = "West US"
    allocation_method   = "Static"

  }
  pip3 = {
    name                = "lb-pip"
    resource_group_name = "rg-anjali-qa"
    location            = "West US"
    allocation_method   = "Static"

  }
}

keys = {
  key1 = {
    kv_name  = "keyanji99qa"
    location = "West US"
    rg_name  = "rg-anjali-qa"
    sku_name = "standard"
    rbac_authorization_enabled = true
    public_network_access_enabled = true
  }
}

secrets = {
  sec1 = {
    kv_name      = "keyanji99qa"
    rg_name      = "rg-anjali-qa"
    secret_name  = "vmadminu"
    secret_value = "rg-anjali-qakvsecret"
  }
  sec2 = {
    kv_name      = "keyanji99qa"
    rg_name      = "rg-anjali-qa"

    secret_name  = "vmadminpass"
    secret_value = "rg-anjali-qa@12345"
  }
}

vms = {
  vm1 = {
    subnet_name = "vmsubnet"
    vnet_name   = "vnet-test"
    # pip_name    = "pip-test1"
    # kv_name = "keyanji99qa"
    # secret_name = "vmadminu"
    # secret_value = "vmadminpass"

    nic_name = "nic-test"
    ip_configuration = [
      { name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]

    vm_name             = "vm1-test"
    resource_group_name = "rg-anjali-qa"
    location            = "West US"
    size                = "Standard_D4s_v3"
    admin_username      = "vm1"
    admin_password      = "rg-anjali-qa@12345"

    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]

    source_image_reference = [
      {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"

      }
    ]
  }
}

nsgs = {
  nsg1 = {

    nsg_name                = "nsg1"
    resource_group_name = "rg-anjali-qa"
    location            = "West US"
    subnet_name = "vmsubnet"
    virtual_network_name = "vnet-test"
    security_rule = [
        {
            name                       = "SSH"
            priority                   = 100
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range           = "*"
            destination_port_range      = "*"
            source_address_prefix       = "*"
            destination_address_prefix  = "*"
            description                 = "Allow inbound HTTP traffic"
        }
      ]
  }
}

servers = {
  server1 = {
    name = "rg-anjali-qaserver1"
    location = "West US"
    resource_group_name = "rg-anjali-qa"
    administrator_login = "server12"
    administrator_login_password = "rg-anjali-qa@12345"
    version                      = "12.0"
  }
}

databases = {
  db1 = {
      name = "rg-anjali-qadb121"
      server_name = "rg-anjali-qaserver1"
      resource_group_name = "rg-anjali-qa"
      collation    = "SQL_Latin1_General_CP1_CI_AS"
      license_type = "LicenseIncluded"
      max_size_gb  = 2
      sku_name     = "S0"
      enclave_type = "VBS"
  }
}

stgs = {
  stg1 = {
    name = "stganji340anji"
    location = "West US"
    resource_group_name = "rg-anjali-qa"
    account_tier             = "Standard"
    account_replication_type = "GRS"

  }
}

acrs = {
    acr1 = {
        name = "qaacr1098"
        resource_group_name = "rg-anjali-qa"
        location = "West US"
        sku = "Premium"
        admin_enabled = false
    }
}


aks = {
    aks1 = {
        name = "qaaks098"
        resource_group_name = "rg-anjali-qa"
        location = "North Central US"
        dns_prefix = "dns1"
        default_node_pool = [{
           name       = "default"
           node_count = 1
           vm_size    = "Standard_D2as_v5"
        }]
        identity = [{
            type = "SystemAssigned"
        }]

    }
}


bastion = {
  bastion1 = {

    subnet_name = "AzureBastionSubnet"
      virtual_network_name = "vnet-test"
      pip_name = "bastion-pip"

      name = "anjali-bastion"
      location = "West US"
      resource_group_name = "rg-anjali-qa"
      ip_configuration = [
        {
          name = "configuration"
       
        }
      ]
  }
  
}

# vmss = {
#   vmss1 = {
   
#       subnet_name = "vmss-subnet"
#       virtual_network_name = "vnet-test"
#       resource_group_name = "rg-anjali-qa" 
#       name = "vmss-testing"
#       location = "East US 2"
#       sku = "Standard_D4s_v3"
#       instances = 2
#       admin_username = "vmss"
#       admin_password = "Anjali@12345"
#       source_image_reference = [{
#         publisher = "Canonical"
#         offer     = "0001-com-ubuntu-server-jammy"
#         sku       = "22_04-lts"
#         version   = "latest"

#       }]
#       os_disk = [{
#         storage_account_type = "Standard_LRS"
#         caching              = "ReadWrite"
#       }]
        
#       network_interface = [{
#          name = "networkvmss"
#         ip_configuration = [ {
#           name = "internal"
#         } ]
       
#       }] 
#   }
# }

lb = {
  lb1 = {
      pip_name = "lb-pip"
      resource_group_name = "rg-anjali-qa"
      location = "West US"
      frontend_ip_configuration = [{
        frontend_ip_configuration_name = "internal"
      }]
       
      backendpool_name = "lb-backend"
      healthprobe_name = "lb-healthcheck"
      port = 80
      rule_name = "lb-rule"
      protocol = "Tcp"
      frontend_port = 80
      backend_port = 80
      lb_name = "test-lb"
      frontend_ip_configuration_name = "internal"

  }
}

lbassoction = {
  lbassoction = {
    nic_name = "nic-test"
    resource_group_name = "rg-anjali-qa"
    lb_name = "test-lb"
    backendpool_name = "lb-backend" 
    ip_configuration_name = "internal"
    
  }
}