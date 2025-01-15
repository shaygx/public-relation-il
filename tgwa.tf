resource "aws_ec2_transit_gateway_vpc_attachment" "tgwa-pr-prod" {
	transit_gateway_id = var.tgw_id
  	vpc_id             = aws_vpc.main.id
	subnet_ids         = ["subnet-0f3199cfc8fa3cc9c", "subnet-033f46aee48f06d99"]
  tags = var.tags
  } 


resource "aws_route" "route-to-tgw-1" {
    route_table_id         =  aws_route_table.RTB-pr-prod-Private.id
    destination_cidr_block = "10.10.20.20/32"  # First destination CIDR block
    transit_gateway_id     = "tgw-0430826c231550bf5"  # Same Transit Gateway ID as the target
}

resource "aws_route" "route_to_tgw-2" {
   route_table_id         =  aws_route_table.RTB-pr-prod-Private.id
   destination_cidr_block = "0.0.0.0/0"  # Secound destination CIDR block
   transit_gateway_id     = "tgw-0430826c231550bf5"  # Same Transit Gateway ID as the target
 
}
