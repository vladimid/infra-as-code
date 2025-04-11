resource "aws_lb" "lb" {
  name = format("%s-%s-lb", var.prefix, var.region)
  load_balancer_type = "application"
  internal           = false
  security_groups = [aws_security_group.lb_sg.id]
  # subnets            = aws_subnet.public_subnet[*].id
  subnets            = [for key, subnet in aws_subnet.public_subnets : subnet.id]

  enable_deletion_protection       = false
  enable_http2                     = true
  enable_cross_zone_load_balancing = true

  tags = {
    Name = format("%s-%s-lb", var.prefix, var.region)
  }
}

resource "aws_lb_target_group" "tg" {
  name = format("%s-%s-tg", var.prefix, var.region)
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"

  health_check {
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    interval            = "30"
    matcher             = "200,302"
    path                = "/users"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
  }

  tags = {
    Name = format("%s-%s-tg", var.prefix, var.region)
  }
}


resource "aws_lb_listener" "listener" {
  port              = 80
  protocol          = "HTTP"
  load_balancer_arn = aws_lb.lb.arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

  tags = {
    Name = format("%s-%s-listener", var.prefix, var.region)
  }
}


resource "aws_security_group" "lb_sg" {
  vpc_id      = aws_vpc.vpc.id
  description = "Allow HTTP/S traffic to ALB"
  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = ["${format("%s/32", var.my_public_ip_address)}"]
    }
}