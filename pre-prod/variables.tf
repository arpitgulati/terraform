variable "name" {
  description = "the name of your stack, e.g. \"fynd\""
  default     = "test"
}

variable "aws_profile" {
  description = "Name of the AWS profile to be used for the current terraform run"
  default     = "default"
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod-west\""
}

variable "key_name" {
  description = "the name of the ssh key to use, e.g. \"internal-key\""
}

variable "region" {
  description = "the AWS region in which resources are created, you must set the availability_zones variable as well if you define this value to something other than the default"
}

variable "cidr" {
  description = "the CIDR block to provision for the VPC, if set to something other than the default, both internal_subnets and public_subnets have to be defined as well"
}

variable "nat_az_and_subnet_name" {}

variable "public_subnets_block_1" {
  description = "a list of CIDRs for external subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
  type        = "list"
}

variable "public_subnets_block_2" {
  description = "a list of CIDRs for external subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
  type        = "list"
}

variable "private_subnets_block_1" {
  description = "a list of CIDRs for external subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
  type        = "list"
}
