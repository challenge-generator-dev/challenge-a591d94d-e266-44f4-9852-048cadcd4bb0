# Variables de entorno para el ambiente de desarrollo
# Este archivo contiene valores sensibles y debe ser excluido del control de versiones.
# Para aplicar la configuración, ejecuta:
#   terraform apply -var-file=environments/dev/terraform.tfvars

# Configuración de AWS
aws_region = "us-east-1"

# Configuración de la aplicación
app_name    = "pedidos-app"
environment = "dev"
api_port    = 8080

# Configuración de la instancia EC2
instance_type = "t3.micro"

# Configuración de la base de datos RDS
# Nota: En un entorno real, estos valores deberían ser inyectados desde un sistema de secretos
# como AWS Secrets Manager o HashiCorp Vault
db_storage_size = 20
db_username     = "admin"
db_password     = "securepassword123!" # En producción, usar un valor seguro y gestionado por Secrets Manager

# Configuración de red
# Estos valores deben coincidir con los IDs de la VPC y subnets existentes en tu cuenta AWS
vpc_id          = "vpc-1234567890abcdef0"
public_subnets  = ["subnet-1234567890abcdef0", "subnet-0987654321abcdef0"]
private_subnets = ["subnet-abcdef01234567890", "subnet-def0123456789abcd"]

# Certificado SSL para el balanceador de carga
# Debe ser un ARN válido de un certificado existente en AWS Certificate Manager
ssl_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"