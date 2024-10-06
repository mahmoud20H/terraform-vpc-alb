
resource "aws_lb" "application_load_balancer" {
  name                       = var.load_balancer_name                                 # Load balancer name as a variable
  internal                   = false                                                  # Set to false for public access
  load_balancer_type         = "application"                                          # Load balancer type
  security_groups            = [aws_security_group.alb_sg.id]                         # Reference to security group for the ALB
  enable_deletion_protection = false                                                  # Disable deletion protection
  subnets                    = [var.private_subnet_1_cidr, var.private_subnet_2_cidr] # Use two private subnets

  tags = {
    Name = var.load_balancer_name # Set the name tag
  }
}
resource "aws_lb_target_group" "target_group" {
  name     = "TG-test"       # Target group name
  port     = 80              # Port for the target group
  protocol = "HTTP"          # Protocol for the target group
  vpc_id   = aws_vpc.main.id # VPC ID for the target group

  health_check {
    path                = "/"    # Path for health check
    interval            = 30     # Interval in seconds between health checks
    timeout             = 5      # Timeout for each health check
    healthy_threshold   = 2      # Number of healthy checks before considering the target healthy
    unhealthy_threshold = 2      # Number of unhealthy checks before considering the target unhealthy
    protocol            = "HTTP" # Health check protocol
  }

  tags = {
    Name = "TG-test" # Tag for the target group
  }
}
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn # Reference to your ALB
  port              = 80                                   # Port for the listener
  protocol          = "HTTP"                               # Protocol for the listener

  default_action {
    type             = "forward"                            # Action type
    target_group_arn = aws_lb_target_group.target_group.arn # Reference to your target group
  }
}
