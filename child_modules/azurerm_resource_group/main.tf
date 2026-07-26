resource "azurerm_resource_group" "rgname"{
    for_each = var.resource_name
    name = each.value.name
    location = each.value.location
}
variable "resource_name" {}






