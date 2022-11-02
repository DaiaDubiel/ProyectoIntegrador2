from tkinter import ttk
from tkinter import *
from conexion import *

def listarDisqueria():
    Listas = Tk()
    Listas.title("Listas Genero e Interprete")
    Listas.geometry("1300x400")
    Listas.config(bg="black")

    db = Conexion()
    
    def consulta():
        sql = "select nombre_genero from genero order by id_genero"
        db.cursor.execute(sql)
        generos= db.cursor.fetchall()       
        resultados = [result[0]  for result in generos]
        return resultados

    def getSelection(comboBox):
        val = comboBox.widget.get()
        limpiarTr()
        mostrarListarPorGenero(val)

    marco=LabelFrame(Listas,text="Listado de álbumes disponibles por artista, en orden alfabético", bg="black", font =("Arial", 14, "bold"), fg="white")
    marco.place(x=20,y=45,width=600,height=300)

    marco1=LabelFrame(Listas,text="Listado por género musical", bg="black", font =("Arial", 14, "bold"), fg="white")
    marco1.place(x=650,y=45,width=600,height=300)


    #table de la lista de interprete
    tvAlbum= ttk.Treeview(marco,selectmode = NONE)
    tvAlbum.grid(column=0,row=12, columnspan=6, padx=25, pady=35)
    tvAlbum["columns"]=("ID","NOMBRE DEL ALBUM","NOMBRE","APELLIDO")
    tvAlbum.column("#0",width=0, stretch=NO)
    tvAlbum.column("ID",width=0, stretch=NO, anchor=CENTER)
    tvAlbum.column("NOMBRE DEL ALBUM",width=180,anchor=CENTER)
    tvAlbum.column("NOMBRE",width=180,anchor=CENTER)
    tvAlbum.column("APELLIDO",width=180, anchor=CENTER)

    tvAlbum.heading("#0",text="")
    tvAlbum.heading("ID",text="Id", anchor=CENTER)
    tvAlbum.heading("NOMBRE DEL ALBUM",text="Nombre del Albúm", anchor=CENTER)
    tvAlbum.heading("NOMBRE",text="Nombre ", anchor=CENTER)
    tvAlbum.heading("APELLIDO",text="Apellido", anchor=CENTER)


    tvGenero= ttk.Treeview(marco1,selectmode = NONE)
    tvGenero.grid(column=0,row=3,  padx=10, pady=5, columnspan=6)
    tvGenero["columns"]=("NOMBRE ALBUM", "GENERO")
    tvGenero.column("#0",width=0, stretch=NO)
    tvGenero.column("NOMBRE ALBUM",width=400, anchor=CENTER)
    tvGenero.column("GENERO",width=170,anchor=CENTER)

    tvGenero.heading("#0",text="aa")
    tvGenero.heading("NOMBRE ALBUM",text="Nombre del Albúm", anchor=CENTER)
    tvGenero.heading("GENERO",text="Genero", anchor=CENTER)

    comboBox = ttk.Combobox(marco1)
    comboBox['value'] = consulta()
    comboBox.grid(column= 0, row =0, padx=5,pady=5, )
    comboBox.bind('<<ComboboxSelected>>', getSelection)

    #FUNCIONES:

    def limpiarTr():
        tvGenero.delete(*tvGenero.get_children())

    def mostrarAlbumPorArtista():
        if db.conexion.is_connected():
            try: 
                sql = "SELECT album.id_album, album.nombre, interprete.nombre, interprete.apellido FROM ((album INNER JOIN album_interprete ON album.id_album = album_interprete.id_album) INNER JOIN interprete ON album_interprete.id_interprete = interprete.id_interprete) order by interprete.nombre asc"
                db.cursor.execute(sql)
                filas= db.cursor.fetchall()
                for fila in filas:
                    id = fila[0]
                    tvAlbum.insert("", END, id, text= id, values = fila )
            except:
                print("No se pudo listar por artista")

    def mostrarListarPorGenero(nombre):
        if db.conexion.is_connected():
            try: 
                sql = "SELECT album.nombre, genero.nombre_genero FROM album INNER JOIN album_genero ON album.id_album = album_genero.id_album INNER JOIN genero ON album_genero.id_genero = genero.id_genero where genero.nombre_genero = '" + nombre + "' order by album.nombre asc "
                db.cursor.execute(sql)
                filas2= db.cursor.fetchall()
                for fila2 in filas2:
                    id2 = fila2[0]
                    #print(fila2)
                    tvGenero.insert("", END, id2, text= id2, values = fila2 )
            except:
                print("No se pudo listar por genero")

    mostrarAlbumPorArtista()

    Listas.mainloop()