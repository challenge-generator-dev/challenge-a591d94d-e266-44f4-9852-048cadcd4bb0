# Valores de variables para el entorno de desarrollo
# Aplicar con: terraform apply -var-file="envs/dev.tfvars"

# Configuración regional aws_region = "us-east-1"

# Puerto de la API api_port = 8080

# Nombre de la aplicación
app_name = "pedidos-app"

# Entorno
environment = "dev"

# Tipo de instancia para desarrollo (más económica)
instance_type = "t3.micro"

# Almacenamiento de la base de datos en GB
db_storage_size = 20

# Credenciales de base de datos (en producción usar secrets)
db_username = "dev_admin"
db_password = "DevPassword2024!"

# VPC donde se desplegará la infraestructura
vpc_id = "vpc-0abc123dev456def789"

# Subnets públicas para el ALB
public_subnets = ["subnet-0a1b2c3d4e5f6g7h8", "subnet-9i8j7k6l5m4n3o2p1"]

# Subnets privadas para los servidores API
private_subnets = ["subnet-1q2w3e4r5t6y7u8i9o0", "subnet-9p0o8i7u6y5t4r3e2w"]

# Certificado SSL (usar uno de prueba en dev)
ssl_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/dev-test-cert"