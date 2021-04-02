resource "aws_route_table" "pubrt" {
  vpc_id = aws_vpc.ken_vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "pubrt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.pub1.id
  route_table_id = aws_route_table.pubrt.id
}


resource "aws_route_table" "prirt" {
  vpc_id = aws_vpc.ken_vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "prirt"
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.pri1.id
  route_table_id = aws_route_table.prirt.id
}
