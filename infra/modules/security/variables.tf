# Variables del módulo de seguridad para la API de pedidos
# Define los recursos de seguridad necesarios para proteger la infraestructura

variable "app_name" {
  type        = string
  description = "Nombre de la aplicación para identificar recursos de seguridad"
}

variable "vpc_id" {
  type        = string
  description = "ID de la VPC donde se aplicarán los grupos de seguridad"
}

variable "environment" {
  type        = string
  description = "Entorno de despliegue para configurar reglas según el entorno"
}

variable "public_subnets" {
  type        = list(string)
  description = "IDs de las subredes públicas para el balanceador de carga"
}

variable "api_port" {
  type        = number
  description = "Puerto de la API que debe ser permitido en el grupo de seguridad"
}