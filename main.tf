resource "aws_instance" "prv-1" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name               = "my-demo-key"
  vpc_security_group_ids = ["default"]
   tags = {
    Name = "demo-inst"
   }
}

   resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
  }

  resource "aws_key_pair" "generated_key" {
  key_name   = "my-demo-key"
  public_key = tls_private_key.example.public_key_openssh
}


