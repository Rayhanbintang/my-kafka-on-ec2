// -----------------------------------------------------------------------------------------------//
// --------------------------------   TF PROVIDER   ----------------------------------------------//
// -----------------------------------------------------------------------------------------------//
provider "aws" {
  region = "us-east-1"
}

// -----------------------------------------------------------------------------------------------//
// --------------------------------   TF VERSION   -----------------------------------------------//
// -----------------------------------------------------------------------------------------------//
terraform {
  required_version = ">= 1.0.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.31"
    }
  }
}

// -----------------------------------------------------------------------------------------------//
// --------------------------------   TF MODULES   -----------------------------------------------//
// -----------------------------------------------------------------------------------------------//
module "prereq" {
  source = "../../modules/00_tf-prereq"

  region                                       = "us-east-1"
  master_prefix                                = "my"
  env_prefix                                   = "kafka"
  app_prefix                                   = "project"

}