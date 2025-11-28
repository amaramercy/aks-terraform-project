project_name = "cloudproj"
environment  = "stage"
location     = "eastus2"

address_space = ["10.20.0.0/16"]

subnets = {
  public1 = { address_prefixes = ["10.20.1.0/24"] }
  public2 = { address_prefixes = ["10.20.2.0/24"] }
  aks     = { address_prefixes = ["10.20.3.0/24"] }
  database= { address_prefixes = ["10.20.4.0/24"] }
}


aks_node_count = 3

mysql_admin_username = "adminuser"
mysql_admin_password = "StageStrongPassword456!"
