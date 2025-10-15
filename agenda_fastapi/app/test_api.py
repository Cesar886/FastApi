import requests
import json

BASE_URL = "http://localhost:8000"

def test_api():
    # Crear persona
    nueva_persona = {
        "nombre": "María",
        "apellido": "García",
        "email": "maria.garcia@email.com",
        "telefono": "+1122334455",
        "direccion": "Plaza Central 789"
    }
    
    response = requests.post(f"{BASE_URL}/personas/", json=nueva_persona)
    print("Crear persona:", response.status_code)
    print("Respuesta:", response.json())
    
    # Obtener todas las personas
    response = requests.get(f"{BASE_URL}/personas/")
    print("\nObtener todas las personas:", response.status_code)
    print("Respuesta:", response.json())
    
    # Obtener persona específica
    persona_id = 1
    response = requests.get(f"{BASE_URL}/personas/{persona_id}")
    print(f"\nObtener persona {persona_id}:", response.status_code)
    print("Respuesta:", response.json())

if __name__ == "__main__":
    test_api()