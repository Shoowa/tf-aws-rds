variable "region" {
  type        = string
  description = "Name of AWS region"
  default     = "us-east-2"
}


variable "environ" {
  type        = string
  default     = "dev"
}


variable "db_name" {
  type        = string
  description = "Name of database"
  default     = "omni"
}


variable "gibibyte" {
  type  = number
  description = "RDS Storage size in Gibibytes."
}


variable "engine" {
  type          = string
  description   = "Either 'mariadb' or 'mysql' or 'postgres' or 'oracle'"
  default       = "postgres"
}


variable "engine_ver" {
  type          = string
}


variable "ec2_class" {
  type          = string
  description   = "EC2 server type."
  default       = "db.t3.micro"
}


variable "private_data_subnet_ids" {
  type          = list
  description   = "Subnet IDs of private data."
}


variable "vpc_id" {
  type          = string
  description   = "Read from the output of a VPC module."
}


variable "backup_window" {
  type          = string
  description   = "UTC time range to copy data. Can't overlap maintenance_window."
  default       = "04:30-05:30"
}


variable "maintenance_window" {
  type          = string
  description   = "OS Updates for the server. UTC time. Format is ddd:hh24:mi-ddd:hh24:mi e.g. Mon:00:00-Mon:03:00"
  default       = "Sun:07:00-Sun:09:00"
}


variable "failover_replica" {
  type        = bool
  description = "Erect a passive, synchronous replica for failover. Incompatible with IPv6."
  default     = false
}


variable "read_replica" {
  type        = bool
  description = "Erect an active, asynchronous replica to serve Read requests."
  default     = true
}


variable "failover_read_replica" {
  type        = bool
  description = "Erect a passive, synchronous replica to failover Read requests."
  default     = false
}


variable "sg_postgres" {
  type          = string
  description   = "Security Group ID of firewall that guards RDS Postgres."
}


variable "sg_cred_rotation" {
  type          = string
  description   = "Security Group ID firewall that guards Lambda ENI."
}


variable "secrets_dns_name" {
  type          = string
  description   = "DNS Name of Secrets VPC Endpoint."
}
