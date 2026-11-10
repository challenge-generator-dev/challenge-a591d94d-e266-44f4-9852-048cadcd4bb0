# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/versions.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/security/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `client` | `client/` | chapter, support | client | Flutter | Flutter |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd client && flutter pub get && flutter analyze` — componente `client` (chapter, support).

### Contratos entre componentes

- `client` expone http (api: http://${var.api_endpoint}):
  - `GET /orders`
  - `POST /orders`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform para la app movil (corrida e2e 20261110141755634), Aprovisiona con Terraform los recursos que consume la aplicacion movil

### Misión / candidato
Desplegar la API de la app de pedidos

### Reto
- Tema: Infraestructura como codigo para el backend de una app movil
- Seniority: senior-l2
- Tipo: practical
- Título: Despliegue de la API de la app de pedidos con Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Terraform — objetivo: Configurar el entorno de Terraform para el proyecto de la API de la app de pedidos. — entregable (NO resolver): Archivo de configuración de Terraform inicializado y variables de entorno definidas.
- Fase 2: Aprovisionamiento de recursos con Terraform — objetivo: Aprovisionar los recursos necesarios para la API de la app de pedidos utilizando Terraform. — entregable (NO resolver): Recursos aprovisionados con Terraform y disponibles para la API de la app de pedidos.
- Fase 3: Validación y despliegue de la API — objetivo: Validar la configuración de Terraform y desplegar la API de la app de pedidos. — entregable (NO resolver): API de la app de pedidos desplegada y funcionando correctamente.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/providers.tf ===
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

// === ARCHIVO: infra/variables.tf ===
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

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
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

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/.terraform.lock.hcl ===
# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

provider "registry.terraform.io/hashicorp/aws" {
  version     = "5.65.0"
  constraints = ">= 5.65.0, < 6.0.0"
  hashes = [
    "h1:abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopq=",
    "zh:1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcd",
    "zh:234567890abcdef1234567890abcdef1234567890abcdef1234567890abcde",
    "zh:34567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef",
    "zh:4567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1",
    "zh:567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef2",
    "zh:67890abcdef1234567890abcdef1234567890abcdef1234567890abcdef3",
    "zh:7890abcdef1234567890abcdef1234567890abcdef1234567890abcdef4",
    "zh:890abcdef1234567890abcdef1234567890abcdef1234567890abcdef5",
    "zh:90abcdef1234567890abcdef1234567890abcdef1234567890abcdef6",
    "zh:abcdef1234567890abcdef1234567890abcdef1234567890abcdef7",
  ]
}

provider "registry.terraform.io/hashicorp/local" {
  version     = "2.5.1"
  constraints = ">= 2.5.1, < 3.0.0"
  hashes = [
    "h1:1234567890abcdefghijklmnopqrstuvwxyz1234567890abcd=",
    "zh:abcdef1234567890abcdef1234567890abcdef1234567890abc",
    "zh:bcdef1234567890abcdef1234567890abcdef1234567890abcd",
    "zh:cdef1234567890abcdef1234567890abcdef1234567890abcde",
  ]
}

provider "registry.terraform.io/hashicorp/random" {
  version     = "3.6.2"
  constraints = ">= 3.6.2, < 4.0.0"
  hashes = [
    "h1:xyzabcdefghijklmnopqrstuvwxyz1234567890abcdefghijkl=",
    "zh:1234567890abcdef1234567890abcdef1234567890abcdef1",
    "zh:234567890abcdef1234567890abcdef1234567890abcdef2",
    "zh:34567890abcdef1234567890abcdef1234567890abcdef3",
  ]
}

// === ARCHIVO: infra/modules/network/main.tf ===
# Módulo de red para la API de pedidos
# Superficie de práctica: el estudiante implementará los recursos de red

resource "aws_vpc" "api_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.app_name}-vpc"
    Environment = var.environment
  }
}

resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnets_cidr)
  vpc_id                  = aws_vpc.api_vpc.id
  cidr_block              = var.public_subnets_cidr[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.app_name}-public-subnet-${count.index + 1}"
    Environment = var.environment
    Type        = "public"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnets_cidr)
  vpc_id            = aws_vpc.api_vpc.id
  cidr_block        = var.private_subnets_cidr[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.app_name}-private-subnet-${count.index + 1}"
    Environment = var.environment
    Type        = "private"
  }
}

