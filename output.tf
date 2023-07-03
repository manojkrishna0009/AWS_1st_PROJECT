output "vpc_ids" {
  value = aws_vpc.vpc[*].id
}
output "db_subnet_group_name" {
  value = aws_db_subnet_group.subnet_group
}
output "aurora_endpoint" {
  value = aws_rds_cluster.aurora.endpoint
}
