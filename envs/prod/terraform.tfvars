project_name = "cloudproj"
environment  = "prod"
location     = "westus2"

address_space = ["10.30.0.0/16"]

subnets = {
  public1 = { address_prefixes = ["10.30.1.0/24"] }
  public2 = { address_prefixes = ["10.30.2.0/24"] }
  aks     = { address_prefixes = ["10.30.3.0/24"] }
  database= { address_prefixes = ["10.30.4.0/24"] }
}


aks_node_count = 4

mysql_admin_username = "adminuser"
mysql_admin_password = "ProdStrongPassword789!"
