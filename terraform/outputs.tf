output "alb_dns" {
  value = aws_lb.main_alb.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.mysql.endpoint
}