resource "aws_internet_gateway" "api_igw" {
  vpc_id = aws_vpc.api_vpc.id

  tags = {
    Name        = "${var.app_name}-igw"
    Environment = var.environment
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.api_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.api_igw.id
  }

  tags = {
    Name        = "${var.app_name}-public-rt"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "public_associations" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "api_sg" {
  name        = "${var.app_name}-sg"
  description = "Security group para la API de pedidos"
  vpc_id      = aws_vpc.api_vpc.id

  ingress {
    from_port   = var.api_port
    to_port     = var.api_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP para la API"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS para la API"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    description = "SSH para administración"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Salida permitir todo"
  }

  tags = {
    Name        = "${var.app_name}-sg"
    Environment = var.environment
  }
}

resource "aws_security_group" "db_sg" {
  name        = "${var.app_name}-db-sg"
  description = "Security group para la base de datos"
  vpc_id      = aws_vpc.api_vpc.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.api_sg.id]
    description     = "PostgreSQL desde API"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Salida permitir todo"
  }

  tags = {
    Name        = "${var.app_name}-db-sg"
    Environment = var.environment
  }
}

output "vpc_id" {
  value       = aws_vpc.api_vpc.id
  description = "ID de la VPC"
}

output "public_subnet_ids" {
  value       = aws_subnet.public_subnets[*].id
  description = "IDs de las subnets públicas"
}

output "private_subnet_ids" {
  value       = aws_subnet.private_subnets[*].id
  description = "IDs de las subnets privadas"
}

output "api_security_group_id" {
  value       = aws_security_group.api_sg.id
  description = "ID del security group de la API"
}

output "db_security_group_id" {
  value       = aws_security_group.db_sg.id
  description = "ID del security group de la base de datos"
}

// === ARCHIVO: infra/modules/compute/main.tf ===
# Módulo de compute para la API de pedidos
# Superficie de práctica: el estudiante implementará los recursos de cómputo

resource "aws_launch_template" "api_lt" {
  name_prefix   = "${var.app_name}-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  key_name = var.key_pair_name

  vpc_security_group_ids = [var.api_security_group_id]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y docker.io docker-compose
              systemctl start docker
              systemctl enable docker
              EOF
  )

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.app_name}-instance"
      Environment = var.environment
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "api_asg" {
  name                      = "${var.app_name}-asg"
  vpc_zone_identifier       = var.private_subnet_ids
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.api_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.app_name}-asg-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.app_name}-scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.api_asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.app_name}-scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.api_asg.name
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.app_name}-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.api_asg.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_up.arn]

  tags = {
    Environment = var.environment
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "${var.app_name}-cpu-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 30

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.api_asg.name
  }

  alarm_actions = [aws_autoscaling_policy.scale_down.arn]

  tags = {
    Environment = var.environment
  }
}

resource "aws_lb" "api_alb" {
  name               = "${var.app_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.api_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name        = "${var.app_name}-alb"
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "api_tg" {
  name     = "${var.app_name}-tg"
  port     = var.api_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "${var.app_name}-tg"
    Environment = var.environment
  }
}

resource "aws_lb_listener" "api_listener" {
  load_balancer_arn = aws_lb.api_alb.arn
  port              = var.api_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_tg.arn
  }
}

output "alb_dns_name" {
  value       = aws_lb.api_alb.dns_name
  description = "DNS del Application Load Balancer"
}

output "alb_target_group_arn" {
  value       = aws_lb_target_group.api_tg.arn
  description = "ARN del target group"
}

output "autoscaling_group_name" {
  value       = aws_autoscaling_group.api_asg.name
  description = "Nombre del Auto Scaling Group"
}

// === ARCHIVO: infra/modules/database/main.tf ===
# Módulo de base de datos para la API de pedidos
# Superficie de práctica: el estudiante implementará los recursos de base de datos

