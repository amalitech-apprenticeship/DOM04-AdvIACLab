terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }

    random = {
        source = "hashicorp/random"
        version = "~> 3.0"
    }
  }
}

resource "random_string" "random" {
  length = 6
  upper = false
  lower = true
  special = false
}

resource "aws_s3_bucket" "state_backend" {
  bucket = format("state-bucket-advlab-${random_string.random.result}")


  lifecycle {
    prevent_destroy = false
  }

  #to be used to delete forcibly remember to apply
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.state_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "state_bucket_name" {
  value = aws_s3_bucket.state_backend.bucket
}