# Resource Group#
resource_name = {
  resourcegroup1 = {
    name     = "prodrg"
    location = "central india"
  }
   resourcegroup2 = {
    name     = "testrg"
    location = "central india"
  }
}

# Virtual Network
virtual_network = {
  virtual_network1 = {
    name                = "prodvirtual_network"
    location            = "central india"
    resource_group_name = "prodrg"
    address_space       = ["10.0.0.0/16"]
  }
}

# Frondend & backend Subnet
subnets = {
  subnet1 = {
    name                 = "frontendsubnet"
    resource_group_name  = "prodrg"
    virtual_network_name = "prodvirtual_network"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backendsubnet"
    resource_group_name  = "prodrg"
    virtual_network_name = "prodvirtual_network"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
# Public IP
public_ip = {
  public_ip1 = {
    pip_name            = "AcceptedpublicIP1"
    location            = "Central India"
    resource_group_name = "prodrg"
    allocation_method   = "Static"
  }
  public_ip2 = {
    pip_name            = "AcceptedpublicIP2"
    location            = "Central India"
    resource_group_name = "prodrg"
    allocation_method   = "Static"
  }
}

#Network Interface card with value of data block Subnet & Public IP 
network_interface = {
  nic1 = {
    name                          = "network_interface_ip1"
    location                      = "Central India"
    resource_group_name           = "prodrg"
    ipconfigname                  = "Internal"
    private_ip_address_allocation = "Dynamic"
    subnetname                    = "frontendsubnet"
    virtual_network_name          = "prodvirtual_network"
    pip_name                      = "AcceptedpublicIP1"
  }
  nic2 = {
    name                          = "network_interface_ip2"
    location                      = "Central India"
    resource_group_name           = "prodrg"
    ipconfigname                  = "External"
    private_ip_address_allocation = "Dynamic"
    subnetname                    = "backendsubnet"
    virtual_network_name          = "prodvirtual_network"
    pip_name                      = "AcceptedpublicIP2"
  }
}

#linux machine 

virtual_machine = {
  vm1 = {
    vmname               = "linuxVM"
    resource_group_name  = "prodrg"
    location             = "central india"
    size                 = "Standard_D2s_V3"
    admin_username       = "adminuser"
    admin_password       = "Admin@123456"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    subnetname           = "frontendsubnet"
    virtual_network_name = "prodvirtual_network"
    nicname              = "network_interface_ip1"
    offer                = "ubuntu-24_04-lts"
    sku                  = "server"
    version              = "latest"

  }
}


#Windows Machine
virtual_windows_machine = {
  vm2 = {
    name                 = "windows-machine"
    resource_group_name  = "prodrg"
    location             = "central india"
    size                 = "Standard_D2s_v3"
    admin_user           = "adminuser"
    admin_password       = "P@$$w0rd1234!"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "MicrosoftWindowsServer"
    offer                = "WindowsServer"
    sku                  = "2022-datacenter-azure-edition"
    version              = "latest"
    subnetname           = "backendsubnet"
    virtual_network_name = "prodvirtual_network"
    pip_name             = "AcceptedpublicIP2"
    nicname              = "network_interface_ip2"
  }
}
