import shutil as s
import os

fich = open("rutas.txt", "r")
lines = fich.readlines()

filelist = []
dirlist = []

for i in lines:
    limpio = i.strip()
    if os.path.isfile(limpio):
        filelist.append(limpio)
    if os.path.isdir(limpio):
        dirlist.append(limpio)
    if not os.path.isdir(limpio) or os.path.isdir(limpio):
        print(f"{limpio} no es un fichero ni un directorio")

while True:
    print("A - Pedir nombre de fichero y eliminarlo \n"
          "B - Pedir nombre de directorio y se mostrara su información \n"
          "C - Pedir nopmbre de fichero, nombre de destino y copiarlo en el destino \n"
          "D - Mostrar lista elegida por el usuario \n"
          "E - Salir")
    opt = input("Elige qué opción quieres usar")

    match opt:
        case "A":
            print("Esta es la lista de los ficheros \n", filelist)
            clean = input("Elige el que quieres limpiar")
            for i in filelist:
                if clean in i and os.path.isfile(clean):
                    os.remove(i)
                    print("El fichero ha sido eliminado")
                else:
                    print("El fichero no se ha podido eliminar debido a un error.")

            print("El fichero ha sido eliminado")
        case "B":
            print("Esta es la lista de los directorios \n", dirlist)
            infodir = input("Dime el nombre del directorio")
            if os.path.isdir(infodir):
                print(os.listdir(infodir))
        case "C":
            print("Esta es la lista de los ficheros \n", filelist)
            copia = input("Dime el fichero que quieres copiar")
            print("Esta es la lista de los directorios \n", dirlist)
            destino = input("Dime el destino al que lo quieres copiar")
            if os.path.isdir(destino) and os.path.isfile(copia):
                s.copy(copia, destino)
        case "D":
            optlist = input("Dime que lista quieres mostrar \n"
                            "1- Lista de ficheros \n"
                            "2- Lista de directorios \n")
            match optlist:
                case "1":
                    print(filelist)
                case "2":
                    print(dirlist)
                case _:
                    print("Error.")
        case "E":
            print("Saliendo del programa...")
            exit
        case "_":
            print("Opción no válida")
