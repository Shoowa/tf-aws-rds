package test
import (
	"fmt"
	"testing"
	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestPostgres(t *testing.T) {
	terraformOpts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/postgres"
	})

	defer terraform.Destroy(t, terraformOpts)
	terraform.InitAndApply(t, terraformOpts)

	db_name := terraform.Output(t, terraformOpts, "primary_db_name")
	port := terraform.Output(t, terraformOpts, "primary_port")
	encryption := terraform.Output(t, terraformOpts, "primary_storage_encrypted")

	assert.Equal(t, db_name, "test")
	assert.Equal(t, port, 5432)
	assert.Equal(t, encryption, true)
}
