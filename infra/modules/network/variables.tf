# Variables del módulo de red para la API de pedidos
# Estas variables definen la configuración de red necesaria para el despliegue

variable "app_name" {
  type        = string
  description = "Nombre de la aplicación para identificar recursos"
}

variable "environment" {
  type        = string
  description = "Entorno de despliegue (dev, staging, prod)"
}

variable "vpc_cidr" {
  type        = string
  description = "Bloque CIDR para la VPC principal"
}

variable "availability_zones" {
  type        = list(string)
  description = "Zonas de disponibilidad donde se crearán las subredes"
}

variable "public_subnets_cidr" {
  type        = list(string)
  description = "Lista de bloques CIDR para las subredes públicas"
}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "Lista de bloques CIDR para las subredes privadas donde correrán los servicios"
}

variable "api_port" {
  type        = number
  description = "Puerto en el que la API escuchará las peticiones"
}