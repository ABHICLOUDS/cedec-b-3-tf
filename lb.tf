resource "aws_lb_target_group" "my-target-group" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "my-test-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id     = aws_vpc.this.id
}

resource "aws_lb_target_group_attachment" "my-alb-target-group-attachment1" {
  target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  target_id        = resource.aws_instance.pub-1.*.id
  port             = 80
}

resource "aws_lb_listener" "my-test-alb-listner" {
  load_balancer_arn = "${aws_lb.my-alb.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  }
}

resource "aws_lb" "my-alb" {
  name     = "test-alb"
  internal = false
  vpc_security_group_ids      = [aws_security_group.this.id]
  subnets = aws_subnet.public_subnet.*.id

  tags = {
    Name = "${var.name}-my-test-alb"
  }
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
}

