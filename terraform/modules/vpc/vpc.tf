#Create VPC
resource "aws_vpc" "ecs_vpc" {
  cidr_block       = var.cidr_block_vpc

  tags = {
    Name = "Threatcomposer vpc"
  }
}

#create 2 public subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.cidr_block_public_1
  availability_zone = var.availability_zone_1

  tags = {
    Name = "1st public subnet"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.cidr_block_public_2
  availability_zone = var.availability_zone_2

  tags = {
    Name = "2nd public subnet"
  }
}

#create 2 private subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.cidr_block_private_1
  availability_zone = var.availability_zone_1

  tags = {
    Name = "1st private subnet"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.ecs_vpc.id
  cidr_block = var.cidr_block_private_2
  availability_zone = var.availability_zone_2
  tags = {
    Name = "2nd private subnet"
  }
}


#create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ecs_vpc.id
  

  tags = {
    Name = "Internet Gateway"
  }
}

#create elastic ip for NAT gateway
resource "aws_eip" "eip_nat" {
  domain   = "vpc"
  depends_on = [aws_internet_gateway.igw]
}


# #create Nat (it's better to create nat per az but for price purposes I will only do it in 1 AZ)
resource "aws_nat_gateway" "nat_id" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "NAT"
  }

  # relying on igw
  depends_on = [aws_internet_gateway.igw]
}

#create route table for igw
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.ecs_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "igw route table"
  }
}

# #CREATE  route table for NAT
resource "aws_route_table" "route_nat" {
  vpc_id = aws_vpc.ecs_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_id.id
  }

  tags = {
    Name = " NAT route table"
  }
}

#route public subnets pointing to igw
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route.id
}

#route private subnets pointing to NAT
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.route_nat.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.route_nat.id
}





