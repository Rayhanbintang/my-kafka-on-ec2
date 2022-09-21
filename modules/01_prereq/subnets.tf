resource "aws_subnet" "main-subnet" {
    #TODO: UPDATE WITH VAR INSTEAD OF HARDCODED
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "use1-az1"

  tags = {
    Name = "Main"
  }
}
