resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = "main"
    created_by = var.created_by
    Environment = var.Environment
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
    created_by = var.created_by
    Environment = var.Environment
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public-subnet"
    created_by = var.created_by
    Environment = var.Environment
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnet"
    created_by = var.created_by
    Environment = var.Environment
  }
}

resource "aws_route_table" "route-pu" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route"
    created_by = var.created_by
    Environment = var.Environment
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.route-pu.id
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.byoip-ip.id
  subnet_id     = aws_subnet.subnet-2.id

  tags = {
    Name = "gw NAT"
    created_by = var.created_by
    Environment = var.Environment
  }

}

resource "aws_eip" "byoip-ip" {
  vpc              = true
}

resource "aws_route_table" "route-pr" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.example.id
  }
  tags = {
    Name = "private-route"
    created_by = var.created_by
    Environment = var.Environment
    
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.route-pr.id
}



