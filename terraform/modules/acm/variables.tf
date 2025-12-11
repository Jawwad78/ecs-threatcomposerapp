variable "domain_name" {
    type = string
    description = "my domain name "
}

variable "validation_method" {
  type = string
  description = "validation method "
}

variable "acm_tag" {
  type = string
  description = "my acm cert tag"
}

variable "key_algorithm" {
  type = string
  description = "acm key algorithm"
}