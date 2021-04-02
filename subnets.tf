resource "aws_subnet" "pub1" {
  vpc_id     = aws_vpc.ken_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "pub1"
  }
}

resource "aws_subnet" "pub2" {
  vpc_id     = aws_vpc.ken_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "pub2"
  }
}

resource "aws_subnet" "pri1" {
  vpc_id     = aws_vpc.ken_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "pri1"
  }
}

resource "aws_subnet" "pri2" {
  vpc_id     = aws_vpc.ken_vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "pri4"
  }
}