# Despliegue de la API de la app de pedidos con Terraform

El equipo de desarrollo móvil necesita desplegar la API de la aplicación de pedidos utilizando Terraform para automatizar el aprovisionamiento de la infraestructura. La API debe estar disponible para que la aplicación móvil pueda realizar pedidos y consultas. Los recursos aprovisionados incluyen servidores, bases de datos y servicios de red. El dominio es el de una aplicación de pedidos móvil donde los usuarios pueden realizar compras y consultar el estado de sus pedidos.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el backend de una app movil |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform para el proyecto de la API de la app de pedidos.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los recursos necesarios para la API de la app de pedidos.
- Configurar el archivo principal de Terraform para inicializar el proyecto.
- Definir las variables de entorno necesarias para el despliegue.

**Entregable:** Archivo de configuración de Terraform inicializado y variables de entorno definidas.

<details>
<summary>Pistas de conocimiento</summary>

- Terraform permite la gestión de infraestructura como código.
- Las variables de entorno son cruciales para parametrizar el despliegue.

</details>

### Fase 2: Aprovisionamiento de recursos con Terraform

**Objetivo:** Aprovisionar los recursos necesarios para la API de la app de pedidos utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Definir los bloques de recursos en Terraform para servidores, bases de datos y servicios de red.
- Ejecutar el plan de Terraform para visualizar los cambios.
- Aplicar el plan de Terraform para aprovisionar los recursos.

**Entregable:** Recursos aprovisionados con Terraform y disponibles para la API de la app de pedidos.

<details>
<summary>Pistas de conocimiento</summary>

- Los bloques de recursos en Terraform definen la infraestructura aprovisionada.
- El comando `terraform plan` permite visualizar los cambios antes de aplicarlos.

</details>

### Fase 3: Validación y despliegue de la API

**Objetivo:** Validar la configuración de Terraform y desplegar la API de la app de pedidos.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Verificar que todos los recursos están correctamente aprovisionados.
- Desplegar la API en los recursos aprovisionados.
- Realizar pruebas de integración para asegurar que la API funciona correctamente.

**Entregable:** API de la app de pedidos desplegada y funcionando correctamente.

<details>
<summary>Pistas de conocimiento</summary>

- La validación de la configuración de Terraform asegura que los recursos están correctamente aprovisionados.
- Las pruebas de integración verifican que la API funciona como se espera.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y cómo se utiliza para aprovisionar infraestructura?
- **paraQueSirve**: ¿Para qué sirve aprovisionar la infraestructura con Terraform en el contexto de la app de pedidos?
- **comoSeUsa**: ¿Cómo se configura y utiliza Terraform para aprovisionar los recursos necesarios para la API de la app de pedidos?
- **erroresComunes**: ¿Cuáles son los errores comunes al aprovisionar infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el despliegue de la API de la app de pedidos utilizando Terraform?

## Criterios de Evaluacion

- Configuración inicial de Terraform realizada correctamente.
- Recursos aprovisionados con Terraform y disponibles para la API de la app de pedidos.
- API de la app de pedidos desplegada y funcionando correctamente.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
