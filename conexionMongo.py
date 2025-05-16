from pymongo import MongoClient

# Requires the PyMongo package.
# https://api.mongodb.com/python/current

client = MongoClient('mongodb+srv://TestUserMongoDB:1234@clusterudla01.1cntbgm.mongodb.net/')
filter={
    'Nombre_Departamento': 'Sales'
}

result = client['AventuraTrabajo']['Empleado'].find(
  filter=filter
)
print(result[0])