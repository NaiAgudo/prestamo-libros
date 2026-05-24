from login.login import login, logout
from database.database_manager import empty_database, load_database, handle_errors
from student.student_manager import show_student_list


def is_operation_confirmed():
    confirmation = ""
    while confirmation != "S" and confirmation != "N":
        confirmation = input("Está usted seguro que quiere vaciar la base de datos? S/N")
    return confirmation == "S"

def show_db_menu():
    option = "0"
    while option != "4":
        option = input("""
                1. Vaciar base de datos
                2. Cargar base de datos
                3. Gestionar errores
                4. Volver a menu principal
                Elige una de estas opciones: \n""")
        if option == "1":
            confirmation_1 = is_operation_confirmed()
            if confirmation_1:
                confirmation_2 = is_operation_confirmed()
                if confirmation_2:
                    empty_database()
        elif option == "2":
            file_path = input("Introduce la ruta del fichero a cargar")
            file = open(file_path)
            load_database(file)

        elif option == "3":
            handle_errors()


def show_manage_students_menu():
    option = "0"
    while option != "2":
        option = input("""
                    1. Listar alumnos
                    2. Volver a menú principal
                    Elige una de estas opciones: \n""")
        if option == "1":
            show_student_list()






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
            show_db_menu()
        elif option == "2":
            show_manage_students_menu()
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





