resource "aws_db_subnet_group" "subnet_group" {
  name = "subnet_group"
  description = "subnet group"
  subnet_ids  = flatten([for s in aws_subnet.subnet: s.id])
}

resource "aws_rds_cluster_parameter_group" "aurora" {
  name_prefix = "aurora-"
  family      = "aurora-mysql5.7"
  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }
}

resource "aws_rds_cluster" "aurora" {
  engine         = "aurora-mysql"
  engine_version = "8.0.mysql_aurora.3.02.2"
  database_name  = "NS_aurora_db"
  master_username = "admin"
  master_password = "random_password.db_password.result"
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [aws_security_group.sg_notification.id]
  skip_final_snapshot = true
}

resource "aws_rds_cluster_instance" "aurora" {
  count               = 2
  cluster_identifier  = aws_rds_cluster.aurora.id
  instance_class      = "db.r5.large"   
  engine              = "aurora-mysql"  
  engine_version      = "8.0.mysql_aurora.3.02.2"
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name
}
