# Infraestructura como Código para la API de Pedidos

## Descripción
Este proyecto contiene la configuración de Terraform para desplegar la infraestructura necesaria
para la API de la aplicación móvil de pedidos. La infraestructura incluye:

- Redes (VPC, subnets públicas y privadas)
- Servidores EC2 para alojar la API
- Base de datos RDS PostgreSQL
- Balanceador de carga ALB
- Grupos de seguridad y políticas IAM

## Estructura del proyecto
```
.
├── environments/
│   ├── dev/
│   │   └── terraform.tfvars    # Variables específicas para desarrollo
│   └── prod/
│       └── terraform.tfvars   # Variables específicas para producción
├── modules/
│   ├── compute/
│   ├── database/
│   ├── network/
│   └── security/
├── main.tf                    # Configuración principal de Terraform
├── variables.tf               # Definición de variables
├── outputs.tf                 # Outputs del despliegue
├── providers.tf               # Configuración de providers
├── versions.tf                # Versiones de Terraform y providers
└── .terraform.lock.hcl        # Bloqueo de versiones de providers
```

## Requisitos previos
- Terraform >= 1.9.5
- AWS CLI configurado con credenciales válidas
- Cuenta AWS con permisos suficientes para crear los recursos
- VPC existente con subnets públicas y privadas
- Certificado SSL en AWS Certificate Manager

## Configuración inicial
1. Clonar este repositorio
2. Configurar las variables en `environments/dev/terraform.tfvars` (o `prod`)
3. Inicializar Terraform:
   ```bash
   terraform init
   ```

## Despliegue
Para desplegar la infraestructura en desarrollo:
```bash
terraform plan -var-file=environments/dev/terraform.tfvars
terraform apply -var-file=environments/dev/terraform.tfvars
```

Para producción, usar el archivo correspondiente:
```bash
terraform plan -var-file=environments/prod/terraform.tfvars
terraform apply -var-file=environments/prod/terraform.tfvars
```

## Outputs
Después del despliegue, Terraform mostrará:
- URL del balanceador de carga (endpoint de la API)
- Endpoint de la base de datos RDS
- IDs de los recursos creados

## Buenas prácticas
1. **Seguridad**: Nunca commitear archivos `.tfvars` con credenciales reales
2. **Modularidad**: Los módulos están organizados por responsabilidad funcional
3. **Versionamiento**: Usar `.terraform.lock.hcl` para garantizar consistencia
4. **Entornos separados**: Usar archivos `.tfvars` diferentes para cada entorno

## Solución de problemas
- **Error de permisos**: Verificar que las credenciales AWS tienen los permisos necesarios
- **Error de recursos existentes**: Algunos recursos (como VPC) deben existir previamente
- **Error de variables**: Asegurarse que todas las variables requeridas están definidas

## Notas importantes
- La configuración actual asume que la VPC y subnets ya existen
- En producción, las credenciales de la base de datos deben gestionarse con AWS Secrets Manager
- El balanceador de carga está configurado para HTTPS usando el certificado proporcionado