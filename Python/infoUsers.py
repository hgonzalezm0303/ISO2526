import os
import time

import cpuinfo

uid = os.getuid()
if uid != 0:
    print("No tienes permisos de administrador")
    exit

while True:
    print("Presiona 1 para mostrar información del SSOO y CPU \n"
          "Presiona 2 para comprobación o creación de usuarios \n"
          "Presiona 3 para comprobación o creación de directorios \n"
          "Presiona 4 para salir \n")
    opt = input("Selecciona la opción")

    match opt:
        case "1":
            print("Información del SSOO: \n")
            print("Nombre del sistema:", os.uname().sysname, "\n")
            print("Arquitectura del sistema:", os.uname().machine, "\n")
            print("Nombre del nodo:", os.uname().nodename, "\n")
            time.sleep(1)
            print("Informacion de la CPU: \n")
            print("Nombre de la CPU:", cpuinfo.get_cpu_info()['brand_raw'], "\n")
            print("Arquitectura de la CPU", cpuinfo.get_cpu_info()['arch_string_raw'], "\n")
            time.sleep(2)

        case "2":
            counter = 0
            user = input("Dime un usuario")
            passwd = open("/etc/passwd", "r")
            for i in passwd:
                if user in i:
                    print(f"Informacion de {user}")
                    os.system(f"id {user}")
                    counter = counter + 1
            if counter == 0:
                os.system(f"useradd -m {user}")
                print("Usuario creado.")
            time.sleep(2)

        case "3":
            dire = input("Dime un directorio")
            if os.path.exists(dire):
                print("El directorio existe")
                time.sleep(2)
            else:
                os.mkdir(dire)
                print("Directorio creado.")
                time.sleep(2)

        case "4":
            print("Saliendo del progarama...")
            time.sleep(1)
            exit

        case _:
            print("La opción seleccionada es incorrecta. Vuelva a intentarlo")
            time.sleep(1)