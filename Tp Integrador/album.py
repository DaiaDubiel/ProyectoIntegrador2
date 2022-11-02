from cmd import IDENTCHARS
from subprocess import IDLE_PRIORITY_CLASS
from tkinter import ttk
from tkinter import *
from conexion import *
from tkinter import messagebox as messagebox
from listar_genero_interprete import listarDisqueria

ventana = Tk()
ventana.title("ALBUM")
ventana.geometry("1300x700")
ventana.config(bg="black")
menubar = Menu(ventana) 
filemenu = Menu(menubar, tearoff=0)
filemenu.add_command(label="Lista Genero e Interprete", command=lambda: SecondWindow())
filemenu.add_command(label="Salir", command=ventana.destroy)
menubar.add_cascade(label="Inicio", menu=filemenu)
ventana.config(menu=menubar)

db = Conexion()
id_album = StringVar()
cod_album = StringVar()
nombre = StringVar()
cant_temas = IntVar()
fecha_lanzamiento = StringVar()
precio = DoubleVar()
cantidad = IntVar()
caratula = StringVar()
discografica = []
id_discografia = IntVar()  
album = []

def SecondWindow():

    SecondWindow = listarDisqueria()
    SecondWindow = Toplevel(ventana)


def seleccionar(event):
    id = tvAlbum.selection()[0]
    if int(id) >0:

        id_album.set(tvAlbum.item(id,"values")[0])
        id_discografia.set(tvAlbum.item(id,"values")[1])
        cod_album.set(tvAlbum.item(id,"values")[2])
        nombre.set(tvAlbum.item(id,"values")[3])
        cant_temas.set(tvAlbum.item(id,"values")[4])
        fecha_lanzamiento.set(tvAlbum.item(id,"values")[5])
        precio.set(tvAlbum.item(id,"values")[6])
        cantidad.set(tvAlbum.item(id,"values")[7])
        caratula.set(tvAlbum.item(id,"values")[8])


def limpiarTr():
    tvAlbum.delete(*tvAlbum.get_children()) 

def seleccionarDiscografica(event):
    id = tvDiscografica.selection()[0]
    if int(id) >0:
        id_discografia.set(tvDiscografica.item(id,"values")[0])

def obtener_album(event):
    buscaralbum = tvAlbum.identify_row(event.y)
    elemento = tvAlbum.item(tvAlbum.focus())

    cod_album1 = elemento ["values"][2]
    nombre1 = elemento ["values"][3]
    cant_temas1 = elemento ["values"][4]
    fecha_lanzamiento1 = elemento ["values"][5]
    precio1 = elemento ["values"][6]
    cantidad1 = elemento ["values"][7]
    caratula1 = elemento ["values"][8]

    cod_album.set
    nombre.set
    cant_temas.set
    fecha_lanzamiento.set
    precio.set
    cantidad.set
    caratula.set

    pop = Toplevel(ventana)
    pop.title("Consulta")
    pop.geometry("400x400")
    pop.config(bg="black")

    lbl_cod_album = Label(pop, text="cod_album", bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 20, y= 40 )
    lbl_nombre = Label(pop, text="nombre", bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 20, y= 80 )
    lbl_cant_temas = Label(pop, text="cant_temas", bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 20, y= 120 )
    lbl_fecha_lanzamiento = Label(pop, text="lanzamiento", bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 20, y= 160 )
    lbl_precio = Label(pop, text="precio", bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 20, y= 200 )
    lbl_cantidad = Label(pop, text="cantidad", bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 20, y= 240 )
    lbl_caratula = Label(pop, text="caratula", bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 20, y= 280 )
    txt_cod_album = Entry(pop, textvariable=cod_album, bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 120, y= 40 )
    txt_nombre = Entry(pop, textvariable=nombre, bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 120, y= 80 )
    txt_cant_temas = Entry(pop, textvariable=cant_temas, bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 120, y= 120 )
    txt_fecha_lanzamiento = Entry(pop, textvariable=fecha_lanzamiento, bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 120, y= 160 )
    txt_precio = Entry(pop, textvariable=precio, bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 120, y= 200 )
    txt_cantidad = Entry(pop, textvariable=cantidad, bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 120, y= 240 )
    txt_caratula = Entry(pop, textvariable=caratula, bg="black", font =("Arial", 12, "bold"), fg="white").place(x= 120, y= 280 )



marco=LabelFrame(ventana,text="Datos Albúm", bg="black", font =("Arial", 14, "bold"), fg="white")
marco.place(x=20,y=20,width=1000,height=650)

marco1=LabelFrame(ventana,text="Discografica", bg="black", font =("Arial", 14, "bold"), fg="white")
marco1.place(x=1050,y=20,width=200,height=300)

#labels y entrys

