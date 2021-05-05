provider "aws" {
    version = "1.36.0"
    region = "${var.region}"
    
}

terraform {
  backend "s3" {
    bucket = ""
    key    = "terraform.tfstate"
    region = ""
  }
}
