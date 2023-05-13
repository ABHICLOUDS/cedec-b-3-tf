provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "my-inst" {
  ami           = "ami-08333bccc35d71140"

  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name ="ohio-new"
  security_groups = ["default"]
  vpc_security_group_ids = [aws_security_group.this.id]

   root_block_device{
      volume_size = 10
      volume_type = "gp2"
    }
   tags = {
    Name = "tf-demo-instance"
  }
}

