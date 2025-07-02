resource "aws_db_instance" "postgres" {
  identifier         = "lesson7-postgres"
  allocated_storage  = 20
  storage_type       = "gp2"
  engine             = "postgres"
  engine_version     = "17.4"
  instance_class     = "db.t3.micro"
  username           = "django_user"
  password           = "pass9764gd"
  db_name            = "django_db"
  publicly_accessible = false
  skip_final_snapshot = true
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = var.subnet_group_name
}
