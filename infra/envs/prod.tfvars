# Valores de variables para el entorno de producción
# Aplicar con: terraform apply -var-file="envs/prod.tfvars"
# ADVERTENCIA: Este archivo contiene valores sensibles
# Asegurar que esté excluido en .gitignore y usar secretos en producción real

# Configuración regional - producción en us-east-1
aws_region = "us-east-1"

# Puerto de la API - estándar para producción
api_port = 443

# Nombre de la aplicación
app_name = "pedidos-app"

# Entorno
environment = "prod"

# Tipo de instancia para producción - mayor capacidad
instance_type = "t3.small"

# Almacenamiento de la base de datos en GB - mayor para producción
db_storage_size = 50

# Credenciales de base de datos producción
# NOTA: En un escenario real, estas credenciales deben provenir de AWS Secrets Manager
# o HashiCorp Vault, nunca hardcodeadas en archivos de configuración
db_username = "prod_admin"
db_password = "ProdSecurePass2024!ChangeMe!"

# VPC de producción
vpc_id = "vpc-0prod123abc456def789ghi"

# Subnets públicas para el ALB en producción
public_subnets = ["subnet-prod1a2b3c4d5e6f7g8", "subnet-prod9h8i7j6k5l4m3n2o"]

# Subnets privadas para los servidores API en producción
private_subnets = ["subnet-prod1p2o3i4u5y6t7r8e", "subnet-prod9q8w7e6r5t4y3u2i1o"]

# Certificado SSL de producción - debe ser un certificado válido registrado en ACM
ssl_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/production-valid-cert"