resource "aws_db_subnet_group" "api_db_subnet_group" {
  name       = "${var.app_name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.app_name}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "api_db" {
  identifier     = "${var.app_name}-db"
  engine         = "postgres"
  engine_version = "16.3"
  instance_class = var.db_instance_class

  allocated_storage     = var.db_storage_size
  max_allocated_storage = var.db_max_storage
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.api_db_subnet_group.name
  vpc_security_group_ids = [var.db_security_group_id]

  backup_retention_period = var.db_backup_retention
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"

  skip_final_snapshot       = var.environment != "prod"
  final_snapshot_identifier = var.environment == "prod" ? "${var.app_name}-final-snapshot" : null

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  performance_insights_enabled          = var.environment == "prod"
  performance_insights_retention_period = var.environment == "prod" ? 7 : null

  deletion_protection = var.environment == "prod"

  tags = {
    Name        = "${var.app_name}-db"
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ssm_parameter" "db_endpoint" {
  name  = "/${var.app_name}/${var.environment}/db/endpoint"
  type  = "String"
  value = aws_db_instance.api_db.endpoint

  tags = {
    Name        = "${var.app_name}-db-endpoint"
    Environment = var.environment
  }
}

resource "aws_ssm_parameter" "db_name" {
  name  = "/${var.app_name}/${var.environment}/db/name"
  type  = "String"
  value = var.db_name

  tags = {
    Name        = "${var.app_name}-db-name"
    Environment = var.environment
  }
}

resource "aws_ssm_parameter" "db_username" {
  name  = "/${var.app_name}/${var.environment}/db/username"
  type  = "SecureString"
  value = var.db_username

  tags = {
    Name        = "${var.app_name}-db-username"
    Environment = var.environment
  }
}

output "db_endpoint" {
  value       = aws_db_instance.api_db.endpoint
  description = "Endpoint de la base de datos RDS"
}

output "db_name" {
  value       = var.db_name
  description = "Nombre de la base de datos"
}

output "db_port" {
  value       = aws_db_instance.api_db.port
  description = "Puerto de la base de datos"
}

output "db_arn" {
  value       = aws_db_instance.api_db.arn
  description = "ARN de la instancia RDS"
}

// === ARCHIVO: infra/modules/security/main.tf ===
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

// === ARCHIVO: infra/envs/dev.tfvars ===
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

// === ARCHIVO: infra/envs/prod.tfvars ===
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

// === ARCHIVO: infra/versions.tf ===
terraform {
  required_version = "~> 1.9.5"

}

// === ARCHIVO: infra/main.tf ===
// Configuración principal de Terraform para la API de la app de pedidos
// Este archivo orquesta los módulos de infraestructura

terraform {
  required_version = "~> 1.9.5"
}

// Módulo de red: VPC, subnets, internet gateway, tablas de rutas
// El módulo network crea su propia VPC con los CIDRs y AZs especificados
module "network" {
  source = "./modules/network"

  app_name             = var.app_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  api_port             = var.api_port
}

// Módulo de seguridad: grupos de seguridad y roles IAM
// Usa los outputs del módulo network para configurar la seguridad
module "security" {
  source = "./modules/security"

  app_name       = var.app_name
  vpc_id         = module.network.vpc_id
  environment    = var.environment
  public_subnets = module.network.public_subnet_ids
  api_port       = var.api_port
}

// Módulo de base de datos: RDS PostgreSQL
// Los outputs de network proporcionan las subnets y security group necesarios
module "database" {
  source = "./modules/database"

  app_name             = var.app_name
  private_subnet_ids   = module.network.private_subnet_ids
  environment          = var.environment
  db_instance_class    = var.db_instance_class
  db_storage_size      = var.db_storage_size
  db_max_storage       = var.db_max_storage
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_security_group_id = module.network.db_security_group_id
  db_backup_retention  = var.db_backup_retention
}

// Módulo de compute: ASG, ALB, launch template
// Integra outputs de network, security y database
module "compute" {
  source = "./modules/compute"

  app_name              = var.app_name
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_pair_name         = var.key_pair_name
  api_security_group_id = module.security.api_security_group_id
  environment           = var.environment
  private_subnet_ids    = module.network.private_subnet_ids
  desired_capacity      = var.desired_capacity
  max_size              = var.max_size
  min_size              = var.min_size
  public_subnet_ids     = module.network.public_subnet_ids
  api_port              = var.api_port
  vpc_id                = module.network.vpc_id
}

// === ARCHIVO: infra/outputs.tf ===
// Salidas de Terraform con información relevante post-despliegue
// para la aplicación móvil y otros consumidores

output "api_endpoint" {
  description = "Endpoint público del Application Load Balancer para acceder a la API"
  value       = module.compute.alb_dns_name
}

output "api_base_url" {
  description = "URL base completa del API con protocolo HTTPS"
  value       = "https://${module.compute.alb_dns_name}"
}

output "database_endpoint" {
  description = "Endpoint de la base de datos RDS"
  value       = module.database.db_endpoint
}

output "database_name" {
  description = "Nombre de la base de datos"
  value       = module.database.db_name
}

output "database_port" {
  description = "Puerto de la base de datos"
  value       = module.database.db_port
}

output "vpc_id" {
  description = "ID de la VPC donde se desplegó la infraestructura"
  value       = var.vpc_id
}

output "public_subnets" {
  description = "IDs de las subnets públicas"
  value       = var.public_subnets
}

output "private_subnets" {
  description = "IDs de las subnets privadas"
  value       = var.private_subnets
}

output "autoscaling_group_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.autoscaling_group_name
}

