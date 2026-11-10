# Definición de variables para el despliegue de la infraestructura de la API de la app de pedidos
# Estas variables permiten parametrizar la configuración para diferentes entornos.

# Variable para la región de AWS
variable "aws_region" {
  description = "Región de AWS donde se desplegarán los recursos"
  type        = string
  # Valor por defecto, se puede sobrescribir en terraform.tfvars
  default = "us-east-1"
}

# Variable para el puerto de la API
variable "api_port" {
  description = "Puerto en el que la API escuchará las peticiones"
  type        = number
}

# Variable para el nombre del entorno (ej. dev, prod)
variable "environment" {
  description = "Nombre del entorno de despliegue (dev, prod, etc.)"
  type        = string
}

# Variable para el nombre de la aplicación
variable "app_name" {
  description = "Nombre de la aplicación"
  type        = string
  default     = "pedidos-app"
}

# Variable para el tamaño de la instancia EC2
variable "instance_type" {
  description = "Tipo de instancia EC2 para el despliegue de la API"
  type        = string
  default     = "t3.micro"
}

# Variable para el tamaño del almacenamiento de la base de datos
variable "db_storage_size" {
  description = "Tamaño del almacenamiento de la base de datos en GB"
  type        = number
  default     = 20
}

# Variable para el nombre de usuario de la base de datos
variable "db_username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
}

# Variable para la contraseña de la base de datos
variable "db_password" {
  description = "Contraseña para la base de datos"
  type        = string
  sensitive   = true
}

# Variable para el identificador del VPC
variable "vpc_id" {
  description = "Identificador del VPC donde se desplegarán los recursos"
  type        = string
}

# Variable para las subredes públicas
variable "public_subnets" {
  description = "Lista de IDs de subredes públicas para el despliegue"
  type        = list(string)
}

# Variable para las subredes privadas
variable "private_subnets" {
  description = "Lista de IDs de subredes privadas para el despliegue"
  type        = list(string)
}

# Variable para el ARN del certificado SSL
variable "ssl_certificate_arn" {
  description = "ARN del certificado SSL para HTTPS"
  type        = string
}