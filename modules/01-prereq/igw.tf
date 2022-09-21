resource "aws_internet_gateway" "igw" { #1 
  vpc_id = aws_vpc.main-vpc.id 
 
}
 
resource "aws_route_table" "public-route-table" { #2 
  vpc_id = aws_vpc.main-vpc.id 
  route { 
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.igw.id 
  }  
} 
 
resource "aws_route_table_association" "public-route-table-association" { #3 
  subnet_id      = [aws_subnet.public-subnet1.id, aws_subnet.public-subnet2.id] 
  route_table_id = aws_route_table.public.id 
} 