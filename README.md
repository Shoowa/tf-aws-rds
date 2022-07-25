# tf-aws-rds
Terraform module for AWS RDS Postgres.

## Test
Instances of the module are drafted in _examples/_.

The tests invoke those instances. The first instance for testing is simply named _postgres_, and it is referenced below.
```go
terraformOpts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
    TerraformDir: "../examples/postgres"
})
```

## Credentials
A random password is generated once, encrypted in the remote Terraform state file, added to the Postgres database, and written to the AWS Secrets Manager
service. Soon afterward, a Lambda function changes the password in the Secrets Manager and database.

This technique avoids an interrupted, manual process. This creates all the resources in one apply-operation, instead of asking Terraform to target the Secrets
Manager resources and create them first, then asking a person to type a password into the console, then asking Terraform to create the rest of the resources.

```bash
~/tf-aws-rds $ AWS_PROFILE=name terraform plan
```
