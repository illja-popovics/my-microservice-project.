resource "aws_db_instance" "this" {
  count                     = var.use_aurora ? 0 : 1
  identifier                = "${var.db_name}-instance"
  allocated_storage         = 20
  engine                    = var.engine
  engine_version            = var.engine_version
  instance_class            = var.instance_class
  db_name                   = var.db_name
  username                  = var.db_username
  password                  = var.db_password
  db_subnet_group_name      = aws_db_subnet_group.db.name
  vpc_security_group_ids    = [aws_security_group.rds.id]
  parameter_group_name      = aws_db_parameter_group.db.name
  multi_az                  = var.multi_az
  skip_final_snapshot       = true
  deletion_protection       = false
  publicly_accessible       = false

  tags = {
    Name = "${var.db_name}-instance"
  }
}
