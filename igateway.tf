resource "aws_internet_gateway" "myitg" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myitg"
  }
}