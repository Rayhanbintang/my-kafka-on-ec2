variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

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
    key                    = "01-prereq/terraform.tfstate"
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
module "prereq" {
  source = "../../modules/01-prereq"

  master_prefix = "my"
  env_prefix    = "kafka"
  app_prefix    = "project"


  //--- VPC Config ---


  //--- Subnet Config ---
  az1_id = "us-east-1a"
  az2_id = "us-east-1b"

  private-subnet1-cidr = "10.0.1.0/24"
  private-subnet2-cidr = "10.0.2.0/24"
  public-subnet1-cidr  = "10.0.3.0/24"
  public-subnet2-cidr  = "10.0.4.0/24"

}



