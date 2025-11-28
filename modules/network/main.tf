# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.project_name}-${var.environment}-rg"
  location = var.location
}

# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project_name}-${var.environment}-vnet"
  address_space       = var.address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create NSG for each subnet
resource "azurerm_network_security_group" "nsgs" {
  for_each = var.subnets

  name                = "${var.project_name}-${var.environment}-${each.key}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create Subnets with NSG attached
resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes
}

# Associate NSG with Subnets
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
  for_each                  = var.subnets
  subnet_id                 = azurerm_subnet.subnets[each.key].id
  network_security_group_id = azurerm_network_security_group.nsgs[each.key].id
}

# Optional: User Defined Route (UDR) for private subnets
resource "azurerm_route_table" "private" {
  count               = var.enable_udr ? 2 : 0
  name                = "${var.project_name}-${var.environment}-private-rt-${count.index + 1}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_route_table_association" "private_assoc" {
  for_each = { for k, v in azurerm_subnet.subnets : k => v if k == "aks" || k == "database" }
  subnet_id      = each.value.id
  route_table_id = element(azurerm_route_table.private[*].id, 0)  # simple association, can customize per subnet
}

