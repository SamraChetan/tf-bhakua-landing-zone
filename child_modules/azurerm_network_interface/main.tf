resource "azurerm_network_interface" "nic" {
    for_each = var.network_interface
    name = each.value.name
    location = each.value.location  
    resource_group_name = each.value.resource_group_name
    ip_configuration {
        name = each.value.ipconfigname
        subnet_id = data.azurerm_subnet.subnet[each.key].id
        private_ip_address_allocation = each.value.private_ip_address_allocation    
        public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
    }
}
variable "network_interface" {}