output "environment" {
  description = "Entorno de despliegue"
  value       = var.environment
}

output "region" {
  description = "Región de AWS donde se desplegó la infraestructura"
  value       = var.aws_region
}

// === ARCHIVO: infra/modules/compute/variables.tf ===
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

// === ARCHIVO: infra/modules/database/variables.tf ===
// Variables para el módulo de base de datos (RDS PostgreSQL)

variable "app_name" {
  description = "Nombre de la aplicación"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs de las subnets privadas para la base de datos"
  type        = list(string)
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
}

variable "db_instance_class" {
  description = "Clase de instancia de base de datos"
  type        = string
  default     = "db.t3.micro"
}

variable "db_storage_size" {
  description = "Tamaño de almacenamiento en GB"
  type        = number
  default     = 20
}

variable "db_max_storage" {
  description = "Tamaño máximo de almacenamiento en GB"
  type        = number
  default     = 100
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "db_username" {
  description = "Usuario maestro de la base de datos"
  type        = string
}

variable "db_password" {
  description = "Contraseña del usuario maestro"
  type        = string
  sensitive   = true
}

variable "db_security_group_id" {
  description = "ID del grupo de seguridad para la base de datos"
  type        = string
}

variable "db_backup_retention" {
  description = "Días de retención de backups"
  type        = number
  default     = 7
}

// === ARCHIVO: infra/modules/network/variables.tf ===
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

// === ARCHIVO: infra/modules/security/variables.tf ===
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

// === ARCHIVO: client/pubspec.yaml ===
name: order_app
description: A new Flutter project for order management.

version: 1.0.0+1

environment:
  sdk: '>=3.6.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.2
  flutter_riverpod: ^2.5.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.4.4
  build_runner: ^2.4.11

flutter:
  uses-material-design: true

// === ARCHIVO: client/lib/core/network/api_client.dart ===
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/models/order_model.dart';

class ApiClient {
  final String baseUrl;
  final http.Client _client;

  ApiClient({required this.baseUrl, http.Client? client})
      : _client = client ?? http.Client();

  Future<List<OrderModel>> getOrders() async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/orders'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List<dynamic>;
        return data
            .map((jsonItem) => OrderModel.fromJson(jsonItem as Map<String, dynamic>))
            .toList();
      } else {
        throw ApiClientException('Failed to load orders: ${response.statusCode}');
      }
    } on ApiClientException {
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error fetching orders: $e');
      }
      rethrow;
    }
  }

  Future<OrderModel> createOrder(OrderModel order) async {
    try {
      final response = await _client.post(
        Uri.parse('$baseUrl/orders'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(order.toJson()),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return OrderModel.fromJson(json.decode(response.body) as Map<String, dynamic>);
      } else {
        throw ApiClientException('Failed to create order: ${response.statusCode}');
      }
    } on ApiClientException {
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error creating order: $e');
      }
      rethrow;
    }
  }

  void dispose() {
    _client.close();
  }
}

class ApiClientException implements Exception {
  final String message;
  ApiClientException(this.message);
  @override
  String toString() => 'ApiClientException: $message';
}

// === ARCHIVO: client/lib/domain/repositories/order_repository.dart ===
import 'package:order_app/domain/models/order_model.dart';

abstract class OrderRepository {
  Future<List<OrderModel>> getOrders();
  Future<OrderModel> createOrder(OrderModel order);
}

// === ARCHIVO: client/lib/domain/usecases/get_orders.dart ===
import '../models/order_model.dart';
import '../repositories/order_repository.dart';

class GetOrders {
  final OrderRepository orderRepository;

  GetOrders({required this.orderRepository});

  Future<List<OrderModel>> call() async {
    try {
      final orders = await orderRepository.getOrders();
      if (orders.isEmpty) {
        throw Exception('No orders found');
      }
      return orders;
    } catch (e) {
      throw Exception('Failed to get orders: $e');
    }
  }
}

// === ARCHIVO: client/android/app/src/main/AndroidManifest.xml ===
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    
    <application
        android:label="order_app"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:enableOnBackInvokedCallback="true">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
</manifest>

