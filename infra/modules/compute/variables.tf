// Variables para el módulo de compute (ASG, ALB, Launch Template)

variable "app_name" {
  description = "Nombre de la aplicación"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "key_pair_name" {
  description = "Nombre del par de claves SSH"
  type        = string
}

variable "api_security_group_id" {
  description = "ID del grupo de seguridad para la API"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
  default     = 4
}

variable "min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
  default     = 1
}

variable "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  type        = list(string)
}

variable "api_port" {
  description = "Puerto de la API"
  type        = number
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}