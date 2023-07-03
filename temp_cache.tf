
resource "aws_route_table_association" "ec_subnet_a_association" {
  subnet_id = aws_subnet.ec_subnet_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "ec_subnet_b_association" {
  subnet_id = aws_subnet.ec_subnet_b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_nat_gateway" "example_nat" {
  allocation_id = aws_eip.example_eip.id
  subnet_id = aws_subnet.ec_subnet_a.id
}

resource "aws_eip" "example_eip" {
  vpc = true
}

resource "aws_elasticache_subnet_group" "ec_subnet_group" {
  name       = "ec-subnet-group"
  subnet_ids = [
    aws_subnet.ec_subnet_a.id,
    aws_subnet.ec_subnet_b.id
  ]
}

resource "aws_security_group" "example_sg" {
  name_prefix = var.sg_name_prefix
  vpc_id      = aws_vpc.vpc[1].id

  ingress {
    from_port   = var.sg_from_port
    to_port     = var.sg_to_port
    protocol    = var.sg_protocol
    cidr_blocks = var.sg_cidr_block
  }

  egress {
    from_port   = var.sg_from_port
    to_port     = var.sg_to_port
    protocol    = var.sg_protocol
    cidr_blocks = var.sg_cidr_block
  }
}
