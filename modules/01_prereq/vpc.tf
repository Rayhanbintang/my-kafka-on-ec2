resource "aws_vpc" "main-vpc" {
    #TODO: UPDATE WITH VAR INSTEAD OF HARDCODED
	# checkov:skip=BC_AWS_NETWORKING_4: ADD REASON
	# checkov:skip=BC_AWS_LOGGING_9: ADD REASON
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main-subnet" {
    #TODO: UPDATE WITH VAR INSTEAD OF HARDCODED
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "use1-az1"

  tags = {
    Name = "Main"
  }
}
