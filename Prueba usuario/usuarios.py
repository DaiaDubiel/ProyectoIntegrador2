class usuario():
    numUsuarios = 0

    def __init__(self, nombre, password):
        self.nombre = nombre
        self.contraseña = password

        self.conectado = False
        self.intentos = 3

        usuario.numUsuarios +=1

    def conectar(self, contra=None):
        if contra == None:
            myContraseña = input ("Ingrese Contraseña: ")
        else:
            myContraseña=contra
        
        if myContraseña == self.contraseña:
            print ("Se conecto con éxito")
            self.conectado = True
            return True
        
        else:
            self.intentos -=1
            if self.intentos > 0: 
                print("Contraseña incorrecta, intente de nuevo")
                if contra != None:
                    return False
                print("Intentos Restantes: ", self.intentos)
                self.conectar()
            else: 
                print ("No se pudo iniciar sesión")

    def desconectar(self):
        if self.conectado:
            print("Se cerro con éxito la conexión")
            self.conectado = False

        else:
            print ("Error en inicio de sesión")

    def __str__(self) -> str:
        if self.conectado:
            connect = "Conectado" 

        else:
            connect = "Desconectado"
        return f"Mi nombre de usuario es {self.nombre} y estoy {connect}"


    
    
        

