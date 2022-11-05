################################################
#  EC2 INSTANCE SECURITY GROUP                 #
################################################
resource "aws_security_group" "web01" {
  name        = "web01"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.this.id

  # SSH port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # http port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # Open access to public network
  egress {
    description = "Allow outbound ANY traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web01"
  }
}

################################################
#  VPC ENDPOINT SECURITY GROUP                 #
################################################
resource "aws_security_group" "ssm_endpoint" {
  name        = "ssm_endpoint"
  description = "Allow HTTPS traffic for SSM"
  vpc_id      = aws_vpc.this.id


  # http port
  ingress {
    description = "Allow inbound HTTPs traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # Open access to public network
  egress {
    description = "Allow outbound ANY traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSM"
  }
}


###############################################
#  AWS SECURITY GROUP FOR ELASTICACHE         #
###############################################
resource "aws_security_group" "elasticache" {
  name        = "elasticache"
  description = "Allow incoming traffic to port 6379/TCP"
  vpc_id      = aws_vpc.this.id
  tags = {
    Name = "elasticache"
  }

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
