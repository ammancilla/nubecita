module "networking" {
  source = "../../modules/networking"

  environment = var.environment
  default_tags = var.default_tags

  availability_zones__names = var.availability_zones__names

  vpc__name = var.vpc__name
  vpc__cidr_block = var.vpc__cidr_block
  vpc__enable_dns_hostnames = true

  subnet__public__name = var.subnet__public__name
  subnet__private__name = var.subnet__private__name
  subnet__cidrsubnet__netnum = var.subnet__cidrsubnet__netnum
  subnet__cidrsubnet__newbits = var.subnet__cidrsubnet__newbits

  ig__name = var.ig__name
  network_acl__name = var.network_acl__name
  route_table__name = var.route_table__name
}
