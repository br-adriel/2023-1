import pymongo

myclient = pymongo.MongoClient("mongodb://mongodb:mongodb@localhost:27017/?authMechanism=DEFAULT")
mydb = myclient["mydatabase"]
mycol = mydb["customers"]

# # ordena documentos pelo campo "name"
# mydoc = mycol.find().sort("name")
# for x in mydoc:
#     print(x)

# orderna documentos pelo campo "name" de forma descendente
mydoc = mycol.find().sort("name", -1)
for x in mydoc:
    print(x)