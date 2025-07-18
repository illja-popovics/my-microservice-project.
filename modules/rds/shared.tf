resource "aws_db_subnet_group" "db" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.db_name}-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.db_name}-rds-sg"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.db_name}-rds-sg"
  }
}

resource "aws_db_parameter_group" "db" {
  name   = "${var.db_name}-param-group"
  family = var.engine == "postgres" ? "postgres14" : "mysql8.0"

  parameter {
    name  = "max_connections"
    value = "100"
  }

  parameter {
    name  = "log_statement"
    value = "none"
  }

  parameter {
    name  = "work_mem"
    value = "65536"
  }

  tags = {
    Name = "${var.db_name}-param-group"
  }
}
