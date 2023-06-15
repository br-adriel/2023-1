import pymongo

myclient = pymongo.MongoClient("mongodb://mongodb:mongodb@localhost:27017/?authMechanism=DEFAULT")
mydb = myclient["mydatabase"]
mycol = mydb["customers"]

# # encontra o primeiro objeto da coleção
# x = mycol.find_one()
# print(x)

# encontra todos os objetos da coleção
for x in mycol.find():
    print(x)

# # retorna apenas alguns campos
# for x in mycol.find({}, {"_id": 0, "name": 1, "address": 1}):
#     print(x)

# # remove um dos campos do resultado
# for x in mycol.find({}, {"address": 0}):
#     print(x)
