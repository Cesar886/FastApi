#!/bin/bash

echo "=== PROBANDO API DE AGENDA DE CONTACTOS ==="
echo ""

# Configuración
BASE_URL="http://localhost:8000"

# 1. Probar endpoint raíz
echo "1. Probando endpoint raíz (GET /):"
curl -s -X GET "$BASE_URL/" | python3 -m json.tool
echo -e "\n"

# 2. Health check
echo "2. Probando health check (GET /health):"
curl -s -X GET "$BASE_URL/health" | python3 -m json.tool
echo -e "\n"

# 3. Crear una persona (POST)
echo "3. Creando una persona (POST /personas/):"
curl -s -X POST "$BASE_URL/personas/" \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Juan",
    "apellido": "Pérez",
    "email": "juan.perez@email.com",
    "telefono": "+1234567890",
    "direccion": "Calle Principal 123"
  }' | python3 -m json.tool
echo -e "\n"

# 4. Obtener todas las personas (GET)
echo "4. Obteniendo todas las personas (GET /personas/):"
curl -s -X GET "$BASE_URL/personas/" | python3 -m json.tool
echo -e "\n"

# 5. Obtener persona por ID (GET)
echo "5. Obteniendo persona por ID 1 (GET /personas/1):"
curl -s -X GET "$BASE_URL/personas/1" | python3 -m json.tool
echo -e "\n"

# 6. Actualizar persona (PUT)
echo "6. Actualizando persona ID 1 (PUT /personas/1):"
curl -s -X PUT "$BASE_URL/personas/1" \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Juan Carlos",
    "telefono": "+9876543210"
  }' | python3 -m json.tool
echo -e "\n"

# 7. Crear otra persona
echo "7. Creando segunda persona (POST /personas/):"
curl -s -X POST "$BASE_URL/personas/" \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "María",
    "apellido": "García",
    "email": "maria.garcia@email.com",
    "telefono": "+5555555555",
    "direccion": "Avenida Central 456"
  }' | python3 -m json.tool
echo -e "\n"

# 8. Obtener todas las personas nuevamente
echo "8. Obteniendo todas las personas nuevamente (GET /personas/):"
curl -s -X GET "$BASE_URL/personas/" | python3 -m json.tool
echo -e "\n"

# 9. Eliminar una persona (DELETE)
echo "9. Eliminando persona ID 2 (DELETE /personas/2):"
curl -s -X DELETE "$BASE_URL/personas/2" -w "HTTP Status: %{http_code}\n"
echo -e "\n"

# 10. Verificar que se eliminó
echo "10. Verificando eliminación - intentando obtener persona ID 2:"
curl -s -X GET "$BASE_URL/personas/2" | python3 -m json.tool
echo -e "\n"

echo "=== PRUEBAS COMPLETADAS ==="