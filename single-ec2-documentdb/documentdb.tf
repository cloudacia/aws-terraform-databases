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
resource "aws_docdb_cluster" "docdb_cluster_1" {
  cluster_identifier      = "my-docdb-cluster"
  engine                  = "docdb"
  master_username         = "administrator"
  master_password         = "password123"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  vpc_security_group_ids  = [aws_security_group.mysql_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_groups_01.name
  skip_final_snapshot     = true
}

###############################################
#  AWS DOCUEMNTDB INSTANCE                    #
###############################################
resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 2
  identifier         = "docdb-instance-${count.index}"
  cluster_identifier = aws_docdb_cluster.docdb_cluster_1.id
  instance_class     = "db.t3.medium"
}
