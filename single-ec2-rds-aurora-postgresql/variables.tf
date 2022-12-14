###############################################
#    AWS REGION                               #
###############################################
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "US East (N. Virginia)"
}

###############################################
#    AWS VPC CIDR                             #
###############################################
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = ""
}

###############################################
#    VPC SUBNET #1                            #
###############################################
variable "subnet01" {
  type        = string
  default     = "10.0.1.0/24"
  description = "A public network"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "availability_zone01" {
  type        = string
  default     = "us-east-1a"
  description = "US East (N. Virginia)"
}

###############################################
#    VPC SUBNET #2                            #
###############################################
variable "subnet02" {
  type        = string
  default     = "10.0.2.0/24"
  description = "A public network"
}

###############################################
#    VPC SUBNET #3                            #
###############################################
variable "subnet03" {
  type        = string
  default     = "10.0.3.0/24"
  description = "A private network"
}

###############################################
#    VPC SUBNET #3                            #
###############################################
variable "subnet04" {
  type        = string
  default     = "10.0.4.0/24"
  description = "A private network"
}



###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "availability_zone02" {
  type        = string
  default     = "us-east-1b"
  description = "US East (N. Virginia)"
}

###############################################
#    EC2 INSTANCE TYPE                         #
###############################################
variable "ec2_type" {
  type        = string
  default     = "t2.micro"
  description = ""
}

###############################################
#    EC2 AMI                                  #
###############################################
variable "aws_ami" {
  type        = string
  default     = "ami-026b57f3c383c2eec"
  description = "Amazon Linux 2"
}

###############################################
#    S3 VPC END-POINT FOR US-EAST REGION      #
###############################################
variable "s3_endpoint" {
  type        = string
  default     = "com.amazonaws.us-east-1.s3"
  description = "S3 vpc endpoint for us-east-1 region"
}

###############################################
#    SSH PUBLIC KEY                           #
###############################################
variable "ssh_public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5PcvlG+/CdPKwiGirz0nHFetCcQBv3WGHuJ8ETcOwj4e88I2PAHB+PCB6kEDVJ6gf8E3XDBPV/C1WA4BhrTM+ksj1veroakfcjbC7i2JbwInlDwXCCD48u6dapQxyFf5I0PfB7V31xtDzvwnRatmgyw7huGSskaP36PKsMoEdOCbHt1nBHpzCujb8qSfr4biQiEau7ZPra/8EF+51TdqoprBB0bx+vTVez7hIjK0qv3MgMG1AdtCn4VzpNSgCXTaszJSLi/tOa9nT9rnweZNzQ0BrpfPrHcFqodI/Ec0h5ukaCZvgfX/USj9dSYMTB+24OXdiRKKJsZ+Q2vAAlOHUU1kn2edokOxIvPrbhjo2/5Ma1VgoYUDagdGW0QPudn8Kk5VfuUA2S/cXrZZDKzzsx1VHY9eX+DAd1rDSR1yhoxVXTkYlGyXSclweqSf1WF8GnvK40gHXvLyfBM6Jqh50ASG9yNVGvI0pQG3ZNg+UcbWw8S8cLipdegLEOQuJQmU="
}

###############################################
#  RDS ENGINE                                 #
###############################################
variable "rds_engine" {
  type    = string
  default = "aurora-postgresql"
}

###############################################
# RDS ENGINE VERSION                          #
###############################################
variable "rds_engine_version" {
  type    = string
  default = "13.7"
}

###############################################
# RDS INSTANCE CLASS                          #
###############################################
variable "rds_instance_class" {
  type    = string
  default = "db.t3.medium"
}

###############################################
# RDS DB NAME                                 #
###############################################
variable "rds_db_name" {
  type    = string
  default = "cloudacia"
}

###############################################
# RDS DB USERNAME                             #
###############################################
variable "rds_db_username" {
  type    = string
  default = "root"
}

###############################################
# RDS DB USERNAME                             #
###############################################
variable "rds_db_password" {
  type    = string
  default = "password123"
}

###############################################
# RDS AURORA CLUTSER NAME                     #
###############################################
variable "rds_aurora_cluster_name" {
  type    = string
  default = "aurora-cluster-01"
}
