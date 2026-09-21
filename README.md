# TP15 - Notes App con Semgrep como SAST

## Objetivo

Desplegar una aplicación web contenerizada compuesta por frontend, backend y base de datos PostgreSQL utilizando Docker Compose y realizar verificaciones de funcionamiento y seguridad.

## Componentes

- Frontend (Nginx)
- Backend (Flask)
- Base de datos PostgreSQL
- Docker Compose
- OWASP ZAP
- GitHub
* Semgrep (SAST)

## Estructura del proyecto

```text
backend/
frontend/
scripts/
.github/
.zap/
docker-compose.yml
instalar.sh
operaciones.sh
verificar-permisos.sh
verificar-zap.sh
README.md
```

## Configuración

Archivo `.env`:

```env
DB_NAME=notesdb
DB_USER=postgres
DB_PASSWORD=devops123
FRONTEND_PORT=8081
```

## Ejecución

Levantar los servicios:

```bash
docker compose up -d
```

Verificar estado:

```bash
docker compose ps
```

Acceder a la aplicación:

```text
http://127.0.0.1:8081
```

## Verificación

Probar acceso desde consola:

```bash
curl http://127.0.0.1:8081
```

Visualizar logs:

```bash
docker compose logs
```

## Seguridad

La aplicación fue analizada utilizando OWASP ZAP Automation Framework.

Archivos relacionados:

```text
.zap/
verificar-zap.sh

```

## Analisis SAST con Semgrep

Se integró Semgrep como herramienta SAST (Static Application Security Testing)
para analizar automáticamente el código fuente y los archivos de configuración
del proyecto.

La herramienta fue ejecutada localmente y posteriormente incorporada al
pipeline de GitHub Actions para que cada push o pull request ejecute
validaciones automáticas de seguridad.

Archivo generado:

- semgrep-results.json

## Repositorio GitHub

```text
https://github.com/leoencarnacao-droid/devops-TP13C
```

## Alumno

Leonardo Encarnacao

Materia: Operaciones sobre Sistemas
