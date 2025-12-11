resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = var.validation_method
    
  key_algorithm = var.key_algorithm

  tags = {
    Environment = var.acm_tag
  }

  lifecycle {
    create_before_destroy = true
  }
}