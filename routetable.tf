resource "aws_route_table" "myroute" {
  vpc_id = aws_vpc.myvpc.id
  
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myitg.id
  }
  
  tags = {
    Name = "myroute"
  }
}


resource "aws_route_table_association" "myroutetable" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.myroute.id
}

resource "aws_route_table_association" "myroutetable1" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.myroute.id
}