output "load_balancer_ip" {
  value = aws_lb.app_alb.dns_name
}