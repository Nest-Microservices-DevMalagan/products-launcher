# Documentación del Curso de Microservicios con NestJS

## Índice

1. [Introducción a NestJS](#introducción-a-nestjs)
2. [Fundamentos de Microservicios](#fundamentos-de-microservicios)
3. [Creación del Primer Microservicio (Productos)](#creación-del-primer-microservicio-productos)
4. [Implementación del Gateway](#implementación-del-gateway)
5. [Microservicio de Órdenes](#microservicio-de-órdenes)
6. [Comunicación entre Microservicios](#comunicación-entre-microservicios)
7. [Implementación de NATS](#implementación-de-nats)
8. [Repositorio con Submódulos](#repositorio-con-submódulos)
9. [Microservicio de Pagos](#microservicio-de-pagos)
10. [Integración del Microservicio de Pagos](#integración-del-microservicio-de-pagos)
11. [Autenticación con JWT](#autenticación-con-jwt)
12. [Preparación para Producción](#preparación-para-producción)
13. [Despliegue en Google Cloud](#despliegue-en-google-cloud)
14. [Kubernetes Local](#kubernetes-local)
15. [Despliegue en Google Cloud con Kubernetes](#despliegue-en-google-cloud-con-kubernetes)
16. [Estructura del Repositorio](#estructura-del-repositorio)

## 🛠️ Tecnologías Utilizadas
  * NestJS (Microservicios, REST, TCP, NATS)
  * Docker & Docker Compose
  * PostgreSQL, MongoDB, SQLite
  * Prisma ORM
  * Stripe API & Webhooks
  * JWT Authentication
  * Google Cloud Platform (GCR, Secret Manager, GKE)
  * Kubernetes (Helm, Deployments, Services, Ingress)
  * NATS (para mensajería entre servicios)

## Introducción a NestJS

Esta sección refuerza los conocimientos fundamentales sobre NestJS:

### Módulos
- Encapsulan un conjunto de funcionalidades relacionadas
- Permiten organizar el código de manera modular y reutilizable
- Cada aplicación NestJS tiene al menos un módulo raíz (AppModule)

### Controladores
- Manejan las solicitudes HTTP entrantes
- Definen rutas y métodos HTTP
- Invocan la lógica de negocios en los servicios
- Transforman y retornan respuestas al cliente

### Servicios
- Contienen la lógica de negocio
- Son clases singleton (una única instancia)
- Pueden ser inyectados en controladores y otros servicios
- Facilitan la separación de responsabilidades

### DTOs (Data Transfer Objects)
- Definen la estructura de los datos que se transfieren
- Ayudan en la validación de datos
- Mejoran la documentación y tipo de datos
- Facilitan el mantenimiento al centralizar la estructura de datos

### Pipes
- Transforman o validan los datos antes de que lleguen al controlador
- Se pueden aplicar a parámetros, rutas, cuerpo de la solicitud
- NestJS incluye varios pipes predefinidos (ValidationPipe, ParseIntPipe, etc.)

### REST (Operaciones CRUD)
- **Create**: POST para crear nuevos recursos
- **Read**: GET para obtener recursos
- **Update/Patch**: PUT/PATCH para actualizar recursos
- **Delete**: DELETE para eliminar recursos

### Validaciones
- Implementación de class-validator
- Validación de datos en DTOs
- Validación global con ValidationPipe
- Manejo de errores personalizado

### Nest CLI
- Herramienta para generar código boilerplate
- Creación de módulos, controladores, servicios
- Gestión de proyectos y generación de estructuras

## Fundamentos de Microservicios

Sección teórica que explica los fundamentos de los microservicios:

### Arquitectura Monolítica
**Pros:**
- Simplicidad en desarrollo y despliegue
- Menor complejidad operativa
- Mejor rendimiento en aplicaciones pequeñas
- Fácil debugging y testing

**Cons:**
- Difícil de escalar horizontalmente
- Alto acoplamiento entre componentes
- Despliegues más riesgosos
- Difícil de mantener en aplicaciones grandes

### Microservicios
**Pros:**
- Escalabilidad independiente
- Despliegues aislados y menos riesgosos
- Tecnologías heterogéneas
- Equipos autónomos
- Mejor mantenibilidad y resiliencia

**Cons:**
- Mayor complejidad operativa
- Overhead en comunicación
- Testing end-to-end más complejo
- Necesidad de orquestación

### Conceptos Clave
- **Gateways**: Punto de entrada unificado a los microservicios
- **TCP**: Protocolo de comunicación entre servicios
- **Protocolos de transferencia**: REST, gRPC, NATS, etc.
- **Stateless**: Los servicios no mantienen estado
- **Autonomía**: Cada servicio debe poder operar independientemente

### Múltiples Apps en NestJS
- Creación de proyectos separados
- Comunicación a través de TCP o mensajería
- Estructura de carpetas y organización

## Creación del Primer Microservicio (Productos)

En esta sección se creó el primer microservicio para gestionar productos:

### CRUD de Productos
- Implementación de operaciones básicas
- Estructura de datos y modelos
- Validaciones específicas para productos

### MessagePattern
- Definición de patrones para comunicación
- Implementación en controladores
- Manejo de respuestas

### SQLite y Prisma
- Configuración de base de datos SQLite
- Modelado de datos con Prisma
- Migraciones y gestión del schema

### Transformación de REST a Microservicio
- Cambios en controladores
- Adaptación de rutas a patrones de mensajes
- Manejo de errores específico para microservicios

### Aplicaciones Híbridas
- Combinación de endpoints REST y microservicios
- Casos de uso para aplicaciones híbridas
- Configuración y estructura

### Organización en GitHub
- Estructura de repositorios
- Manejo de submódulos
- Workflows y colaboración

## Implementación del Gateway

Esta sección aborda la comunicación entre clientes y microservicios a través de un gateway:

### Gateway RESTful
- Implementación de endpoints REST
- Mapeo de rutas a microservicios
- Validaciones de entrada

### Comunicación Gateway-Microservicio
- Envío de payloads
- Estructura de mensajes
- Manejo de respuestas

### Configuración de Excepciones
- Excepciones independientes por servicio
- Manejo global de errores
- Transformación de errores para respuestas HTTP

### Observables y Promesas
- Trabajo con RxJS para comunicación asíncrona
- Transformación entre Observables y Promesas
- Manejo de timeouts y reintentos

## Microservicio de Órdenes

Desarrollo del microservicio para gestionar órdenes:

### PostgreSQL con Prisma
- Configuración de PostgreSQL
- Modelado de datos para órdenes
- Relaciones entre tablas

### Nest Resource para Microservicios
- Uso del CLI para generar recursos
- Adaptación para microservicios
- Estructura de controladores y servicios

### Paginaciones y DTOs
- Implementación de paginación
- Extensión de DTOs para diferentes operaciones
- Validaciones específicas

### Estados de Órdenes
- Modelado de estados (PENDIENTE, CANCELADA, ENTREGADA)
- Transiciones entre estados
- Validaciones de cambios de estado

## Comunicación entre Microservicios

Integración entre los microservicios desarrollados:

### Validación de Órdenes
- Gateway: validación inicial de datos
- Comunicación con microservicio de productos
- Verificación de existencia de productos

### Creación de Órdenes con Detalle
- Estructura del encabezado y detalle
- Transaccionalidad entre tablas
- Manejo de errores durante la creación

### DTOs Compuestos
- Validación de estructuras complejas
- Transformación de datos entre servicios
- Tipado fuerte para comunicación

### Flujo de Comunicación
- Gateway → Orders → Products
- Manejo de respuestas en cascada
- Timeout y reintentos

## Implementación de NATS

Migración de la comunicación de TCP a NATS:

### Servidor NATS
- Configuración e instalación
- Ventajas sobre TCP directo
- Manejo de colas y suscripciones

### Configuración en NestJS
- Adaptación de microservicios a NATS
- Configuración del transporte
- Patrones de comunicación

### Ventajas de NATS
- Mejor rendimiento
- Mayor escalabilidad
- Desacoplamiento
- Monitoreo y observabilidad

## Repositorio con Submódulos

Organización del proyecto completo:

### Launcher Repository
- Estructura principal
- Configuración de submódulos git
- Scripts de inicialización

### Docker Compose para Desarrollo
- Configuración de servicios
- Volúmenes y puertos
- Variables de entorno

### Mantenimiento de Submódulos
- Actualización coordinada
- Gestión de versiones
- Pull y push de cambios

## Microservicio de Pagos

Implementación del sistema de pagos:

### Sesiones de Pago REST
- Endpoints para iniciar pagos
- Integración con Stripe
- Manejo de sesiones

### Webhooks
- Configuración para recibir notificaciones
- Validación de firmas
- Procesamiento de eventos de pago

### Aplicación Híbrida
- Endpoints REST para comunicación externa
- Comunicación interna mediante NATS
- Configuración dual

## Integración del Microservicio de Pagos

Conexión del microservicio de pagos con el resto del sistema:

### EventPattern
- Implementación de patrones de eventos
- Publicación y suscripción
- Manejo de eventos asíncronos

### Flujo Webhook → Orders
- Procesamiento de pagos confirmados
- Actualización de estados de órdenes
- Notificaciones a otros servicios

### DeckHook
- Herramienta para depuración de webhooks
- Configuración y uso en desarrollo
- Simulación de eventos de pago

### Modificaciones a la Base de Datos
- Nuevos campos para información de pago
- Relaciones entre pagos y órdenes
- Migraciones incrementales

## Autenticación con JWT

Implementación de autenticación:

### Microservicio Auth
- Estructura y configuración inicial
- Endpoints de registro y login
- Validación de credenciales

### MongoDB con Prisma
- Configuración para MongoDB
- Modelado de usuarios
- Índices y consultas optimizadas

### JWT
- Generación y firma de tokens
- Validación y decodificación
- Refresh tokens y expiración

### Decoradores Personalizados
- Decorador de usuario actual
- Validación de roles
- Integración con Guards

### Guards
- Implementación de AuthGuard
- Protección de rutas
- Integración con microservicios

## Preparación para Producción

Configuración para entornos de producción:

### Build de Distribución
- Optimización del código
- Eliminación de dependencias de desarrollo
- Configuración de tsconfig para producción

### Dockerfiles para Producción
- Multi-stage builds
- Optimización de imágenes
- Configuración de volúmenes

### Docker-Compose para Producción
- Configuración de servicios
- Variables de entorno
- Redes y dependencias

### Migraciones en Build Time
- Aplicación automática de migraciones
- Generación de cliente Prisma
- Manejo de errores durante el build

## Despliegue en Google Cloud

Preparación para despliegue en Google Cloud:

### Google Cloud CLI
- Instalación y configuración
- Autenticación y permisos
- Comandos comunes

### Registros Privados
- Configuración del Container Registry
- Permisos y acceso
- Seguridad de imágenes

### Push de Imágenes
- Tagging correcto
- Proceso de subida
- Versionado

### Construcción con Secretos
- Gestión de credenciales en build
- Cloud Build con variables privadas
- Mejores prácticas de seguridad

### Secret Manager
- Configuración de secretos
- Acceso desde aplicaciones
- Rotación de secretos

## Kubernetes Local

Configuración de Kubernetes en entorno local:

### Componentes de Kubernetes
- Cluster: Conjunto de nodos que ejecutan aplicaciones
- Virtual Network: Red que permite la comunicación entre pods
- Pods: Unidad más pequeña en Kubernetes que puede contener uno o más contenedores
- Master Node: Controla el cluster
- Worker Nodes: Ejecutan las aplicaciones

### Configuración Local
- Instalación de minikube o kind
- Configuración de kubectl
- Creación del cluster local

### Recursos de Kubernetes
- Deployments: Define el estado deseado de los pods
- Services: Expone los pods como servicios de red
- Secrets: Almacena información sensible
- ConfigMaps: Almacena configuración no sensible

### Logs y Debugging
- Acceso a logs de pods
- Depuración de aplicaciones
- Comandos útiles de kubectl

### Autenticación
- Configuración de autenticación local
- Service accounts
- RBAC básico

## Despliegue en Google Cloud con Kubernetes

Despliegue del cluster en GKE (Google Kubernetes Engine):

### Health Check Endpoints
- Implementación en cada microservicio
- Configuración de readiness y liveness probes
- Manejo de estados de salud

### Configuraciones en GKE
- Creación del cluster
- Configuración de nodos
- Networking y VPC

### Balanceadores de Carga
- Configuración de Ingress
- Load balancing entre servicios
- SSL/TLS y dominios

### Configuración del Cluster
- Despliegue de manifiestos
- Actualización de aplicaciones
- Escalado y auto-scaling

## Estructura del Repositorio

El repositorio principal está organizado de la siguiente manera:

```
nest-microservices-devmalagan-products-launcher/
├── README.md - Documentación principal
├── docker-compose.prod.yml - Configuración para producción
├── docker-compose.yml - Configuración para desarrollo
├── K8s.README.md - Documentación de Kubernetes
├── push-images.sh - Script para subir imágenes a registros
├── .dockerignore - Archivos ignorados por Docker
├── .env.template - Plantilla de variables de entorno
├── auth-ms/ - Microservicio de autenticación 
├── client-gateway/ - API Gateway para clientes
├── k8s/ - Configuración de Kubernetes
│   └── ecommerce/ - Chart de Helm
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── .helmignore
│       └── templates/ - Plantillas de recursos K8s
├── orders-ms/ - Microservicio de órdenes
├── payments-ms/ - Microservicio de pagos
└── products-ms/ - Microservicio de productos
```

Cada microservicio está incluido como un submódulo de Git, lo que permite mantener un desarrollo independiente mientras se facilita la gestión del proyecto completo.

Los archivos de Kubernetes en la carpeta `k8s/ecommerce/templates/` definen todos los recursos necesarios para desplegar la aplicación, incluyendo deployments, services e ingress para cada microservicio.
