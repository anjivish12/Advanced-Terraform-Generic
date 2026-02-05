rgs = {
  rg1 = {
    name       = "rg-anjali-dev1"
    location   = "central US"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-test"
    resource_group_name = "rg-anjali-dev1"
    location            = "central US"
    address_space       = ["10.0.0.0/16"]
    subnet = [
      {
        subnet_name      = "vm-subnet"
        address_prefixes = ["10.0.1.0/24"]

      },
      {
        subnet_name      = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/26"]

      },
      {
        subnet_name      = "vmss_subnet"
        address_prefixes = ["10.0.2.0/24"]

      },

      {
        subnet_name      = "ag-subnet"
        address_prefixes = ["10.0.4.0/26"]

      },

    ]

  }

  vnet2 = {
    name                = "vmss-vnet"
    resource_group_name = "rg-anjali-dev1"
    location            = "central India"
    address_space       = ["10.1.0.0/16"]
    subnet = [
      {
        subnet_name      = "vmss-subnet"
        address_prefixes = ["10.1.1.0/24"]

      },]
  }

}

pips = {
  pip1 = {
    name                = "bastion-pip"
    resource_group_name = "rg-anjali-dev1"
    location            = "central US"
    allocation_method   = "Static"

  }
  pip2 = {
    name                = "lb-pip"
    resource_group_name = "rg-anjali-dev1"
    location            = "central US"
    allocation_method   = "Static"

  }
  pip3 = {
    name                = "ag-pip"
    resource_group_name = "rg-anjali-dev1"
    location            = "central US"
    allocation_method   = "Static"

  }
}

keys = {
  key1 = {
    kv_name                       = "key121dev"
    location                      = "central US"
    rg_name                       = "rg-anjali-dev1"
    sku_name                      = "standard"
    rbac_authorization_enabled    = true
    public_network_access_enabled = true
  }
}

secrets = {
  sec1 = {
    kv_name      = "key121dev"
    rg_name      = "rg-anjali-dev1"
    secret_name  = "adminu123"
    secret_value = "rg-anjali-dev1kvsecret"
  }
  sec2 = {
    kv_name = "key121dev"
    rg_name = "rg-anjali-dev1"

    secret_name  = "adminpass123"
    secret_value = "rg-anjali-dev1@12345"
  }
}

