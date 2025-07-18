variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "Username for the database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "14.9"
}

variable "instance_class" {
  description = "The instance type of the RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "use_aurora" {
  description = "Whether to use Aurora cluster instead of standalone RDS"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "VPC ID for the RDS resources"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for RDS subnet group"
  type        = list(string)
}
