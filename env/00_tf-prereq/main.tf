// -----------------------------------------------------------------------------------------------//
// --------------------------------   TF PROVIDER   ----------------------------------------------//
// -----------------------------------------------------------------------------------------------//
provider "aws" {
  region = "ap-southeast-1"
}

// -----------------------------------------------------------------------------------------------//
// --------------------------------   TF VERSION   -----------------------------------------------//
// -----------------------------------------------------------------------------------------------//
terraform {
  required_version = ">= 1.0.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.74"
    }
  }
}

// -----------------------------------------------------------------------------------------------//
// --------------------------------   TF MODULES   -----------------------------------------------//
// -----------------------------------------------------------------------------------------------//
module "prereq" {
  source = "../../../modules/00-terraform-prereq"

  region                                       = "ap-southeast-1"
  master_prefix                                = "my"
  env_prefix                                   = "kafka"
  app_prefix                                   = "project"

}