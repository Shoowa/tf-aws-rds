module "postgres" {
  source      = "../../"

  environ     = "dev"
  region      = "us-east-2"
  db_subnet   = "private-data"

  db_name     = "test"
  engine      = "postgres"
  engine_ver  = "14.2"
  ec2_class   = "db.t3.micro"
  gibibyte    = 10

  failover_replica      = false
  read_replica          = false
  failover_read_replica = false

}
