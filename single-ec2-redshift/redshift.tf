###############################################
#  AWS RDS SUBNET GROUP SETTING               #
###############################################
resource "aws_redshift_subnet_group" "aws_redshift_subnet_group" {
  name       = "cloudacia-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_04.id, aws_subnet.private_subnet_03.id]

  tags = {
    environment = "cloudacia"
  }
}

###############################################
#  AWS REDSHIFT CLUSTER                       #
###############################################
resource "aws_redshift_cluster" "example" {
  cluster_identifier        = "tf-redshift-cluster"
  cluster_type              = "single-node"
  database_name             = "cloudaciadb"
  master_username           = "administrator"
  master_password           = "Password123"
  node_type                 = "dc2.large"
  cluster_subnet_group_name = aws_redshift_subnet_group.aws_redshift_subnet_group.name
  skip_final_snapshot       = true
}

###############################################
#  AWS DOCUEMNTDB INSTANCE                    #
###############################################
#resource "aws_docdb_cluster_instance" "cluster_instances" {
#  count              = 2
#  identifier         = "docdb-instance-${count.index}"
#  cluster_identifier = aws_docdb_cluster.docdb_cluster_1.id
#  instance_class     = "db.t3.medium"
#}
