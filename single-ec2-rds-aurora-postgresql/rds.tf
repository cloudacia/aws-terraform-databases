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
resource "aws_rds_cluster" "rds_aurora_mysql" {
  cluster_identifier      = var.rds_aurora_cluster_name
  vpc_security_group_ids  = [aws_security_group.mysql_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_groups_01.name
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  availability_zones      = [var.availability_zone01, var.availability_zone01]
  database_name           = var.rds_db_name
  master_username         = var.rds_db_username
  master_password         = var.rds_db_password
  skip_final_snapshot     = true
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}

resource "aws_rds_cluster_instance" "cluster_instances_01" {
  count              = 2
  identifier         = "aurora-cluster-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.rds_aurora_mysql.id
  instance_class     = var.rds_instance_class
  engine             = aws_rds_cluster.rds_aurora_mysql.engine
  engine_version     = aws_rds_cluster.rds_aurora_mysql.engine_version
}