lblIdDiscografica = Label(marco,text="ID disc", bg="black", font =("Arial", 12, "bold"), fg="white")
lblIdDiscografica.grid(column=0,row=1, padx= 5,pady=5)
txtIdDiscografica= Entry(marco, textvariable= id_discografia)
txtIdDiscografica.config(state = "disabled")
txtIdDiscografica.grid(column=1,row=1)


lblIdAlbum = Label(marco,text="ID Album", bg="black", font =("Arial", 12, "bold"), fg="white")
lblIdAlbum.grid(column=0,row=1, padx= 5,pady=5)
lblIdAlbum.grid_forget()
txtIdAlbum= Entry(marco, textvariable= id_album, state=DISABLED)
txtIdAlbum.grid(column=0,row=1)
txtIdAlbum.grid_forget()

lblCodAlbum = Label(marco,text="Código Albúm", bg="black", font =("Arial", 12, "bold"), fg="white").grid(column=0,row=2, padx= 5,pady=5)
txtCodAlbum= Entry(marco, textvariable= cod_album)
txtCodAlbum.config(state = "disabled")
txtCodAlbum.grid(column=1,row=2)


lblNombre = Label(marco,text="Nombre", bg="black", font =("Arial", 12, "bold"), fg="white").grid(column=0,row=3, padx= 5,pady=5)
txtNombre= Entry(marco, textvariable= nombre)
txtNombre.config(state = "disabled")
txtNombre.grid(column=1,row=3)


lblNombre1 = Label(marco,text="Cantidad Temas", bg="black", font =("Arial", 12, "bold"), fg="white").grid(column=0,row=4, padx= 5,pady=5)
txtNombre1= Entry(marco, textvariable= cant_temas)
txtNombre1.config(state = "disabled")
txtNombre1.grid(column=1,row=4)

lblNombre2 = Label(marco,text="Fecha Lanzamiento", bg="black", font =("Arial", 12, "bold"), fg="white").grid(column=0,row=5, padx= 5,pady=5)
txtNombre2= Entry(marco, textvariable= fecha_lanzamiento)
txtNombre2.config(state = "disabled")
txtNombre2.grid(column=1,row=5)

lblNombre3 = Label(marco,text="Precio", bg="black", font =("Arial", 12, "bold"), fg="white").grid(column=0,row=6, padx= 5,pady=5 )
txtNombre3= Entry(marco, textvariable= precio)
txtNombre3.config(state = "disabled")
txtNombre3.grid(column=1,row=6)

lblNombre4 = Label(marco,text="Cantidad Unidades", bg="black", font =("Arial", 12, "bold"), fg="white").grid(column=0,row=7, padx= 5,pady=5)
txtNombre4= Entry(marco, textvariable= cantidad)
txtNombre4.config(state = "disabled")
txtNombre4.grid(column=1,row=7)

lblNombre5 = Label(marco,text="Caratula", bg="black", font =("Arial", 12, "bold"), fg="white").grid(column=0,row=8, padx= 5,pady=5)
txtNombre5= Entry(marco, textvariable= caratula)
txtNombre5.config(state = "disabled")
txtNombre5.grid(column=1,row=8)


#Botones Interfaz
btnNuevo = Button(marco,text="Nuevo", pady=10, padx=10, width=6, command=lambda:nuevo(), bg="green", font =("Arial", 10, "bold"), fg="white", cursor = "hand2" )
btnNuevo.grid(column=0, row=10)

btnEliminar = Button(marco,text="Eliminar", pady=10, padx=10, command=lambda:eliminar(), bg="red", font =("Arial", 10, "bold"), fg="white", cursor = "hand2")
btnEliminar.config(state = "disabled")
btnEliminar.grid(column=1, row=10)

btnModificar = Button(marco,text="Modificar", pady=10, padx=10, command=lambda:actualizarALbum(), bg="blue", font =("Arial", 10, "bold"), fg="white", cursor = "hand2")
btnModificar.config(state = "disabled")
btnModificar.grid(column=2, row=10)


#table de la lista de interprete
tvAlbum= ttk.Treeview(marco,selectmode = NONE)
tvAlbum.grid(column=0,row=12, columnspan=4, padx=65, pady=10)
tvAlbum["columns"]=("ID","DISCOGRAFICA","COD ALBUM","NOMBRE","TEMAS","LANZAMIENTO","PRECIO","CANTIDAD","CARATULA")
tvAlbum.column("#0",width=0, stretch=NO)
tvAlbum.column("ID",width=0, stretch=NO, anchor=CENTER)
tvAlbum.column("DISCOGRAFICA",width=100,anchor=CENTER)
tvAlbum.column("COD ALBUM",width=100,anchor=CENTER)
tvAlbum.column("NOMBRE",width= 150, anchor=CENTER)
tvAlbum.column("TEMAS",width= 50, anchor=CENTER)
tvAlbum.column("LANZAMIENTO",width= 100, anchor=CENTER)
tvAlbum.column("PRECIO",width= 100, anchor=CENTER)
tvAlbum.column("CANTIDAD",width= 60, anchor=CENTER)
tvAlbum.column("CARATULA",width= 200, anchor=CENTER)

