###############################################
#  AWS RDS SUBNET GROUP SETTING               #
###############################################
resource "aws_db_subnet_group" "rds_subnet_groups_01" {
  name       = "cloudacia subnet group"
  subnet_ids = [aws_subnet.private_subnet_04.id, aws_subnet.private_subnet_03.id]
}

###############################################
#  AWS RDS INSTANCE                           #
###############################################
resource "aws_db_instance" "postgresql_db_01" {
  allocated_storage       = 20
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  instance_class          = var.rds_instance_class
  db_name                 = var.rds_db_name
  username                = var.rds_db_username
  password                = var.rds_db_password
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_groups_01.id
  vpc_security_group_ids  = [aws_security_group.postgresql_sg.id]
  backup_retention_period = 35
}
