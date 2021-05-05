environment = "pre-production"
aws_account_id = "400482395759"
terraform_s3_bucket = "terraform_s3_bucket"
region = "us-east-2"
aws_profile = "pre_production"
key_name = "key_name"
cidr = "10.0.0.0/16"
nat_az_and_subnet_name = "us-east-2a|alb-subnet"
public_subnets_block_1 = ["10.0.0.0/24|us-east-2a|orbis-app-servers"]

private_subnets_block_1 = ["10.0.1.192/26|us-east-2a|orbis-elasticache-servers"]
