###############################################
#  AWS RDS SUBNET GROUP SETTING               #
###############################################
resource "aws_db_subnet_group" "rds_subnet_groups_01" {
  name       = "cloudacia subnet group"
  subnet_ids = [aws_subnet.private_subnet_04.id, aws_subnet.private_subnet_03.id]
}

###############################################
#  AWS DOCUEMNTDB CLUSTER                    #
###############################################
resource "aws_neptune_cluster" "neptune_cluster_1" {
  cluster_identifier                  = "neptune-cluster-demo"
  engine                              = "neptune"
  backup_retention_period             = 5
  preferred_backup_window             = "07:00-09:00"
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = true
  vpc_security_group_ids              = [aws_security_group.mysql_sg.id]
  neptune_subnet_group_name           = aws_db_subnet_group.rds_subnet_groups_01.name
  apply_immediately                   = true
}

###############################################
#  AWS DOCUEMNTDB INSTANCE                    #
###############################################
resource "aws_neptune_cluster_instance" "neptune_instance" {
  count              = 2
  cluster_identifier = aws_neptune_cluster.neptune_cluster_1.id
  engine             = "neptune"
  instance_class     = "db.r5.large"
  apply_immediately  = true
}
