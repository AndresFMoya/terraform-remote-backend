// Init the S3 backend
terraform {
  backend "s3" {
    bucket         = "my-backend-bucket-my-app-name-000001"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "backend-lock-table"
    encrypt        = true
  }
}

// Additional Resources