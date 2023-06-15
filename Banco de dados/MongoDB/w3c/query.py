import pymongo

myclient = pymongo.MongoClient("mongodb://mongodb:mongodb@localhost:27017/?authMechanism=DEFAULT")
mydb = myclient["mydatabase"]
mycol = mydb["customers"]

# # encontra documentos com endereco especifico
# mydoc = mycol.find({"address": "Park Lane 38"})
# for x in mydoc:
#     print(x)

# # encontra documentos que tem o endereço iniciado por "S" ou maior
# myquery = {"address": {"$gt": "S"}}
# mydoc = mycol.find(myquery)
# for x in mydoc:
#     print(x)

# # encontra documentos usando uma regex
# myquery = {"address": {"$regex": "^S"}}
# mydoc = mycol.find(myquery)
# for x in mydoc:
#     print(x)
