resource "random_password" "once" {
  length        = 40
  special       = true
  min_special   = 5
}


resource "aws_secretsmanager_secret" "postgres" {
  name = var.db_name
}


resource "aws_secretsmanager_secret_version" "postgres" {
  secret_id       = aws_secretsmanager_secret.postgres.id
  secret_string   = jsonencode({
    engine        = "postgres"
    host          = aws_db_instance.primary.endpoint
    username      = aws_db_instance.primary.username
    password      = aws_db_instance.primary.password
    dbname        = var.db_name
  })
}


resource "aws_secretsmanager_secret_rotation" "rotation" {
  secret_id             = aws_secretsmanager_secret_version.postgres.secret_id
  rotation_lambda_arn   = aws_serverlessapplicationrepository_cloudformation_stack.rotate_postgres.outputs.RotationLambdaARN

  rotation_rules {
    automatically_after_days = 30
  }
}
