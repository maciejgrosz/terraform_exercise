provider "aws" {
  region = var.AWS_REGION
}

terraform {
  backend "s3" {
    bucket = var.backend["bucket"]
    key = var.backend["key"]
    region = var.backend["region"]
  }
}