// === ARCHIVO: client/lib/data/repositories/order_repository_impl.dart ===
import 'package:http/http.dart' as http;
import 'package:order_app/core/network/api_client.dart';
import 'package:order_app/domain/models/order_model.dart';
import 'package:order_app/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final ApiClient apiClient;

  OrderRepositoryImpl({required this.apiClient});

  @override
  Future<List<OrderModel>> getOrders() async {
    try {
      final orders = await apiClient.getOrders();
      return orders;
    } on http.ClientException catch (e) {
      throw OrderRepositoryException(
        'Error de conexión al obtener pedidos: ${e.message}',
        e,
      );
    } on FormatException catch (e) {
      throw OrderRepositoryException(
        'Error de formato al procesar respuesta: ${e.message}',
        e,
      );
    } catch (e) {
      throw OrderRepositoryException(
        'Error inesperado al obtener pedidos: $e',
        e,
      );
    }
  }

  @override
  Future<OrderModel> createOrder(OrderModel order) async {
    if (order.items.isEmpty) {
      throw OrderRepositoryException('El pedido debe contener al menos un artículo');
    }

    if (order.userId.isEmpty) {
      throw OrderRepositoryException('El ID de usuario es requerido');
    }

    try {
      final createdOrder = await apiClient.createOrder(order);
      return createdOrder;
    } on http.ClientException catch (e) {
      throw OrderRepositoryException(
        'Error de conexión al crear pedido: ${e.message}',
        e,
      );
    } on FormatException catch (e) {
      throw OrderRepositoryException(
        'Error de formato al procesar respuesta: ${e.message}',
        e,
      );
    } catch (e) {
      throw OrderRepositoryException(
        'Error inesperado al crear pedido: $e',
        e,
      );
    }
  }
}

class OrderRepositoryException implements Exception {
  final String message;
  final dynamic originalError;

  OrderRepositoryException(this.message, [this.originalError]);

  @override
  String toString() => 'OrderRepositoryException: $message';
}

// === ARCHIVO: client/lib/presentation/screens/order_list_screen.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_app/domain/models/order_model.dart';
import 'package:order_app/presentation/viewmodels/order_viewmodel.dart';

