resource "aws_secretsmanager_secret" "secret_NS" {
  name = "secret_NSS"
  tags = {
    Environment = "production"
  }
}

resource "random_password" "db_password" {
  length           = 32
  special          = true
  override_special = "/@#"
}

resource "aws_secretsmanager_secret_version" "secretmanager_NSS" {
  secret_id     = aws_secretsmanager_secret.secret_NS.id
  secret_string = random_password.db_password.result
}
