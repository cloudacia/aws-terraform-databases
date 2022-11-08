###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "cloudacia VPC"
  }
}

###############################################
#  SUBNET 01                                  #
###############################################
resource "aws_subnet" "public_subnet_01" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet01
  availability_zone = var.availability_zone01

  tags = {
    Name = "public subnet 01"
  }
}

###############################################
#  SUBNET 02                                  #
###############################################
resource "aws_subnet" "public_subnet_02" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet02
  availability_zone = var.availability_zone02

  tags = {
    Name = "public subnet 02"
  }
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "rt01" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "public route table"
  }
}

###############################################
#  INTERNET GATEWAY                          #
###############################################
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "cloudacia"
  }
}

################################################
#  ROUTE ASSOCIATION                           #
################################################
resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.rt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta01" {
  subnet_id      = aws_subnet.public_subnet_01.id
  route_table_id = aws_route_table.rt01.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta02" {
  subnet_id      = aws_subnet.public_subnet_02.id
  route_table_id = aws_route_table.rt01.id
}


###############################################
#  SUBNET 03                                  #
###############################################
resource "aws_subnet" "private_subnet_03" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet03
  availability_zone = var.availability_zone01

  tags = {
    Name = "private subnet 03"
  }
}

###############################################
#  SUBNET 03                                  #
###############################################
resource "aws_subnet" "private_subnet_04" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet04
  availability_zone = var.availability_zone02

  tags = {
    Name = "private subnet 04"
  }
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "rt02" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "private route table"
  }
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta03" {
  subnet_id      = aws_subnet.private_subnet_03.id
  route_table_id = aws_route_table.rt02.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta04" {
  subnet_id      = aws_subnet.private_subnet_04.id
  route_table_id = aws_route_table.rt02.id
}