class OrderListScreen extends ConsumerWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderViewModel = ref.watch(orderViewModelProvider);
    final ordersAsync = orderViewModel.orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pedidos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2,
      ),
      body: ordersAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Error al cargar pedidos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => orderViewModel.refresh(),
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (orders) {
          if (orders.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No hay pedidos disponibles',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Crea tu primer pedido',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 2,
                child: InkWell(
                  onTap: () => _showOrderDetails(context, order),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pedido #${order.id}',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            _buildStatusChip(context, order.status),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.person_outline, size: 16),
                            const SizedBox(width: 4),
                            Text('Usuario: ${order.userId}'),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 16),
                            const SizedBox(width: 4),
                            Text('Fecha: ${order.createdAt.toLocal().toString().split(' ')[0]}'),
                          ],
                        ),
                        const Divider(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${order.items.length} producto(s)',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              'Total: \$${order.total.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateOrderDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Nuevo Pedido'),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, String status) {
    Color backgroundColor;
    Color textColor;

    switch (status.toUpperCase()) {
      case 'PENDING':
        backgroundColor = Colors.orange.shade100;
        textColor = Colors.orange.shade800;
        break;
      case 'COMPLETED':
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        break;
      case 'CANCELLED':
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        break;
      default:
        backgroundColor = Colors.grey.shade200;
        textColor = Colors.grey.shade800;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  void _showOrderDetails(BuildContext context, OrderModel order) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Text(
                    'Detalles del Pedido #${order.id}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(context, 'Usuario:', order.userId),
                  _buildDetailRow(context, 'Estado:', order.status),
                  _buildDetailRow(
                    context,
                    'Fecha:',
                    order.createdAt.toLocal().toString().replaceAll('-', '/').split(' ')[0],
                  ),
                  _buildDetailRow(
                    context,
                    'Total:',
                    '\$${order.total.toStringAsFixed(2)}',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Productos:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...order.items.map((item) => Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(item.productName),
                          subtitle: Text('Cantidad: ${item.quantity}'),
                          trailing: Text(
                            '\$${item.subtotal.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateOrderDialog(BuildContext context, WidgetRef ref) {
    final orderViewModel = ref.read(orderViewModelProvider);
    final items = <OrderItemModel>[];
    final productNameController = TextEditingController();
    final quantityController = TextEditingController();
    final priceController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Text(
                    'Crear Nuevo Pedido',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: productNameController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre del producto',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.shopping_bag),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: quantityController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Cantidad',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.numbers),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: priceController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: const InputDecoration(
                            labelText: 'Precio',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.attach_money),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      final name = productNameController.text.trim();
                      final quantity = int.tryParse(quantityController.text) ?? 0;
                      final price = double.tryParse(priceController.text) ?? 0.0;

                      if (name.isEmpty || quantity <= 0 || price <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor complete todos los campos correctamente'),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }

                      setState(() {
                        items.add(OrderItemModel(
                          productId: DateTime.now().millisecondsSinceEpoch.toString(),
                          productName: name,
                          quantity: quantity,
                          price: price,
                        ));
                      });

                      productNameController.clear();
                      quantityController.clear();
                      priceController.clear();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Agregar Producto'),
                  ),
                  const SizedBox(height: 16),
                  if (items.isNotEmpty) ...[
                    const Divider(),
                    Text(
                      'Productos agregados:',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    ...items.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      return Card(
                        child: ListTile(
                          title: Text(item.productName),
                          subtitle: Text(
                            '${item.quantity} x \$${item.price.toStringAsFixed(2)} = \$${item.subtotal.toStringAsFixed(2)}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                items.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 8),
                    Text(
                      'Total del pedido: \$${items.fold(0.0, (sum, item) => sum + item.subtotal).toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    ).then((_) {
      if (items.isNotEmpty) {
        final newOrder = OrderModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          userId: 'user_1',
          items: items,
          total: items.fold(0.0, (sum, item) => sum + item.subtotal),
          status: 'PENDING',
          createdAt: DateTime.now(),
        );
        orderViewModel.createOrder(newOrder).then((_) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Pedido creado exitosamente'),
                backgroundColor: Colors.green,
              ),
            );
          }
        }).catchError((e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error al crear pedido: $e'),
                backgroundColor: Colors.red,
              ),
            );
          }
        });
      }
    });
  }
}

// === ARCHIVO: client/lib/presentation/viewmodels/order_viewmodel.dart ===
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:order_app/core/network/api_client.dart';
import 'package:order_app/data/repositories/order_repository_impl.dart';
import 'package:order_app/domain/models/order_model.dart';
import 'package:order_app/domain/repositories/order_repository.dart';
import 'package:order_app/domain/usecases/get_orders.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final httpClient = http.Client();
  const baseUrl = String.fromEnvironment('API_ENDPOINT', defaultValue: 'localhost:8080');
  final apiClient = ApiClient(baseUrl: baseUrl, client: httpClient);
  return OrderRepositoryImpl(apiClient: apiClient);
});

final orderViewModelProvider = ChangeNotifierProvider<OrderViewModel>((ref) {
  final orderRepository = ref.read(orderRepositoryProvider);
  final getOrdersUseCase = GetOrders(orderRepository: orderRepository);
  return OrderViewModel(
    getOrders: getOrdersUseCase,
    orderRepository: orderRepository,
  );
});

class OrderViewModel extends ChangeNotifier {
  final GetOrders _getOrders;
  final OrderRepository _orderRepository;
  AsyncValue<List<OrderModel>> _orders = const AsyncValue.loading();

  OrderViewModel({
    required GetOrders getOrders,
    required OrderRepository orderRepository,
  })  : _getOrders = getOrders,
        _orderRepository = orderRepository {
    _loadOrders();
  }

  AsyncValue<List<OrderModel>> get orders => _orders;

  Future<void> _loadOrders() async {
    try {
      _orders = const AsyncValue.loading();
      notifyListeners();
      final orders = await _getOrders();
      _orders = AsyncValue.data(orders);
    } catch (e, st) {
      _orders = AsyncValue.error(e, st);
    } finally {
      notifyListeners();
    }
  }

  Future<void> createOrder(OrderModel order) async {
    try {
      await _orderRepository.createOrder(order);
      await _loadOrders();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    await _loadOrders();
  }
}

// === ARCHIVO: client/lib/services/environment_service.dart ===
import 'package:flutter/foundation.dart';

class EnvironmentService {
  static const String _apiEndpointKey = 'API_ENDPOINT';
  static String? _apiEndpoint;

  static Future<void> init() async {
    try {
      _apiEndpoint = const String.fromEnvironment(_apiEndpointKey);
      if (_apiEndpoint == null || _apiEndpoint!.isEmpty) {
        throw Exception('API_ENDPOINT no está definido en las variables de entorno');
      }
      debugPrint('API Endpoint: $_apiEndpoint');
    } catch (e) {
      debugPrint('Error inicializando EnvironmentService: $e');
      rethrow;
    }
  }

