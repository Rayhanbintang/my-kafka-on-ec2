// -----------------------------------------------------------------------------------------------//
// --------------------------------   TF PROVIDER   ----------------------------------------------//
// -----------------------------------------------------------------------------------------------//
provider "aws" {
  region                 = "us-east-1"
  skip_region_validation = true
  default_tags {
    tags = var.tags
  }
}

// -----------------------------------------------------------------------------------------------//
// --------------------------------   TF BACKEND   -----------------------------------------------//
// -----------------------------------------------------------------------------------------------//
terraform {

  // Backend - AWS Landing Zone Lab
  backend "s3" {
    bucket                 = "my-kafka-project-tfstate-us-east-1-684434421580" #fill later
    region                 = "us-east-1"
    skip_region_validation = true
    key                    = "02-msk/terraform.tfstate"
    dynamodb_table         = "my-kafka-project-tf-state-lock" #fill later
    encrypt                = true
  }
}

// -----------------------------------------------------------------------------------------------//
// --------------------------------   TF VERSION   -----------------------------------------------//
// -----------------------------------------------------------------------------------------------//
terraform {
  required_version = ">= 1.0.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.74"
    }
  }
}

// -----------------------------------------------------------------------------------------------//
// --------------------------------   TF MODULES   -----------------------------------------------//
// -----------------------------------------------------------------------------------------------//
module "msk" {
  source = "../../modules/02-msk"

  master_prefix = "my"
  env_prefix    = "kafka"
  app_prefix    = "project"

}
