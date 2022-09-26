resource "aws_eip" "nat" { 
  vpc      = true 
} 
 
resource "aws_nat_gateway" "ngw" { 
  allocation_id = aws_eip.nat.id 
  subnet_id = aws_subnet.public-subnet1.id
} 
 
resource "aws_route_table" "private" { 
  vpc_id = aws_vpc.main-vpc.id 
  route { 
    cidr_block = "0.0.0.0/0" 
    nat_gateway_id = aws_nat_gateway.ngw.id
  } 
  
} 
 
resource "aws_route_table_association" "private1" {
  subnet_id = aws_subnet.private-subnet1.id 
  route_table_id = aws_route_table.private.id 
} 

resource "aws_route_table_association" "private2" {
  subnet_id = aws_subnet.private-subnet2.id 
  route_table_id = aws_route_table.private.id 
} 