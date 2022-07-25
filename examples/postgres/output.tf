output "primary_arn" {
  value = module.postgres.primary_arn
}


output "primary_id" {
  value = module.postgres.primary_id
}


output "primary_hostname" {
  value = module.postgres.primary_hostname
  sensitive = true
}


output "primary_storage_size" {
  value = module.postgres.primary_allocated_storage
}


output "primary_az" {
  value = module.postgres.primary_az
}


output "primary_backup_window" {
  value = module.postgres.primary_backup_window
}


output "primary_backup_retention_period" {
  value = module.postgres.primary_backup_retention_period
}


output "primary_dns" {
  value = module.postgres.primary_dns
}


output "primary_latest_restorable_time" {
  value = module.postgres.primary_latest_restorable_time
}


output "primary_multi_az" {
  value = module.postgres.primary_multi_az
}


output "encryption_primary" {
  value = module.postgres.encryption_primary
}


output "password" {
  value = module.postgres.password
  sensitive = true
}


output "replicas" {
  value = module.postgres.replicas_dns
}
