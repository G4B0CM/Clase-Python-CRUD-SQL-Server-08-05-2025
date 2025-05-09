#Conexion y operaciones CRUD BDD AdventureWorks
# Author JGAS
# Select Record
#2024/11/15

# 1. Importar Biblioteca de conexión
import pyodbc

# 2. Declarar variables de Conexión
name_server ='DESKTOP-6GO61O3'+'\\'+'SQLEXPRESS'
database ='UDEMYTEST1'
username ='pythonconect'
password = 'UDLA'
controlador_odbc='SQL Server'

# 3. Crear Cadena de Conexion.
#3.1 Conexion Login SQL
connection_string = f'DRIVER={controlador_odbc};SERVER={name_server};DATABASE={database};UID={username};PWD={password}'

# 3.2 Con Autenticacion Windows
#connection_string = f'DRIVER={controlador_odbc};SERVER={name_server};DATABASE={database};Trusted_Connection=yes;'


#4. Establece la conexión
try:
    conexion = pyodbc.connect(connection_string)
except Exception as e:
    print("\n \t Ocurrió un error al conectar a SQL Server: \n\n", e)
else:
    #Crear Cursor
    micursor = conexion.cursor()
    # 1. Ejemplo: Consulta la tabla "Estudiantes”
    SENTENCIA_SQL = """
        SELECT IDEstudiante,NombreEstudiante,ApellidoEstudiante,
        Email,Telefono FROM Estudiantes
    """ 
    micursor.execute(SENTENCIA_SQL)
    
    rows = micursor.fetchall()
    for row in rows:
        print(f"{row.IDEstudiante}\t{row.NombreEstudiante}\t{row.ApellidoEstudiante}\t{row.Email}\t{row.Telefono}")
    
    print("\nOk ... Proceso Culminado con Exito: \n")
finally:
    print("Conexion Cerrada: \n")
