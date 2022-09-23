data "aws_subnet" "subnet-private1" {
  filter {
    name   = "tag:Name"
    values = ["private-subnet-1"]
  }
}

data "aws_subnet" "subnet-private2" {
  filter {
    name   = "tag:Name"
    values = ["private-subnet-2"]
  }
}