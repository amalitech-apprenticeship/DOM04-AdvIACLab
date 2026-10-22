terraform {
  backend "s3" {
    key = "prod/terraform.tfstate"
    bucket = ""
    use_lockfile = true
    region = "us-east-1"
    encrypt = true
  }
}