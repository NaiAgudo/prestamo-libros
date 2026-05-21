from login.login import login, logout

def show_general_menu():
    logged = True
    while logged:
        option = input("""
        1. Gestionar base de datos
        2. Gestionar alumnos
        3. Gestionar prestamos
        4. Gestionar listados
        5. Preservar datos
        6. Logout
        elige una de estas opciones: \n""")

        if option == "1":
            print("Gestionar base de datos")
        elif option == "2":
            print("Gestionar alumnos")
        elif option == "3":
            print("Gestionar prestamos")
        elif option == "4":
            print("Gestionar listados")
        elif option == "5":
            print("Preservar datos")
        elif option == "6":
            print("Saliendo...")
            logged = not logout()
        else:
            print("Porfavor selecciona una de las opciones disponibles: ")


logged = False
while not logged:
    user = input("Porfavor, introduce tu usuario:  \n")
    password = input("Porfavor, introduce tu contraseña: \n")

    logged = login(user, password)
print("Bienvenido al sistema de préstamo de libros")
show_general_menu()





