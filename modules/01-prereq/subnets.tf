resource "aws_subnet" "private-subnet1" { 
  vpc_id     = aws_vpc.main-vpc.id 
  availability_zone = var.az1_id
  cidr_block = var.private-subnet1-cidr
 
  tags = { 
    Name = "private-subnet-1" 
  } 
} 

resource "aws_subnet" "private-subnet2" {
  vpc_id     = aws_vpc.main-vpc.id
  availability_zone = var.az2_id
  cidr_block = var.private-subnet2-cidr
 
  tags = { 
    Name = "private-subnet-2" 
  } 
} 
 
resource "aws_subnet" "public-subnet1" {  
  vpc_id     = aws_vpc.main-vpc.id 
  availability_zone = var.az1_id
  cidr_block = var.public-subnet1-cidr 
 
  tags = { 
    Access = "public" 
  } 
} 

resource "aws_subnet" "public-subnet2" {  
  vpc_id     = aws_vpc.main-vpc.id 
  availability_zone = var.az2_id
  cidr_block = var.public-subnet2-cidr

  tags = { 
    Access = "public" 
  } 
} 