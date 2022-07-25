data "aws_caller_identity" "account" {}


data "aws_availability_zones" "current" {}


data "aws_iam_role" "architect" {
  name = "architect"
}


data "aws_serverlessapplicationrepository_application" "rotate_postgres" {
  application_id = "arn:aws:serverlessrepo:us-east-1:297356227824:applications/SecretsManagerRDSPostgreSQLRotationSingleUser"
}
