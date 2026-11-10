# Módulo de red para la API de pedidos
# Superficie de práctica: el estudiante implementará los recursos de red

resource "aws_vpc" "api_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.app_name}-vpc"
    Environment = var.environment
  }
}

resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnets_cidr)
  vpc_id                  = aws_vpc.api_vpc.id
  cidr_block              = var.public_subnets_cidr[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.app_name}-public-subnet-${count.index + 1}"
    Environment = var.environment
    Type        = "public"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnets_cidr)
  vpc_id            = aws_vpc.api_vpc.id
  cidr_block        = var.private_subnets_cidr[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.app_name}-private-subnet-${count.index + 1}"
    Environment = var.environment
    Type        = "private"
  }
}

resource "aws_internet_gateway" "api_igw" {
  vpc_id = aws_vpc.api_vpc.id

  tags = {
    Name        = "${var.app_name}-igw"
    Environment = var.environment
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.api_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.api_igw.id
  }

  tags = {
    Name        = "${var.app_name}-public-rt"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "public_associations" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "api_sg" {
  name        = "${var.app_name}-sg"
  description = "Security group para la API de pedidos"
  vpc_id      = aws_vpc.api_vpc.id

  ingress {
    from_port   = var.api_port
    to_port     = var.api_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP para la API"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS para la API"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    description = "SSH para administración"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Salida permitir todo"
  }

  tags = {
    Name        = "${var.app_name}-sg"
    Environment = var.environment
  }
}

resource "aws_security_group" "db_sg" {
  name        = "${var.app_name}-db-sg"
  description = "Security group para la base de datos"
  vpc_id      = aws_vpc.api_vpc.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.api_sg.id]
    description     = "PostgreSQL desde API"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Salida permitir todo"
  }

  tags = {
    Name        = "${var.app_name}-db-sg"
    Environment = var.environment
  }
}

output "vpc_id" {
  value       = aws_vpc.api_vpc.id
  description = "ID de la VPC"
}

output "public_subnet_ids" {
  value       = aws_subnet.public_subnets[*].id
  description = "IDs de las subnets públicas"
}

output "private_subnet_ids" {
  value       = aws_subnet.private_subnets[*].id
  description = "IDs de las subnets privadas"
}

output "api_security_group_id" {
  value       = aws_security_group.api_sg.id
  description = "ID del security group de la API"
}

output "db_security_group_id" {
  value       = aws_security_group.db_sg.id
  description = "ID del security group de la base de datos"
}