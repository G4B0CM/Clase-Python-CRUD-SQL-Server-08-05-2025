"""
SQL Server database connection program.
"""

import pyodbc

# Connection data
NAME_SERVER = 'UPOAULA10603'
DATABASE = 'AdventureWorks2008R2'
ODBC_DRIVER = 'ODBC Driver 17 for SQL Server'

# Windows authentication connection string
CONNECTION_STRING = (
    f'DRIVER={ODBC_DRIVER};SERVER={NAME_SERVER};DATABASE={DATABASE};Trusted_Connection=yes;'
)

def main():
    """Connects to SQL Server and fetches data from Person.Person table."""
    # Establish connection
    connection = pyodbc.connect(CONNECTION_STRING)

    # Create cursor
    cursor = connection.cursor()

    # Execute query
    cursor.execute('SELECT TOP 20 LastName, FirstName FROM Person.Person')
    rows = cursor.fetchall()

    # Print results
    for row in rows:
        print(row)

    # Close connection
    connection.close()

if __name__ == "__main__":
    main()
