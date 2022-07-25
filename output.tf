# Primary DB Instance
output "primary_arn" {
  value = aws_db_instance.primary.arn
}


output "primary_hostname" {
  value = aws_db_instance.primary.address
  sensitive = true
}


output "primary_allocated_storage" {
  value = aws_db_instance.primary.allocated_storage
}


output "primary_az" {
  value = aws_db_instance.primary.availability_zone
}


output "primary_backup_window" {
  value = aws_db_instance.primary.backup_window
}


output "primary_backup_retention_period" {
  value = aws_db_instance.primary.backup_retention_period
}


output "primary_ca_cert_id" {
  value = aws_db_instance.primary.ca_cert_identifier
}


output "primary_db_name" {
  value = aws_db_instance.primary.db_name
}


output "primary_db_endpoint" {
  value       = aws_db_instance.primary.endpoint
  description = "address:port"
  sensitive = true
}


output "primary_engine" {
  value = aws_db_instance.primary.engine
}


output "primary_engine_actual" {
  value = aws_db_instance.primary.engine_version_actual
}


output "primary_dns" {
  value = aws_db_instance.primary.hosted_zone_id
}


output "primary_id" {
  value = aws_db_instance.primary.id
}


output "primary_ec2" {
  value = aws_db_instance.primary.instance_class
}


output "primary_latest_restorable_time" {
  value = aws_db_instance.primary.latest_restorable_time
}


output "primary_maintenance_window" {
  value = aws_db_instance.primary.maintenance_window
}


output "primary_multi_az" {
  value = aws_db_instance.primary.multi_az
}


output "primary_name" {
  value = aws_db_instance.primary.name
}


output "primary_port" {
  value = aws_db_instance.primary.port
}


output "primary_status" {
  value = aws_db_instance.primary.status
}


output "encryption_primary" {
  value = aws_db_instance.primary.storage_encrypted
}


output "primary_username" {
  value = aws_db_instance.primary.username
  sensitive = true
}


output "primary_resource_id" {
  value = aws_db_instance.primary.resource_id
}


output "encryption_read_replicas" {
  value = values(aws_db_instance.replica).*.storage_encrypted
}


output "replicas_dns" {
  value = values(aws_db_instance.replica).*.hosted_zone_id
}


output "password" {
  value = aws_db_instance.primary.password
  sensitive = true
}


output "db_subnet_private_data" {
  value = aws_db_subnet_group.private_data.id
}
