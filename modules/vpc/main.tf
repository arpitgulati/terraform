variable "cidr" {
  description = "The CIDR block for the VPC."
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = "list"
}

variable "environment" {
  description = "Environment tag, e.g prod"
}

variable "name" {
  description = "Name tag, e.g fynd-stack"
}

/**
 * VPC
 */

resource "aws_vpc" "main" {
  cidr_block           = "${var.cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "${var.name}"
    Environment = "${var.environment}"
    Terraform   =  "true"
  }
}

/**
 * Gateways
 */

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name        = "${var.name}"
    Environment = "${var.environment}"
    Terraform   =  "true"
  }
}

/**
 * Subnets.
 */

resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${element(split("|", element(var.public_subnets, count.index)), 0)}"
  availability_zone       = "${element(split("|", element(var.public_subnets, count.index)), 1)}"
  count                   = "${length(var.public_subnets)}"
  map_public_ip_on_launch = true

  tags {
    Name             = "${var.name}-public-${element(split("|", element(var.public_subnets, count.index)), 2)}"
    Environment      = "${var.environment}"
    Terraform        = "true"
    AvailabilityZone = "${element(split("|", element(var.public_subnets, count.index)), 1)}"
  }
}

/**
 * Route tables
 */

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.name}-public-001"
    Environment = "${var.environment}"
    Terraform   =  "true"
  }
}

/**
 * Routes
 */

resource "aws_route" "public" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.main.id}"
}

/**
 * Route associations
 */

resource "aws_route_table_association" "public" {
  count          = "${length(var.public_subnets)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}