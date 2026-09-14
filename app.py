from flask import Flask, request, jsonify
from flask.helpers import make_response
from flask_mysqldb import MySQL
from flask_cors import CORS, cross_origin


# para subir archivos
import os
#from werkzeug.utils import secure_filename


app = Flask(__name__)

import os

app.config["MYSQL_HOST"] = "127.0.0.1" #os.environ.get("DB_HOST")
app.config["MYSQL_USER"] = "root" #os.environ.get("DB_USER")
app.config["MYSQL_PASSWORD"] = "aula07" # os.environ.get("DB_PASSWORD")
app.config["MYSQL_DB"] = "callfit" #os.environ.get("DB_NAME")

mysql = MySQL(app)

CORS(app)


@app.route("/nuevo_usuario", methods=["POST"])
@cross_origin()
def insertar_usuario():
    nombre = request.json["nombre"]
    apellido = request.json["apellido"]
    provincia = request.json["provincia"]

    cursor = mysql.connection.cursor()

    sql = "INSERT INTO Usuarios(nombre, apellido, provincia) values(%s, %s, %s);"
    cursor.execute(sql, (nombre, apellido, provincia))


    mysql.connection.commit()

    cursor.close()
    response = make_response()

    response = jsonify({"resultado":"Agregado nuevo usuario"})
    return response

@app.route("/traer_usuarios", methods=["GET"])
@cross_origin()
def listar_jugadores():
    #consulta SQL
    sql = "SELECT idUsuarios, nombre, apellido, provincia FROM Usuarios"

    #crear el cursor
    cursor = mysql.connection.cursor()#mysql.connect.cursor()
    cursor.execute(sql)

    resultado = cursor.fetchall()

    #cerrar la conexión
    cursor.close()
    response = make_response()

    if resultado == None:
        response = jsonify({"mensaje":None})
        return response
    else:
        usuarios = []

        for i in resultado:

            p = {"id":i[0], "nombre":i[1], "apellido":i[2], "provincia":i[3]}
            usuarios.append(p)

        return jsonify(usuarios)


@cross_origin
@app.route("/eliminar_usuario/<id>", methods=["DELETE"])
def eliminar_usuario(id):

    sql = "DELETE FROM Usuarios WHERE idUsuarios=%s"

    #crear el cursor
    cursor = mysql.connection.cursor()
    cursor.execute(sql, (id,))

    mysql.connection.commit()

    #cerrar la conexión
    cursor.close()
    response = make_response()


    response = jsonify({"resultado":"Usuario eliminado"})
    return response


@cross_origin
@app.route("/actualizar_usuario/<id>", methods=["PUT"])
def actualizar_usuario(id):
    nombre = request.json["nom"]

    sql = "UPDATE Usuarios SET nombre=%s WHERE idUsuarios=%s"

    #crear el cursor
    cursor = mysql.connection.cursor()
    cursor.execute(sql, (nombre, id))
    mysql.connection.commit()


    #cerrar la conexión
    cursor.close()
    response = make_response()

    response = jsonify({"resultado":"Usuario no activo"})
    return response



####################################################################

#PROYECTO

@app.route("/usuario", methods=["POST"])
@cross_origin()
def usuario():
    nombre = request.json["nombre_de_usuario"]
    contraseña = request.json["contraseña"]
    email = request.json["email"]

  

    cursor = mysql.connection.cursor()

    sql = "INSERT INTO Usuario(nombre, contrasenia, email) values(%s, %s,%s);"
    cursor.execute(sql, (nombre, contraseña, email))


    mysql.connection.commit()

    cursor.close()
    response = make_response()

    response = jsonify({"resultado":"Agregado nueva receta"})
    return response


@app.route("/inicio_sesion", methods=["POST"])
@cross_origin()
def inicio_sesion():
    nombre = request.json["nombre_email"]
    contraseña = request.json["contraseña"]
    email = request.json["email"]

  

    cursor = mysql.connection.cursor()

    sql = "SELECT id, nombre FRONT Usuario WHERE (nombre =%s OR email=%s) AND contrasenia=%s"
    cursor.execute(sql, (nombre, email,  contraseña))


    mysql.connection.commit()

    cursor.close()
    response = make_response()

    response = jsonify({"resultado":"Agregado nueva receta"})
    return response
@app.route("/plan_semanal", methods=["POST"])
@cross_origin()
def agregar_plan_semanal():

    fecha = request.json["fecha"]
    nombre = request.json["nombre"]
    id_usuario = request.json["id_usuario"]

    cursor = mysql.connection.cursor()

    sql = """
        INSERT INTO Plan_semanal
        (fecha, nombre, id_usuario)
        VALUES (%s, %s, %s)
    """

    cursor.execute(sql, (fecha, nombre, id_usuario))

    mysql.connection.commit()

    cursor.close()

    response = jsonify({"resultado": "Plan semanal agregado"})
    return response







@app.route("/dietas", methods=["GET"])
@cross_origin()
def listar_dietas():
    # Consulta SQL
    sql = """
        SELECT id_dieta,
               nombre,
               descripcion,
               id_usuario,
               filtro_carbohidratos,
               filtro_proteina,
               filtro_condicion
        FROM Dietas
    """

    # Crear cursor
    cursor = mysql.connection.cursor()
    cursor.execute(sql)

    resultado = cursor.fetchall()

    # Cerrar cursor
    cursor.close()

    if resultado is None or len(resultado) == 0:
        return jsonify({"mensaje": None})

    dietas = []

    for i in resultado:
        dieta = {
            "id": i[0],
            "nombre": i[1],
            "descripcion": i[2],
            "id_usuario": i[3],
            "filtro_carbohidratos": i[4],
            "filtro_proteina": i[5],
            "filtro_condicion": i[6]
        }

        dietas.append(dieta)

    return jsonify(dietas)
@app.route("/ingredientes", methods=["GET"])
@cross_origin()
def listar_ingredientes():
    # Consulta SQL para traer todos los ingredientes
    sql = """
        SELECT idIngredientes,
               nombre,
               porcion,
               kcal,
               proteinas,
               carbohidratos,
               grasas,
               sodio,
               peso
        FROM ingredientes
    """

    cursor = mysql.connection.cursor()
    cursor.execute(sql)

    resultado = cursor.fetchall()
    cursor.close()

    if resultado is None or len(resultado) == 0:
        return jsonify({"mensaje": None})

    ingredientes = []

    for fila in resultado:
        ingrediente = {
            "idIngredientes": fila[0],
            "nombre": fila[1],
            "porcion": fila[2],
            "kcal": fila[3],
            "proteinas": fila[4],
            "carbohidratos": fila[5],
            "grasas": fila[6],
            "sodio": fila[7],
            "peso": fila[8]
        }
        ingredientes.append(ingrediente)

    return jsonify(ingredientes)








if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)