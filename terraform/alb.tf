resource "aws_lb" "main_alb" {
  name               = "main-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups = ["sg-0615102c668df4ff0"]
subnets = ["subnet-02822d2e031a90088", "subnet-0e37bdccfd6db4fac"]

  enable_deletion_protection = false
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Welcome to Technology Next!"
      status_code  = "200"
    }
  }
}
