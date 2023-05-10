provider "aws" {
  
}

resource "aws_iam_user" "demo_tf_user" {
  name = "aws-demo-user"
  
  tags = {
    tag-key = "dev"
  }
}
