# Create an ElastiCache cluster
resource "aws_elasticache_cluster" "ec_cluster" {
  cluster_id        = "ec-cluster"
  engine            = "redis"
  engine_version    = "6.x"
  node_type         = "cache.t3.small"
  num_cache_nodes   = 1
  port              = 6379
  subnet_group_name = aws_elasticache_subnet_group.ec_subnet_group.name
  security_group_ids = [aws_security_group.example_sg.id]
}