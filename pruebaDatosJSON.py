import json
import os

with open('D:\\BDD2\\5612\\BaseDeDatosPython\\JsonOutput\\JSON\\Employyes3.json', 'r', encoding='utf-8') as archivo:
    datos = json.load(archivo)
    
print(datos[1]['Empleados'][0])