variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "project_name" {
  description = "Project prefix"
  type        = string
}
