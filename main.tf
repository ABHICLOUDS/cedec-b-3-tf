provider "aws" {
  region = var.region
}

resource "aws_instance" "my-inst" {
  ami           = var.ami
  instance_type = "t2.micro"
  associate_public_ip_address = var.pub_ip
  key_name =var.key_pair
  security_groups = ["default"]
  vpc_security_group_ids = [aws_security_group.this.id]
  iam_instance_profile =var.role
  user_data = file("${path.module}/script.sh")
  root_block_device{
      volume_size = 10
      volume_type = "gp2"
    }
   tags = var.tag
}

output "instance_ip_addr" {
  value = aws_instance.my-inst.public_ip
}

