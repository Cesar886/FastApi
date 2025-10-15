# Agenda FastAPI

Una API REST para gestión de contactos construida con FastAPI y SQLAlchemy.

## Características

- ✅ CRUD completo para contactos
- ✅ Validación de datos con Pydantic
- ✅ Base de datos SQLite por defecto (configurable para PostgreSQL/MySQL)
- ✅ Documentación automática con Swagger UI
- ✅ Búsqueda de contactos
- ✅ Manejo de errores

## Estructura del Proyecto

```
agenda_fastapi/
│
├── app/
│   ├── __init__.py          # Inicialización del paquete
│   ├── main.py              # Aplicación principal de FastAPI
│   ├── database.py          # Configuración de la base de datos
│   ├── models.py            # Modelos SQLAlchemy
│   ├── schemas.py           # Esquemas Pydantic
│   └── crud.py              # Operaciones CRUD
│
├── .env                     # Variables de entorno
├── requirements.txt         # Dependencias del proyecto
└── README.md               # Este archivo
```

## Instalación

1. **Clona el repositorio:**
   ```bash
   git clone <url-del-repo>
   cd agenda_fastapi
   ```

2. **Crea un entorno virtual:**
   ```bash
   python -m venv venv
   source venv/bin/activate  # En Linux/Mac
   # venv\Scripts\activate   # En Windows
   ```

3. **Instala las dependencias:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configura las variables de entorno:**
   ```bash
   cp .env.example .env
   # Edita el archivo .env con tus configuraciones
   ```

## Uso

### Ejecutar la aplicación

```bash
uvicorn app.main:app --reload
```

La aplicación estará disponible en:
- **API**: http://localhost:8000
- **Documentación Swagger**: http://localhost:8000/docs
- **Documentación ReDoc**: http://localhost:8000/redoc

### Endpoints disponibles

#### Contactos

- `GET /` - Página de bienvenida
- `POST /contactos/` - Crear un nuevo contacto
- `GET /contactos/` - Obtener lista de contactos (con paginación)
- `GET /contactos/{contacto_id}` - Obtener un contacto específico
- `PUT /contactos/{contacto_id}` - Actualizar un contacto
- `DELETE /contactos/{contacto_id}` - Eliminar un contacto

### Ejemplos de uso

#### Crear un contacto
```bash
curl -X POST "http://localhost:8000/contactos/" \
     -H "Content-Type: application/json" \
     -d '{
       "nombre": "Juan",
       "apellido": "Pérez",
       "email": "juan.perez@example.com",
       "telefono": "+34 123 456 789",
       "direccion": "Calle Ejemplo 123, Madrid"
     }'
```

#### Obtener todos los contactos
```bash
curl "http://localhost:8000/contactos/"
```

#### Obtener un contacto específico
```bash
curl "http://localhost:8000/contactos/1"
```

#### Actualizar un contacto
```bash
curl -X PUT "http://localhost:8000/contactos/1" \
     -H "Content-Type: application/json" \
     -d '{
       "telefono": "+34 987 654 321"
     }'
```

#### Eliminar un contacto
```bash
curl -X DELETE "http://localhost:8000/contactos/1"
```

## Configuración de Base de Datos

### SQLite (Por defecto)
```env
DATABASE_URL=sqlite:///./agenda.db
```

### PostgreSQL
```env
DATABASE_URL=postgresql://usuario:contraseña@localhost/agenda_db
```

### MySQL
```env
DATABASE_URL=mysql+pymysql://usuario:contraseña@localhost/agenda_db
```

## Desarrollo

### Estructura de datos

#### Modelo Contacto
```python
{
    "id": 1,
    "nombre": "Juan",
    "apellido": "Pérez",
    "email": "juan.perez@example.com",
    "telefono": "+34 123 456 789",
    "direccion": "Calle Ejemplo 123, Madrid",
    "fecha_creacion": "2024-01-01T10:00:00",
    "fecha_actualizacion": "2024-01-01T10:00:00"
}
```

### Testing

```bash
pytest
```

### Migraciones de base de datos

Para usar Alembic para migraciones:

```bash
# Inicializar Alembic
alembic init alembic

# Crear una migración
alembic revision --autogenerate -m "Crear tabla contactos"

# Aplicar migraciones
alembic upgrade head
```

## Tecnologías Utilizadas

- **FastAPI**: Framework web moderno y rápido para Python
- **SQLAlchemy**: ORM para Python
- **Pydantic**: Validación de datos usando type hints de Python
- **Uvicorn**: Servidor ASGI
- **SQLite**: Base de datos por defecto
- **Python-dotenv**: Gestión de variables de entorno

## Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## Contacto

Tu Nombre - tu.email@example.com

Link del Proyecto: [https://github.com/tu-usuario/agenda-fastapi](https://github.com/tu-usuario/agenda-fastapi)