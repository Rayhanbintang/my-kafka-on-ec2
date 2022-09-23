resource "aws_eip" "nat" { 
  vpc      = true 
} 
 
resource "aws_nat_gateway" "ngw" { 
  allocation_id = aws_eip.nat.id 
  subnet_id = aws_subnet.public.id 
} 
 
resource "aws_route_table" "private" { 
  vpc_id = aws_vpc.main-vpc.id 
  route { 
    cidr_block = "0.0.0.0/0" 
    nat_gateway_id = aws_nat_gateway.ngw.id
  } 
  
} 
 
resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private.id 
  route_table_id = aws_route_table.private.id 
} 