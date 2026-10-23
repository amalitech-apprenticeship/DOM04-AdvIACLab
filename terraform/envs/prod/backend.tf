terraform {
  backend "s3" {
    bucket = "state-bucket-advlab-7w9w8a"
    key = "prod/terraform.tfstate"
    use_lockfile = true
    region = "eu-west-1"
    encrypt = true
  }
}