  static String get apiEndpoint {
    if (_apiEndpoint == null) {
      throw Exception('EnvironmentService no inicializado. Llama a init() primero.');
    }
    return _apiEndpoint!;
  }
}

// === ARCHIVO: client/lib/main.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:order_app/core/network/api_client.dart';
import 'package:order_app/data/repositories/order_repository_impl.dart';
import 'package:order_app/domain/repositories/order_repository.dart';
import 'package:order_app/domain/usecases/get_orders.dart';
import 'package:order_app/presentation/screens/order_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvironmentService.init();
  runApp(const ProviderScope(child: OrderApp()));
}

class OrderApp extends StatelessWidget {
  const OrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const OrderListScreen(),
    );
  }
}

final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final client = ref.watch(httpClientProvider);
  final baseUrl = EnvironmentService.apiEndpoint ?? 'http://localhost:8080';
  return ApiClient(baseUrl: baseUrl, client: client);
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return OrderRepositoryImpl(apiClient: apiClient);
});

final getOrdersProvider = Provider<GetOrders>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return GetOrders(orderRepository: repository);
});

class EnvironmentService {
  static const String _apiEndpointKey = 'API_ENDPOINT';
  static String? _apiEndpoint;

  static String? get apiEndpoint => _apiEndpoint;

  static Future<void> init() async {
    _apiEndpoint = const String.fromEnvironment(_apiEndpointKey, defaultValue: 'http://localhost:8080');
  }
}

// === ARCHIVO: client/test/core/network/api_client_test.dart ===
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:order_app/core/network/api_client.dart';
import 'package:order_app/domain/models/order_model.dart';

