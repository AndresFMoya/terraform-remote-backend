//Create S3 Bucket

provider "aws" {
  region  = "us-east-1"
  version = "~>2.59"
}

resource "aws_s3_bucket" "enterprise_backend_state" {
  bucket = "my-backend-bucket-my-app-name-000001"

  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

// Create the Dynamo Table

resource "aws_dynamodb_table" "enterprise_backend_state" {
  hash_key     = "LockID"
  name         = "backend-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}