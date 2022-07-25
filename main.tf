resource "aws_db_subnet_group" "private_data" {
  name          = "private-data"
  description   = "Separate set of subnets for PostgreSQL."
  subnet_ids    = var.private_data_subnet_ids
}


resource "aws_db_instance" "primary" {
  db_name               = var.db_name
  engine                = var.engine
  engine_version        = var.engine_ver
  instance_class        = var.ec2_class
  identifier            = "primary"
  storage_encrypted     = true
  storage_type          = "gp2"
  allocated_storage     = var.gibibyte
  backup_window         = var.backup_window
  maintenance_window    = var.maintenance_window

  username              = "clerk"
  password              = random_password.once.result

  multi_az                    = var.failover_replica
  db_subnet_group_name        = aws_db_subnet_group.private_data.name

  vpc_security_group_ids      = [var.sg_postgres]
  backup_retention_period     = 5
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = true

  publicly_accessible         = false
  deletion_protection         = false
  skip_final_snapshot         = true
  apply_immediately           = false
}


resource "aws_db_instance" "replica" {
  for_each              = local.replicas

  replicate_source_db   = aws_db_instance.primary.identifier
  instance_class        = var.ec2_class
  availability_zone     = each.key
  identifier            = "replica-${each.key}"

  multi_az              = var.failover_read_replica

  publicly_accessible   = false
  deletion_protection   = false
  apply_immediately     = false
}
