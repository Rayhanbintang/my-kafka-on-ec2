# variable "region" {
#   type = string
# }

variable "master_prefix" {
  description = "Master preix to be used for all AWS resources"
  type        = string
}

variable "env_prefix" {
  description = "Environment specific prefix to be used for all AWS resources"
  type        = string
}

variable "app_prefix" {
  description = "Application Prefix for all AWS Resources"
  type        = string
}

variable "az1_id" {
  type = string
}

variable "az2_id" {
  type = string
}

variable "private-subnet1-cidr" {
    type = string
}

variable "private-subnet2-cidr" {
    type = string
}

variable "public-subnet1-cidr" {
    type = string
}

variable "public-subnet2-cidr" {
    type = string
}