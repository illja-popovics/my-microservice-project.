output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.db.name
}

output "rds_sg_id" {
  value = aws_security_group.rds.id
}
