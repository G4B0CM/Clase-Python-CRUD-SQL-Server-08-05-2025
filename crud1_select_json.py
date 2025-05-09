#Conexion y operaciones CRUD BDD AdventureWorks
# Author JGAS
# Select Record
#2024/05/12

# 1. Importar bibliotecas
import pyodbc
import json

# 2. Leer configuración desde archivo JSON
with open('config.json', 'r') as archivo_config:
    config = json.load(archivo_config)

# 3. Recuperar variables de conexión
name_server = config['name_server']
database = config['database']
username = config['username']
password = config['password']
controlador_odbc = config['controlador_odbc']

# 4. Crear Cadena de Conexión (con login SQL)
connection_string = f'DRIVER={controlador_odbc};SERVER={name_server};DATABASE={database};UID={username};PWD={password}'


#4. Establece la conexión
try:
    conexion = pyodbc.connect(connection_string)
    #Crear Cursor
    micursor = conexion.cursor()
    
    SENTENCIA_SQL = """
        SELECT IDEstudiante,NombreEstudiante,ApellidoEstudiante,
        Email,Telefono FROM Estudiantes
    """ 
    micursor.execute(SENTENCIA_SQL)
    
    rows = micursor.fetchall()
    for row in rows:
    
        print(f"{row.IDEstudiante}\t{row.NombreEstudiante}\t{row.ApellidoEstudiante}\t{row.Email}\t{row.Telefono}")
except Exception as e:
    print("\n \t Ocurrió un error al conectar a SQL Server: \n\n", e)
else:
    print("Ok ... Conexión Exitosa: \n")
finally:
    print("Fin Conexion: \n")
