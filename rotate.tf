resource "aws_serverlessapplicationrepository_cloudformation_stack" "rotate_postgres" {
  name            = "rotate-postgres"
  application_id  = data.aws_serverlessapplicationrepository_application.rotate_postgres.application_id
  capabilities    = data.aws_serverlessapplicationrepository_application.rotate_postgres.required_capabilities
  parameters      = {
    functionName        = "rotate-postgres"
    endpoint            = "https://${var.secrets_dns_name}"
    vpcSubnetIds        = join(",", var.private_data_subnet_ids)
    vpcSecurityGroupIds = var.sg_cred_rotation
  }
}
