locals {
  account   = data.aws_caller_identity.account.account_id
  azs       = data.aws_availability_zones.current.names
  az_index  = {for i, az in local.azs: az => i}
  replicas  = var.read_replica && var.failover_replica == false ? local.az_index : {}
}
