###############################################
#  AWS RDS SUBNET GROUP SETTING               #
###############################################
resource "aws_elasticache_subnet_group" "rds_subnet_groups_01" {
  name       = "cloudacia-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_04.id, aws_subnet.private_subnet_03.id]
}

###############################################
#  ELASTICACHE REDIS SETTTING                 #
###############################################

resource "aws_elasticache_replication_group" "redis_wp" {
  automatic_failover_enabled = true
  replication_group_id       = "tf-rep-group-1"
  description                = "Redis Replication"
  node_type                  = "cache.t2.micro"
  num_cache_clusters         = 2
  parameter_group_name       = "default.redis6.x"
  port                       = 6379
  subnet_group_name          = aws_elasticache_subnet_group.rds_subnet_groups_01.name
  security_group_ids         = [aws_security_group.elasticache.id]
  multi_az_enabled           = true
}
