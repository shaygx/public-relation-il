



resource "aws_route_table" "RTB-pr-prod-Private" {
  vpc_id = aws_vpc.main.id

tags = {
    Name = "RTB-pr-prod-Private"
   }
}

resource "aws_route_table_association" "subnets-pr-prod-private" {
  subnet_id      = "subnet-0508343e46877c829"
  route_table_id = aws_route_table.RTB-pr-prod-Private.id
}


resource "aws_route_table_association" "subnet-pr-prod-private-az2" {
  subnet_id    = "subnet-09a3826d07c91ca6e"
  route_table_id = aws_route_table.RTB-pr-prod-Private.id
}




resource "aws_route_table" "RTB-pr-prod-Public" {
  vpc_id = aws_vpc.main.id

tags = {
    Name = "RTB-pr-prod-Public"
   }
}

resource "aws_route_table_association" "subnet-pr-prod-public-az1" {
  subnet_id    = "subnet-02eeb48aa065cebf0"
  route_table_id = aws_route_table.RTB-pr-prod-Public.id
}


resource "aws_route_table_association" "subnet-pr-prod-public-az2" {
  subnet_id    = "subnet-01cbc2bd9c55fd781"
  route_table_id = aws_route_table.RTB-pr-prod-Public.id
}


resource "aws_route_table" "RTB-pr-prod-TGWA" {
  vpc_id = aws_vpc.main.id

tags = {
    Name = "RTB-pr-prod-TGWA"
   }
}

resource "aws_route_table_association" "subnet-pr-prod-tgwa-az1" {
  subnet_id    = "subnet-0f3199cfc8fa3cc9c"
  route_table_id = aws_route_table.RTB-pr-prod-TGWA.id
}


resource "aws_route_table_association" "subnet-pr-prod-tgwa-az2" {
  subnet_id    = "subnet-033f46aee48f06d99"
  route_table_id = aws_route_table.RTB-pr-prod-TGWA.id
}
