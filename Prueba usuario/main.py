from tkinter import * 
import os
from tkinter import ttk as ttk
from tkinter import messagebox as messagebox
from usuarios import usuario
from catalogo_disqueria import main

def createGUI():

    root = Tk()
    nombreUsuario = StringVar()
    contraseñaUsuario = StringVar()
    usuarios = []
    root.title("Login Usuario")

    #MAIN 
    mainFrame = Frame(root)
    mainFrame.pack()
    mainFrame.config(width = 480, height = 320)
    def iniciarSesion():
        for user in usuarios:
            if user.nombre==nombreUsuario.get():
                test = user.conectar(contraseñaUsuario.get())
                if test:
                    messagebox.showinfo("Conectado", "Se inicio sesion con éxito")
                    main()
                else:
                    messagebox.showerror("Error", "Contraseña Incorrecta")
                break
        else:
            messagebox.showerror("Error", "No existe usuario con ese nombre")

    def RegistrarUsuario():
        name = nombreUsuario.get()
        password = contraseñaUsuario.get()
        newUser = usuario (name, password)
        usuarios.append(newUser)
        messagebox.showinfo("Registrado", f"Se registro el usuario [{name}] con éxito")
        newUser = open(name, "w")
        newUser.write(name + "\n")
        newUser.write(password)
        newUser.close()
        nombreUsuario.set("")
        contraseñaUsuario.set("")

    #TITULOS
    titulo = Label(mainFrame, text="Login Usuario", font=("Arial", 12))
    titulo.grid(row = 0, column= 0, padx=10, pady=10)

    nombreLabel = Label(mainFrame, text="Nombre: ")
    nombreLabel.grid(row = 1, column = 0, padx=10, pady=10)
    passLabel = Label(mainFrame, text="Contraseña: ")
    passLabel.grid(row = 2, column = 0, padx=10, pady=10)

    #ENTRADAS
    nombreUsuario.set("")
    nombreEntry = Entry(mainFrame, textvariable=nombreUsuario)
    nombreEntry.grid(row = 1, column =1, padx=10, pady=10, columnspan=2)

        
    contraseñaUsuario.set("")
    contraseñaEntry = Entry(mainFrame, textvariable=contraseñaUsuario, show = "*")
    contraseñaEntry.grid(row = 2, column =1, padx=10, pady=10, columnspan=2)

    #BOTONES
    iniciarSesionButton = ttk.Button(mainFrame, text="Iniciar Sesion", command=iniciarSesion)
    iniciarSesionButton.grid(row =3, column=1, ipadx=5, ipady=5, padx=10, pady=10)

    RegistrarButton = ttk.Button(mainFrame, text="Registrar", command=RegistrarUsuario)
    RegistrarButton.grid(row =3, column=0, ipadx=5, ipady=5, padx=10, pady=10)

    root.mainloop() 

    if __name__ == "__main__":
        #user1= usuario(input("Ingrese nombre: "), input("Ingrese contraseña:"))#
        user1 = usuario("Daia", "1234")
        usuarios.append(user1)

        createGUI()

        
