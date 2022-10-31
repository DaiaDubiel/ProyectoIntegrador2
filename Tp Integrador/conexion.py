
import mysql.connector

class Conexion:
    def __init__(self):
        try:
            self.conexion = mysql.connector.connect(
                host = 'vps-2446628-x.dattaweb.com',
                port = 3306,
                user = 'x050vm10_BD',
                password = 'Practico2022',
                database = 'x050vm10_base1'
            )
            
            self.cursor = self.conexion.cursor() 

            if self.conexion.is_connected():
                print("la conexión fue exitosa OK")

        except:
            print("no se conecto ocurrio un error")

        # finally:
        #     if self.conexion.is_connected():
        #         self.conexion.close()
        #         print("la conexión se cerro")


 