tvAlbum.heading("#0",text="")
tvAlbum.heading("ID",text="Id", anchor=CENTER)
tvAlbum.heading("DISCOGRAFICA",text="Discografica", anchor=CENTER)
tvAlbum.heading("COD ALBUM",text="Cod Album", anchor=CENTER)
tvAlbum.heading("NOMBRE",text="Nombre", anchor=CENTER)
tvAlbum.heading("TEMAS",text="Temas", anchor=CENTER)
tvAlbum.heading("LANZAMIENTO",text="Lanzamiento", anchor=CENTER)
tvAlbum.heading("PRECIO",text="Precio", anchor=CENTER)
tvAlbum.heading("CANTIDAD",text="Cantidad", anchor=CENTER)
tvAlbum.heading("CARATULA",text="Caratula", anchor=CENTER)
tvAlbum.bind("<<TreeviewSelect>>", seleccionar )
tvAlbum.bind("<Double 1>", obtener_album )



tvDiscografica= ttk.Treeview(marco1,selectmode = NONE)
tvDiscografica.grid(column=1,row=2,  padx=5, pady=5)
tvDiscografica["columns"]=("ID","NOMBRE DISCOGRAFICA")
tvDiscografica.column("#0",width=0, stretch=NO)
tvDiscografica.column("ID",width=0, stretch=NO, anchor=CENTER)
tvDiscografica.column("NOMBRE DISCOGRAFICA",width=180,anchor=CENTER)


tvDiscografica.heading("#0",text="")
tvDiscografica.heading("ID",text="Id", anchor=CENTER)
tvDiscografica.heading("NOMBRE DISCOGRAFICA",text="Nombre Discografica", anchor=CENTER)
tvDiscografica.bind("<<TreeviewSelect>>", seleccionarDiscografica)


#Botones Base de datos

btnGuardar = Button(marco,text="Guardar", pady=10, padx=10, command=lambda:Guardar(), bg="green", font =("Arial", 10, "bold"), fg="white", cursor = "hand2" )
btnGuardar.config(state = "disabled")
btnGuardar.grid(column=0, row=13)

btnCancelar = Button(marco,text="Cancelar", pady=10, padx=10, command=lambda:[limpiar(),mostrarAlbum()], bg="red", font =("Arial", 10, "bold"), fg="white", cursor = "hand2")
btnCancelar.config(state = "disabled")
btnCancelar.grid(column=1, row=13)

btnConsultar = Button(marco,text="Consultar", pady=10, padx=10, command=lambda:buscarAlbum(), bg="grey", font =("Arial", 10, "bold"), fg="white", cursor = "hand2" )
btnConsultar.config(state = "disabled")
btnConsultar.grid(column=2, row=13)
    

#Funciones

def mostrarAlbum():
    if db.conexion.is_connected():
        try: 
            sql = "select id_album, codigo_album, nombre, cant_temas, fecha_lanzamiento, precio, cantidad, caratula from album order by id_album asc"
            db.cursor.execute(sql)
            db.cursor.fetchall()
            db.conexion.commit()
            limpiarTr()
            limpiar()
            mostrarTabla()  
            
        except mysql.connector.Error as descripcionError:
                print("¡No se conectó!",descripcionError) 
            

def mostrarTabla():

    modificarTrue()

    sql = "select * from album order by id_album asc"
    db.cursor.execute(sql)
    filas= db.cursor.fetchall()
    for fila in filas:
        id = fila[0]
        tvAlbum.insert("", END, id, text= id, values = fila )


def mostrarDiscografica():
    
    sql = "select * from discografica order by id_discografica asc"
    db.cursor.execute(sql)
    filas2= db.cursor.fetchall()
    for fila in filas2:
        id = fila[0]
        #print(fila[0])
        tvDiscografica.insert("", END, id, text= id, values = fila )

def nuevo():
    habilitar_campos()

def habilitar_campos():

    txtIdDiscografica.config(state = "normal")
    txtIdAlbum.config(state = "normal")
    txtCodAlbum.config(state = "normal")
    txtNombre.config(state = "normal")
    txtNombre1.config(state = "normal")
    txtNombre2.config(state = "normal")
    txtNombre3.config(state = "normal")
    txtNombre4.config(state = "normal")
    txtNombre5.config(state = "normal")
    btnEliminar.config(state = "normal")
    btnModificar.config(state = "normal")
    btnGuardar.config(state = "normal")
    btnCancelar.config(state = "normal")
    btnConsultar.config(state = "normal")

