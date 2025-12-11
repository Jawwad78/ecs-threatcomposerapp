output "acm_certificate_arn" {
  description = "acm certificate's arn"
  value = aws_acm_certificate.cert.arn
}