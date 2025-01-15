resource "aws_subnet" "private_subnets" {
  count                  = length(var.subnet_private_cidrs)
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.subnet_private_cidrs[count.index]
  availability_zone      = var.private_availability_zones[count.index]

  tags = merge(
    var.subnet_private_tags,
    {
      Name = var.subnet_private_names[count.index]
    }
  )
 }

resource "aws_subnet" "public_subnets" {
  count                  = length(var.subnet_public_cidrs)
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.subnet_public_cidrs[count.index]
  availability_zone      = var.public_availability_zones[count.index]

  tags = merge(
    var.subnet_public_tags,
    {
      Name = var.subnet_public_names[count.index]
    }
  )
 }


resource "aws_subnet" "tgwa_subnets" {
  count                  = length(var.subnet_public_cidrs)
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.subnet_tgwa_cidrs[count.index]
  availability_zone      = var.tgwa_availability_zones[count.index]

  tags = merge(
    var.subnet_tgwa_tags,
    {
      Name = var.subnet_tgwa_names[count.index]
    }
  )
 }