def deshabilitar_campos():

    txtIdDiscografica.config(state = "disabled")
    txtIdAlbum.config(state = "disabled")
    txtCodAlbum.config(state = "disabled")
    txtNombre.config(state = "disabled")
    txtNombre1.config(state = "disabled")
    txtNombre2.config(state = "disabled")
    txtNombre3.config(state = "disabled")
    txtNombre4.config(state = "disabled")
    txtNombre5.config(state = "disabled")
    btnEliminar.config(state = "disabled")
    btnModificar.config(state = "disabled")
    btnGuardar.config(state = "disabled")
    btnCancelar.config(state = "disabled")
    btnConsultar.config(state = "disabled")

def limpiar():
    id_album.set("")
    id_discografia.set("")
    cod_album.set("")
    nombre.set("")
    cant_temas.set("")
    precio.set("")
    fecha_lanzamiento.set("")
    caratula.set("")
    cantidad.set("")

    deshabilitar_campos()


def modificarTrue():
    global modificar
    modificar = True
    tvAlbum.config(selectmode=BROWSE)

def modificarTrueDisco():
    global modificar
    modificar = True
    tvDiscografica.config(selectmode=BROWSE)


def modificarFalse():
    global modificar
    modificar = False
    tvAlbum.config(selectmode=NONE)
    btnNuevo.config(text="Nuevo")
    btnModificar.config(text="Modificar")

def buscarAlbum():
    if  db.conexion.is_connected():
        try:
            limpiarTr()
            cursor = db.conexion.cursor()
            sql = "SELECT * FROM album WHERE nombre = '"+nombre.get()+"'"
            cursor.execute(sql)
            cursor = cursor.fetchall()
            for fila in cursor:
                id = fila[0]
                tvAlbum.insert("", END, id, text= id, values = fila )

        except mysql.connector.Error as descripcionError:
                print("¡No se conectó!",descripcionError) 
            

def actualizarALbum():
    if db.conexion.is_connected():
        try:
                cursor = db.conexion.cursor()

                sql = "UPDATE album set id_discografica=%s,codigo_album=%s,nombre=%s,cant_temas=%s,fecha_lanzamiento=%s,precio=%s,cantidad=%s,caratula=%s where id_album=%s"
                data = (id_discografia.get(),cod_album.get(),nombre.get(),cant_temas.get(),fecha_lanzamiento.get(),precio.get(),cantidad.get(),caratula.get(), id_album.get())
                cursor.execute(sql,data)
                db.conexion.commit()
                messagebox.showinfo("OK", "Se modifico album con éxito")
                limpiarTr()
                limpiar()
                mostrarTabla()

        except mysql.connector.Error as descripcionError:
                print("¡No se conectó!",descripcionError) 


def Guardar():
    if db.conexion.is_connected():
        try:
                cursor = db.conexion.cursor()

                sql = "insert into album values (null,%s,%s,%s,%s,%s,%s,%s,%s);"
                data = (id_discografia.get(),cod_album.get(),nombre.get(),cant_temas.get(),fecha_lanzamiento.get(),precio.get(),cantidad.get(),caratula.get())
                cursor.execute(sql,data)
                db.conexion.commit()
                messagebox.showinfo("OK", "Se ingreso album con éxito")
                limpiarTr()
                limpiar()
                mostrarTabla()
                

        except mysql.connector.Error as descripcionError:
                print("¡No se conectó!",descripcionError)
                 

def eliminar():

    modificarTrue()
    album = id_album.get()

    if db.conexion.is_connected():
        try:
            sql='''DELETE FROM album_genero WHERE id_album = {}'''.format(album)
            db.cursor.execute(sql)
            print("se ah desvinculado correctamente album-genero")

            sql='''DELETE FROM album_interprete WHERE id_album = {}'''.format(album)
            db.cursor.execute(sql)
            print("se ah desvinculado correctamente album-interprete")

            sql='''DELETE FROM album_formato WHERE id_album = {}'''.format(album)
            db.cursor.execute(sql)
            print("se ah desvinculado correctamente album-formato")

            sql='''DELETE FROM album_tema WHERE id_album = {}'''.format(album)
            db.cursor.execute(sql)
            print("se ah desvinculado correctamente album-tema")

            print("DESVINCULACION COMPLETA AHORA SE PUEDE BORRAR EL ALBUM")
            
            sql='''DELETE FROM album WHERE id_album = {}'''.format(album)
            db.cursor.execute(sql)
            db.conexion.commit()
            messagebox.showinfo("OK", "Se eliminó album con éxito")
            limpiarTr()
            limpiar()
            mostrarTabla()         
            
        except mysql.connector.Error as descripcionError:
                print("¡No se conectó!",descripcionError)  


modificarFalse()
mostrarDiscografica()
modificarTrueDisco()
mostrarTabla()



ventana.mainloop()