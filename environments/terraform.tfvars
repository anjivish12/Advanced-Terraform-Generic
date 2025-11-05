rgs = {
  rg1 = {
    name       = "rg-test"
    location   = "West US"
    managed_by = "Anjali"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-test"
    resource_group_name = "rg-test"
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
    resource_group_name = "rg-test"
    location            = "West US"
    allocation_method   = "Static"

  }
}
keys = {
  key1 = {
    kv_name  = "key-anji-test"
    location = "West US"
    rg_name  = "rg-test"
    sku_name = "standard"
    # secret_name = "adminuser"
    # secret_value = "Anjali@12345"
    rbac_authorization_enabled = true
    public_network_access_enabled = true
  }
}

secrets = {
  sec1 = {
    kv_name      = "key-anji-test"
    rg_name      = "rg-test"
    secret_name  = "adminuser"
    secret_value = "anjalikvsecret"
  }
  sec2 = {
    kv_name      = "key-anji-test"
    rg_name      = "rg-test"

    secret_name  = "adminpassword"
    secret_value = "Anjali@12345"
  }
}

vms = {
  vm1 = {
    subnet_name = "subnet11"
    vnet_name   = "vnet-test"
    pip_name    = "pip-test1"
    kv_name = "key-anji-test"
    secret_name = "adminuser"
    secret_value = "adminpassword"

    nic_name = "nic-test"
    ip_configuration = [
      { name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]

    vm_name             = "vm1-test"
    resource_group_name = "rg-test"
    location            = "West US"
    size                = "Standard_F2"
    admin_username      = "vm1"
    admin_password      = "Anjali@12345"

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

