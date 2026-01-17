rgs = {
  rg1 = {
    name       = "rg-anjali-dev"
    location   = "West US"
    managed_by = "rg-dev"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-test"
    resource_group_name = "rg-anjali-dev"
    location            = "West US"
    address_space       = ["10.0.0.0/16"]
    subnet = [
      {
        subnet_name      = "subnet11"
        address_prefixes = ["10.0.1.0/24"]

      }
    ]

  }
}

pips = {
  pip1 = {
    name                = "pip-test1"
    resource_group_name = "rg-anjali-dev"
    location            = "West US"
    allocation_method   = "Static"

  }
}

keys = {
  key1 = {
    kv_name  = "keyanji100dev12"
    location = "West US"
    rg_name  = "rg-anjali-dev"
    sku_name = "standard"
    rbac_authorization_enabled = true
    public_network_access_enabled = true
  }
}

secrets = {
  sec1 = {
    kv_name      = "keyanji100dev12"
    rg_name      = "rg-anjali-dev"
    secret_name  = "adminu"
    secret_value = "rg-anjali-devkvsecret"
  }
  sec2 = {
    kv_name      = "keyanji100dev12"
    rg_name      = "rg-anjali-dev"

    secret_name  = "adminpass"
    secret_value = "rg-anjali-dev@12345"
  }
}

vms = {
  vm1 = {
    subnet_name = "subnet11"
    vnet_name   = "vnet-test"
    pip_name    = "pip-test1"
    kv_name = "keyanji100dev12"
    secret_name = "adminu"
    secret_value = "adminpass"

    nic_name = "nic-test"
    ip_configuration = [
      { name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]

    vm_name             = "vm1-test"
    resource_group_name = "rg-anjali-dev"
    location            = "West US"
    size                = "Standard_D4s_v3"
    admin_username      = "vm1"
    admin_password      = "rg-anjali-dev@12345"

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
    resource_group_name = "rg-anjali-dev"
    location            = "West US"
    subnet_name = "subnet11"
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
    name = "rg-anjali-devserver1"
    location = "West US"
    resource_group_name = "rg-anjali-dev"
    administrator_login = "server12"
    administrator_login_password = "rg-anjali-dev@12345"
    version                      = "12.0"
  }
}

databases = {
  db1 = {
      name = "rg-anjali-devdb121"
      server_name = "rg-anjali-devserver1"
      resource_group_name = "rg-anjali-dev"
      collation    = "SQL_Latin1_General_CP1_CI_AS"
      license_type = "LicenseIncluded"
      max_size_gb  = 2
      sku_name     = "S0"
      enclave_type = "VBS"
  }
}

stgs = {
  stg1 = {
    name = "stganji1289"
    location = "West US"
    resource_group_name = "rg-anjali-dev"
    account_tier             = "Standard"
    account_replication_type = "GRS"

  }
}

acrs = {
    acr1 = {
        name = "devacr1098"
        resource_group_name = "rg-anjali-dev"
        location = "West US"
        sku = "Premium"
        admin_enabled = false
    }
}


aks = {
    aks1 = {
        name = "aks098"
        resource_group_name = "rg-anjali-dev"
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

    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "vnet-test"
    pip_name             = "bastion-pip"

    name                = "anjali-bastion"
    location            = "West US"
    resource_group_name = "rg-anjali-dev"
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
    resource_group_name = "rg-anjali-dev"
    location            = "West US"
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
  lbassoction = {
    nic_name              = "nic-test"
    resource_group_name   = "rg-anjali-dev"
    lb_name               = "test-lb"
    backendpool_name      = "lb-backend"
    ip_configuration_name = "internal"

  }
}

ag = {
  ag1 = {
    pip_name             = "ag-pip"
    subnet_name          = "ag-subnet"
    virtual_network_name = "vnet-test"

    name                = "ag-test"
    resource_group_name = "rg-anjali-dev"
    location            = "West US"

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
    location            = "West US"
    resource_group_name = "rg-anjali-dev"
    sku                 = "PerGB2018"
    retention_in_days   = 30
  }
}
