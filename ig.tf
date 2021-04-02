resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ken_vpc.id

  tags = {
    Name = "gw"
  }
}