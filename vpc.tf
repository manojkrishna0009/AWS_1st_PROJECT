resource "aws_vpc" "vpc" {
  count = var.vpc_count

  cidr_block = var.vpc_cidr_blocks[count.index]
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_names[count.index]
  }
}

 resource "aws_subnet" "subnet" {
  count = 2

  cidr_block = "10.2.${count.index}.0/24"
  vpc_id = aws_vpc.vpc[2].id
  availability_zone = element(var.availability_zones, count.index)
  tags = {
    "Name" = "subnet-${count.index}"
  }

  # Other subnet configuration...
}
resource "aws_subnet" "ec_subnet_a" {
  vpc_id     = aws_vpc.vpc[1].id
  cidr_block = var.subnet_a_cidr_block
  availability_zone = var.subnet_a_az
}

resource "aws_subnet" "ec_subnet_b" {
  vpc_id     = aws_vpc.vpc[1].id
  cidr_block = var.subnet_b_cidr_block
  availability_zone = var.subnet_b_az
}