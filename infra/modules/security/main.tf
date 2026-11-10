# Módulo de seguridad para la API de pedidos
# Superficie de práctica: implementar políticas IAM, security groups y roles

# TODO: El estudiante implementará las políticas de seguridad aquí
# Estructura esperada:
# - IAM roles para la API
# - Security groups para el balanceador y la API
# - Policies de acceso a recursos

# Security group para el balanceador de carga
resource "aws_security_group" "alb_security_group" {
  name        = "${var.app_name}-alb-sg"
  description = "Security group para ALB de la API de pedidos"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.app_name}-alb-sg"
    Environment = var.environment
  }
}

# Security group para los servidores de la API
resource "aws_security_group" "api_security_group" {
  name        = "${var.app_name}-api-sg"
  description = "Security group para servidores de la API de pedidos"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.app_name}-api-sg"
    Environment = var.environment
  }
}

# Reglas de entrada para el ALB
resource "aws_vpc_security_group_ingress_rule" "alb_https_ingress" {
  for_each          = toset(var.public_subnets)
  security_group_id = aws_security_group.alb_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  description       = "Permitir HTTPS desde internet"
}

resource "aws_vpc_security_group_ingress_rule" "alb_http_ingress" {
  for_each          = toset(var.public_subnets)
  security_group_id = aws_security_group.alb_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  description       = "Permitir HTTP desde internet"
}

# Reglas de salida para el ALB
resource "aws_vpc_security_group_egress_rule" "alb_egress" {
  security_group_id = aws_security_group.alb_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
  description       = "Permitir todo el tráfico saliente"
}

# Reglas de entrada para la API desde el ALB
resource "aws_vpc_security_group_ingress_rule" "api_from_alb" {
  security_group_id            = aws_security_group.api_security_group.id
  referenced_security_group_id = aws_security_group.alb_security_group.id
  from_port                    = var.api_port
  to_port                      = var.api_port
  ip_protocol                  = "tcp"
  description                  = "Permitir tráfico desde el ALB"
}

# Reglas de entrada para SSH desde red administrativa
resource "aws_vpc_security_group_ingress_rule" "api_ssh_admin" {
  security_group_id = aws_security_group.api_security_group.id
  cidr_ipv4         = "10.0.0.0/16"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "Permitir SSH desde red administrativa"
}

# Reglas de salida para la API
resource "aws_vpc_security_group_egress_rule" "api_egress" {
  security_group_id = aws_security_group.api_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
  description       = "Permitir todo el tráfico saliente"
}

# Rol IAM para los servidores de la API
resource "aws_iam_role" "api_ec2_role" {
  name = "${var.app_name}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Environment = var.environment
  }
}

# Política de CloudWatch para la API
resource "aws_iam_policy" "api_cloudwatch_policy" {
  name        = "${var.app_name}-cloudwatch-policy"
  description = "Política para escribir logs en CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })

  tags = {
    Environment = var.environment
  }
}

# Adjuntar política al rol
resource "aws_iam_role_policy_attachment" "api_cloudwatch_attachment" {
  role       = aws_iam_role.api_ec2_role.name
  policy_arn = aws_iam_policy.api_cloudwatch_policy.arn
}

# Output: ID del security group del ALB
output "alb_security_group_id" {
  description = "ID del security group del balanceador de carga"
  value       = aws_security_group.alb_security_group.id
}

# Output: ID del security group de la API
output "api_security_group_id" {
  description = "ID del security group de los servidores API"
  value       = aws_security_group.api_security_group.id
}

# Output: ARN del rol IAM de la API
output "api_role_arn" {
  description = "ARN del rol IAM para las instancias de la API"
  value       = aws_iam_role.api_ec2_role.arn
}