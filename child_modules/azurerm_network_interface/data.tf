data "azurerm_subnet" "subnet"{
    for_each = var.network_interface
    name = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
  for_each = var.network_interface
  name = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

