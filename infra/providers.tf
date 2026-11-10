# Configuración de providers para Terraform
# Este archivo define los providers necesarios para el despliegue de la infraestructura
# de la API de la app de pedidos, incluyendo AWS y otros providers auxiliares.

terraform {
  required_version = "~> 1.9.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

# Provider principal para AWS
provider "aws" {
  region = var.aws_region
  # Las credenciales se configuran mediante variables de entorno o AWS CLI
  # Ejemplo: export AWS_ACCESS_KEY_ID="tu_access_key"
  #          export AWS_SECRET_ACCESS_KEY="tu_secret_key"
}

# Provider con alias para entornos múltiples (ej. dev, prod)
provider "aws" {
  alias  = "dev"
  region = var.aws_region
}

provider "aws" {
  alias  = "prod"
  region = var.aws_region
}