vms = {
  vm1 = {
    subnet_name  = "vm-subnet"
    vnet_name    = "vnet-test"
    # pip_name     = "pip-test1"
    # kv_name      = "keyanji100dev12"
    # secret_name  = "adminu"
    # secret_value = "adminpass"

    nic_name = "front-nic"
    ip_configuration = [
      { name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]

    vm_name             = "frontend-vm"
    resource_group_name = "rg-anjali-dev1"
    location            = "central US"
    size                = "Standard_D2s_v3"
    admin_username      = "frontend"
    admin_password      = "rg-anjali-dev1@12345"

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

  vm2 = {
    subnet_name  = "vm-subnet"
    vnet_name    = "vnet-test"
    # pip_name     = "pip-test1"
    # kv_name      = "keyanji100dev12"
    # secret_name  = "adminu2"
    # secret_value = "adminpass2"

    nic_name = "back-nic"
    ip_configuration = [
      { name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]

    vm_name             = "backend-vm"
    resource_group_name = "rg-anjali-dev1"
    location            = "central US"
    size                = "Standard_D2s_v3"
    admin_username      = "backend"
    admin_password      = "rg-anjali-dev1@12345"

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

    nsg_name             = "nsg1"
    resource_group_name  = "rg-anjali-dev1"
    location             = "central US"
    subnet_name          = "vm-subnet"
    virtual_network_name = "vnet-test"
    security_rule = [
      {
        name                       = "SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        description                = "Allow inbound HTTP traffic"
      }
    ]
  }
}

servers = {
  server1 = {
    name                         = "rg-anjali-dev1server1"
    location                     = "central US"
    resource_group_name          = "rg-anjali-dev1"
    administrator_login          = "server12"
    administrator_login_password = "rg-anjali-dev1@12345"
    version                      = "12.0"
  }
}

databases = {
  db1 = {
    name                = "rg-anjali-dev1db121"
    server_name         = "rg-anjali-dev1server1"
    resource_group_name = "rg-anjali-dev1"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
  }
}

stgs = {
  stg1 = {
    name                     = "stganji128"
    location                 = "central US"
    resource_group_name      = "rg-anjali-dev1"
    account_tier             = "Standard"
    account_replication_type = "GRS"

  }
}

acrs = {
  acr1 = {
    name                = "devacr1098"
    resource_group_name = "rg-anjali-dev1"
    location            = "central US"
    sku                 = "Premium"
    admin_enabled       = false
  }
}


aks = {
  aks1 = {
    name                = "aksdev143"
    resource_group_name = "rg-anjali-dev1"
    location            = "North Central US"
    dns_prefix          = "dns1"
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

    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "vnet-test"
    pip_name             = "bastion-pip"

    name                = "anjali-bastion"
    location            = "central US"
    resource_group_name = "rg-anjali-dev1"
    ip_configuration = [
      {
        name = "configuration"

      }
    ]
  }

}

lb = {
  lb1 = {
    pip_name            = "lb-pip"
    resource_group_name = "rg-anjali-dev1"
    location            = "central US"
    frontend_ip_configuration = [{
      frontend_ip_configuration_name = "internal"
    }]

    backendpool_name               = "lb-backend"
    healthprobe_name               = "lb-healthcheck"
    port                           = 80
    rule_name                      = "lb-rule"
    protocol                       = "Tcp"
    frontend_port                  = 80
    backend_port                   = 80
    lb_name                        = "test-lb"
    frontend_ip_configuration_name = "internal"

  }
}

lbassoction = {
  # lbassoction1 = {
  #   nic_name              = "front-nic"
  #   resource_group_name   = "rg-anjali-dev1"
  #   lb_name               = "test-lb"
  #   backendpool_name      = "lb-backend"
  #   ip_configuration_name = "internal"

  # }
  # lbassoction2 = {
  #   nic_name              = "back-nic"
  #   resource_group_name   = "rg-anjali-dev1"
  #   lb_name               = "test-lb"
  #   backendpool_name      = "lb-backend"
  #   ip_configuration_name = "internal"

  # }
}

ag = {
  ag1 = {
    pip_name             = "ag-pip"
    subnet_name          = "ag-subnet"
    virtual_network_name = "vnet-test"

    name                = "ag-test"
    resource_group_name = "rg-anjali-dev1"
    location            = "central US"

    sku = [{
      name     = "Standard_v2"
      tier     = "Standard_v2"
      capacity = 2
    }]

    gateway_ip_configuration = [{
      name = "my-gateway-ip-configuration"
    }]

    frontend_port = [{
      name = "ag-frontendport"

    }]

    frontend_ip_configuration = [{
      name = "ag-frontendip"
    }]

    backend_address_pool = [{
      name = "ag-backendpool"
    }]


    backend_http_settings = [{
      name                  = "ag-backendhttp"
      cookie_based_affinity = "Disabled"
      path                  = "/path1/"
      port                  = 80
      protocol              = "Http"
      request_timeout       = 60
    }]

    http_listener = [{
      name                           = "ag-listner"
      frontend_ip_configuration_name = "ag-frontendip"
      frontend_port_name             = "ag-frontendport"
      protocol                       = "Http"
      host_name                      = "dhoomdhoom.shop"
    }]

    request_routing_rule = [
      {
        name                       = "ag-rule"
        priority                   = 9
        rule_type                  = "Basic"
        http_listener_name         = "ag-listner"
        backend_address_pool_name  = "ag-backendpool"
        backend_http_settings_name = "ag-backendhttp"
      }
    ]

  }
}

logworkspace = {
  law1 = {
    name                = "logworkspace12"
    location            = "central US"
    resource_group_name = "rg-anjali-dev1"
    sku                 = "PerGB2018"
    retention_in_days   = 30
  }
}


vmss = {
  vmss1 = {
    ag_name = "ag-test"
    subnet_name                     = "vmss-subnet"
    virtual_network_name            = "vmss-vnet"
    name                            = "dev-vmss"
    location                        = "central India"
    resource_group_name             = "rg-anjali-dev1"
    sku                             = "Standard_D2s_v3"
    instances                       = 2
    admin_username                  = "vmss"
    admin_password                  = "Anjali@12345"
    disable_password_authentication = false
    source_image_reference = [
      {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    ]
    os_disk = [
      {
        storage_account_type = "Standard_LRS"
        caching              = "ReadWrite"
      }
    ]
    network_interface = [
      {
        name    = "nicvmss"
        primary = true
        ip_configuration = [
          {
            name    = "internal"
            primary = true
            
          }
        ]
      }
    ]

  }
}
aagassociate = {
  agso1 = {
        nic_name = "back-nic"
        ag_name = "ag-test"
        ip_configuration_name = "internal"
        resource_group_name = "rg-anjali-dev1"

  }
    agso2 = {
        nic_name = "front-nic"
        ag_name = "ag-test"
        ip_configuration_name = "internal"
        resource_group_name = "rg-anjali-dev1"

  }
}