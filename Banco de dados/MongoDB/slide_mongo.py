import pymongo

"""
Esse arquivo contém os códigos do slide sobre mongoDB disponibilizado no SIGAA
"""

myclient = pymongo.MongoClient(
    "mongodb://mongodb:mongodb@localhost:27017/?authMechanism=DEFAULT")
mydb = myclient["biblioteca_aula"]

livros = mydb["livros"]

# livros.insert_many([
#     {
#         "_id": "livro1",
#         "titulo": "Dom Casmurro",
#         "genero": "Romance",
#         "autor_id": "autor1",
#         "ano_publicacao": 1899
#     },
#     {
#         "_id": "livro2",
#         "titulo": "Grande Sertão: Veredas",
#         "genero": "Romance",
#         "autor_id": "autor2",
#         "ano_publicacao": 1956
#     },
# ])

autores = mydb["autores"]

# autores.insert_many([
#     {
#         "_id": "autor1",
#         "nome": "Machado de Assis",
#         "pais": "Brasil",
#         "nascimento": "1839-06-21",
#         "falecimento": "1908-09-29"
#     },
#     {
#         "_id": "autor2",
#         "nome": "João Guimarães Rosa",
#         "pais": "Brasil",
#         "nascimento": "1908-06-27",
#         "falecimento": "1967-11-19"
#     }
# ])

resultado = livros.aggregate([
    {"$match": {"titulo": "Dom Casmurro"}
     },
    {"$lookup": {
     "from": "autores",
     "localField": "autor_id",
     "foreignField": "_id",
     "as": "autor"
     }
     },
    {
        "$unwind": "$autor"
    },
    {
        "$project": {
            "titulo": 1,
            "genero": 1,
            "autor.nome": 1
        }
    }
])

# for item in resultado:
#     print(item)

resultado = livros.find({
  "genero": "Ficção",
  "ano_publicacao": {
	"$gte": 1970,
	"$lte": 1980
  }
})

for item in resultado:
    print(item)