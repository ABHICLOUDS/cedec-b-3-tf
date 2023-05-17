resource "aws_instance" "pub-1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id =aws_subnet.public_subnet.id
  key_name      = "ohio-new"
  vpc_security_group_ids      = ["default"]

  tags = {
    Name = "${var.name}-pub-inst"
  }
}

resource "aws_instance" "prv-1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id =aws_subnet.private_subnet.id
  key_name      = "ohio-new"
  vpc_security_group_ids      = ["default"]
  tags = {
    Name = "${var.name}-prv-inst"
  }
}