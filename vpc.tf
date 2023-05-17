resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidir
  tags = var.tags
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pub_cidir
  availability_zone = var.pub_az
  map_public_ip_on_launch =true

  tags = var.tags
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.prv_cidir
  availability_zone = var.prv_az
  tags = var.tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
   tags = var.tags
}

resource "aws_eip" "nat" {
  vpc      = true
  tags = var.tags
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet.id
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.this.id
  tags = var.tags

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

resource "aws_route_table_association" "pub_a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table" "prv_rt" {
  vpc_id = aws_vpc.this.id
  tags = var.tags
 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }

}

resource "aws_route_table_association" "prv_a" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.prv_rt.id
}

