provider "aws" {
  
}

resource "aws_s3_bucket" "my-first-buck" {
  bucket = "test-cedec-b-3"

  tags = {
    Name        = "cedec-b-3"
    Environment = "DevOps-batch"
  }
}
