import pymongo

myclient = pymongo.MongoClient("mongodb://mongodb:mongodb@localhost:27017/?authMechanism=DEFAULT")
mydb = myclient["mydatabase"]
mycol = mydb["customers"]

# # deleta documento onde endereço for o especificado
# myquery = { "name": "Viola", "address": "Sideway 1633" }
# mycol.delete_one(myquery)

# deleta todos os documentos onde o endereço começa com S
myquery = { "address": {"$regex": "^S"} }
x = mycol.delete_many(myquery)
print(x.deleted_count, "documents deleted.")
