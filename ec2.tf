resource "aws_instance" "pub-1" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id =element(aws_subnet.public_subnet.*.id, count.index)
  key_name      = "ohio-new"
  vpc_security_group_ids      = [aws_security_group.this.id]
  user_data = file("${path.module}/script.sh")
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

resource "aws_security_group" "this" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  dynamic "ingress" {
    for_each = [80,8080,443,9090,9000,22]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}