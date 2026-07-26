module "azurerm_resource_group" {
  source        = "../../child_modules/azurerm_resource_group"
  resource_name = var.resource_name
}

module "azurerm_virtual_network" {
  source          = "../../child_modules/azurerm_virtual_network"
  virtual_network = var.virtual_network
  depends_on      = [module.azurerm_resource_group]
}

module "azurerm_subnet" {
  source     = "../../child_modules/azurerm_subnet"
  subnets    = var.subnets
  depends_on = [module.azurerm_virtual_network]
}

module "azurerm_public_ip" {
  source     = "../../child_modules/azurerm_public_ip"
  public_ip  = var.public_ip
  depends_on = [module.azurerm_resource_group]
}
module "azurerm_network_interface" {
  source            = "../../child_modules/azurerm_network_interface"
  network_interface = var.network_interface
  depends_on        = [module.azurerm_public_ip,module.azurerm_subnet]
}
module "azurerm_linux_virtual_machine" {
  source          = "../../child_modules/azurerm_linux_virtual_machine"
  virtual_machine = var.virtual_machine
  depends_on      = [module.azurerm_network_interface]
}
module "azurerm_windows_virtual_machine" {
  source                  = "../../child_modules/azurerm_windows_virtual_machine"
  virtual_windows_machine = var.virtual_windows_machine
  depends_on              = [module.azurerm_network_interface]
}