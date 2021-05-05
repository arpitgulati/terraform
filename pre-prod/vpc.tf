module "vpc" {
  source                     = "../modules/vpc-v2"
  name                       = "${var.name}"
  cidr                       = "${var.cidr}"
  nat_az_and_subnet_name     = "${var.nat_az_and_subnet_name}"
  public_subnets_block_1     = "${var.public_subnets_block_1}"
  public_subnets_block_2     = "${var.public_subnets_block_2}"
  private_subnet_block_1     = "${var.private_subnets_block_1}"
  environment                = "${var.environment}"
}