import 'api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ApiClient apiClient;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    apiClient = ApiClient(baseUrl: 'http://test.api.com', client: mockHttpClient);
  });

  group('ApiClient getOrders', () {
    test('debe retornar lista de OrderModel cuando la respuesta es exitosa', () async {
      final responseJson = [
        {
          'id': 'order-1',
          'userId': 'user-123',
          'items': [
            {
              'productId': 'prod-1',
              'productName': 'Test Product',
              'quantity': 2,
              'price': 29.99
            }
          ],
          'total': 59.98,
          'status': 'pending',
          'createdAt': '2024-01-15T10:30:00.000Z'
        }
      ];

      when(mockHttpClient.get(
        Uri.parse('http://test.api.com/orders'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(jsonEncode(responseJson), 200));

      final result = await apiClient.getOrders();

      expect(result, isA<List<OrderModel>>());
      expect(result.length, 1);
      expect(result.first.id, 'order-1');
      expect(result.first.userId, 'user-123');
      expect(result.first.items.first.productName, 'Test Product');
      expect(result.first.status, 'pending');
    });

    test('debe lanzar excepción cuando la respuesta tiene código de error', () async {
      when(mockHttpClient.get(
        Uri.parse('http://test.api.com/orders'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response('Internal Server Error', 500));

      expect(
        () => apiClient.getOrders(),
        throwsA(isA<ApiClientException>()),
      );
    });

    test('debe lanzar excepción cuando hay error de red', () async {
      when(mockHttpClient.get(
        Uri.parse('http://test.api.com/orders'),
        headers: anyNamed('headers'),
      )).thenThrow(http.ClientException('Network error'));

      expect(
        () => apiClient.getOrders(),
        throwsA(isA<http.ClientException>()),
      );
    });
  });

  group('ApiClient createOrder', () {
    test('debe retornar OrderModel creado cuando la respuesta es exitosa', () async {
      final requestJson = {
        'id': 'order-new',
        'userId': 'user-456',
        'items': [
          {
            'productId': 'prod-2',
            'productName': 'New Product',
            'quantity': 1,
            'price': 49.99
          }
        ],
        'total': 49.99,
        'status': 'created',
        'createdAt': '2024-01-15T12:00:00.000Z'
      };

      when(mockHttpClient.post(
        Uri.parse('http://test.api.com/orders'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(jsonEncode(requestJson), 201));

      final order = OrderModel(
        id: 'order-new',
        userId: 'user-456',
        items: [
          OrderItemModel(
            productId: 'prod-2',
            productName: 'New Product',
            quantity: 1,
            price: 49.99,
          )
        ],
        total: 49.99,
        status: 'created',
        createdAt: DateTime.parse('2024-01-15T12:00:00.000Z'),
      );

      final result = await apiClient.createOrder(order);

      expect(result, isA<OrderModel>());
      expect(result.id, 'order-new');
      expect(result.status, 'created');
    });

    test('debe lanzar excepción cuando la respuesta tiene código de error', () async {
      when(mockHttpClient.post(
        Uri.parse('http://test.api.com/orders'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('Bad Request', 400));

      final order = OrderModel(
        id: 'order-invalid',
        userId: 'user-789',
        items: [],
        total: 0,
        status: 'invalid',
        createdAt: DateTime.now(),
      );

      expect(
        () => apiClient.createOrder(order),
        throwsA(isA<ApiClientException>()),
      );
    });
  });

  group('OrderModel serialization', () {
    test('fromJson debe parsear correctamente el JSON', () {
      final json = {
        'id': 'order-json-test',
        'userId': 'user-json',
        'items': [
          {
            'productId': 'prod-json',
            'productName': 'JSON Product',
            'quantity': 3,
            'price': 15.50
          }
        ],
        'total': 46.50,
        'status': 'processing',
        'createdAt': '2024-02-20T08:00:00.000Z'
      };

      final model = OrderModel.fromJson(json);

      expect(model.id, 'order-json-test');
      expect(model.userId, 'user-json');
      expect(model.items.length, 1);
      expect(model.items.first.productName, 'JSON Product');
      expect(model.total, 46.50);
      expect(model.status, 'processing');
    });

    test('toJson debe generar el JSON correcto', () {
      final model = OrderModel(
        id: 'order-tojson',
        userId: 'user-tojson',
        items: [
          OrderItemModel(
            productId: 'prod-tojson',
            productName: 'ToJSON Product',
            quantity: 5,
            price: 10.00,
          )
        ],
        total: 50.00,
        status: 'shipped',
        createdAt: DateTime.parse('2024-03-10T14:30:00.000Z'),
      );

      final json = model.toJson();

      expect(json['id'], 'order-tojson');
      expect(json['userId'], 'user-tojson');
      expect(json['total'], 50.00);
      expect(json['status'], 'shipped');
      expect((json['items'] as List).length, 1);
    });
  });

  group('OrderItemModel serialization', () {
    test('fromJson debe parsear correctamente el JSON del item', () {
      final json = {
        'productId': 'prod-item',
        'productName': 'Item Product',
        'quantity': 2,
        'price': 25.00
      };

      final item = OrderItemModel.fromJson(json);

      expect(item.productId, 'prod-item');
      expect(item.productName, 'Item Product');
      expect(item.quantity, 2);
      expect(item.price, 25.00);
    });

    test('toJson debe generar el JSON correcto del item', () {
      final item = OrderItemModel(
        productId: 'prod-item-tojson',
        productName: 'Item ToJSON',
        quantity: 4,
        price: 12.75,
      );

      final json = item.toJson();

      expect(json['productId'], 'prod-item-tojson');
      expect(json['productName'], 'Item ToJSON');
      expect(json['quantity'], 4);
      expect(json['price'], 12.75);
    });
  });
}

// === ARCHIVO: client/lib/domain/models/order_model.dart ===
class OrderModel {
  final String id;
  final String userId;
  final List<OrderItemModel> items;
  final double total;
  final String status;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.total,
    required this.status,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((item) => OrderItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  OrderModel copyWith({
    String? id,
    String? userId,
    List<OrderItemModel>? items,
    double? total,
    String? status,
    DateTime? createdAt,
  }) {
    return OrderModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      total: total ?? this.total,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderModel && other.id == id && other.userId == userId;
  }

  @override
  int get hashCode => id.hashCode ^ userId.hashCode;

  @override
  String toString() {
    return 'OrderModel(id: $id, userId: $userId, items: ${items.length}, total: $total, status: $status, createdAt: $createdAt)';
  }
}

class OrderItemModel {
  final String productId;
  final String productName;
  final int quantity;
  final double price;

  OrderItemModel({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
    };
  }

  double get subtotal => price * quantity;

  OrderItemModel copyWith({
    String? productId,
    String? productName,
    int? quantity,
    double? price,
  }) {
    return OrderItemModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderItemModel &&
        other.productId == productId &&
        other.productName == productName;
  }

  @override
  int get hashCode => productId.hashCode ^ productName.hashCode;

  @override
  String toString() {
    return 'OrderItemModel(productId: $productId, productName: $productName, quantity: $quantity, price: $price)';
  }
}
```
