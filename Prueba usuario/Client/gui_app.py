import tkinter as tk
from tkinter.font import BOLD
from turtle import width
from tkinter import ttk


def barra_menu(root):
    barra_menu = tk.Menu (root)
    root.config(menu = barra_menu, width = 300,  height = 300)

    menu_inicio = tk.Menu (barra_menu, tearoff=0)
    barra_menu.add_cascade(label="Inicio", menu = menu_inicio)

    menu_inicio.add_command(label= "Crear Registro")
    menu_inicio.add_command(label= "Eliminar Registro")
    menu_inicio.add_command(label= "Desconectar")
    menu_inicio.add_command(label= "Salir", command = root.destroy)

    barra_menu.add_cascade(label="Consultas")

class Frame(tk.Frame):
    def __init__(self, root=None):
        super().__init__(root, width=700, height=500)
        self.root = root
        self.config(bg = "Black")
        self.pack() 

        self.campos_disqueria()
        self.deshabilitar_campos()
        self.tabla_stock()

    def campos_disqueria(self):
        #Labels de cada campo para consultas
        self.label_nombre = tk.Label(self, text = 'Cancion: ')
        self.label_nombre.config(font = ('arial', 14, 'bold'), fg = "white", bg = "black")
        self.label_nombre.grid(row = 0, column = 0, padx = 10, pady = 10)

        self.label_artista = tk.Label(self, text = "Artista o Banda: ")
        self.label_artista.config(font=("arial", 14, "bold"), fg = "white", bg = "black")
        self.label_artista.grid(row = 1, column = 0, padx = 10, pady = 10)

        self.label_album = tk.Label(self, text = "Album: ")
        self.label_album.config(font = ("arial", 14, "bold"), fg = "white", bg = "black")
        self.label_album.grid(row = 2, column = 0, padx = 10, pady = 10)

        self.label_genero = tk.Label(self, text = "Genero: ")
        self.label_genero.config(font = ("arial", 14, "bold"), fg = "white", bg = "black")
        self.label_genero.grid(row = 3, column = 0, padx = 10, pady = 10)

        #Entrys de cada campo para consultas
        self.Nombre_campo = tk.StringVar()
        self.entry_nombre = tk.Entry(self, textvariable = self.Nombre_campo)
        self.entry_nombre.config(
            width = 50, font =("Arial", 10))
        self.entry_nombre.grid(row = 0, column = 1, padx = 10, pady = 10, columnspan=2)

        self.Artista_campo = tk.StringVar()
        self.entry_artista = tk.Entry(self, textvariable = self.Artista_campo)
        self.entry_artista.config(
            width = 50, font =("Arial", 10))
        self.entry_artista.grid(row = 1, column = 1, padx = 10, pady = 10, columnspan=2)

        self.Album_campo = tk.StringVar()
        self.entry_album = tk.Entry(self, textvariable = self.Album_campo)
        self.entry_album.config(
            width = 50, font =("Arial", 10))
        self.entry_album.grid(row = 2, column = 1, padx = 10, pady = 10, columnspan=2)

        self.Genero_campo = tk.StringVar()
        self.entry_genero = tk.Entry(self, textvariable = self.Genero_campo)
        self.entry_genero.config(
            width = 50, font =("Arial", 10))
        self.entry_genero.grid(row = 3, column = 1, padx = 10, pady = 10, columnspan=2)

    #Botones
        self.button1 = tk.Button(self, text = "Nuevo", command = self.habilitar_campos)
        self.button1.config(width=10, font =("Arial", 12, "bold"), fg = "white", bg = "green", cursor = "hand2")
        self.button1.grid(row = 4, column = 0, padx = 10, pady = 10)

        self.button2 = tk.Button(self, text = "Borrar", command = self.deshabilitar_campos)
        self.button2.config(width=10, font =("Arial", 12, "bold"), fg = "white", bg = "red", cursor = "hand2")
        self.button2.grid(row = 4, column = 1, padx = 10, pady = 10)

        self.button4 = tk.Button(self, text = "Consultar")
        self.button4.config(width=10, font =("Arial", 12, "bold"), fg = "white", bg = "grey", cursor = "hand2")
        self.button4.grid(row = 4, column = 2, padx = 10, pady = 10)

    def habilitar_campos(self):
        self.Nombre_campo.set("")
        self.Artista_campo.set("")
        self.Album_campo.set("")
        self.Genero_campo.set("")   

        self.entry_nombre.config(state = "normal")
        self.entry_artista.config(state = "normal")
        self.entry_album.config(state = "normal")
        self.entry_genero.config(state = "normal")
        self.button2.config(state = "normal")
        self.button4.config(state = "normal")

    def deshabilitar_campos(self):
        self.Nombre_campo.set("")
        self.Artista_campo.set("")
        self.Album_campo.set("")
        self.Genero_campo.set("")

        self.entry_nombre.config(state = "disabled")
        self.entry_artista.config(state = "disabled")
        self.entry_album.config(state = "disabled")
        self.entry_genero.config(state = "disabled")
        self.button2.config(state = "disabled")
        self.button4.config(state = "disabled")

    def guardar_datos(self):

        self.deshabilitar_campos()

    #Tabla de la base de datos
    def tabla_stock(self):

        self.tabla = ttk.Treeview(self, 
        column = ("Tema", "Interprete", "Album", "Genero"))
        self.tabla.grid(row=5, column =0, columnspan=4, sticky = "nse")

        #Scrolling base de datos
        self.scroll = ttk.Scrollbar(self, 
        orient = "vertical", command = self.tabla.yview)
        self.scroll.grid(row = 5, column= 4, sticky = "nse")
        self.tabla.configure(yscrollcommand = self.scroll.set)

        self.tabla.heading("#0", text ="Tema")
        self.tabla.heading("#1", text ="Interprete")
        self.tabla.heading("#2", text ="Album")
        self.tabla.heading("#3", text ="Genero")

    #Botones de la tabla de base de datos
        self.button5 = tk.Button(self, text = "Editar")
        self.button5.config(width=10, font =("Arial", 12, "bold"), fg = "white", bg = "green", cursor = "hand2")
        self.button5.grid(row = 6, column = 0, padx = 10, pady = 10)

        self.button6 = tk.Button(self, text = "Registrar")
        self.button6.config(width=10, font =("Arial", 12, "bold"), fg = "white", bg = "blue", cursor = "hand2")
        self.button6.grid(row = 6, column = 2, padx = 10, pady = 10)

        self.button7 = tk.Button(self, text = "Eliminar")
        self.button7.config(width=10, font =("Arial", 12, "bold"), fg = "white", bg = "red", cursor = "hand2")
        self.button7.grid(row = 6, column = 1, padx = 10, pady = 10)