from student.student import Student

students_test_data = [
    Student("12345678A", "Naiara", "Agudo Mendieta", "II", True),
    Student("87654321B", "Paco", "Lopez Soria", "0", False),
    Student("11223344C", "Marta", "Rodriguez Heras", "I", True)
]

def show_student_list():
    count = 1
    for student in students_test_data:
        print(f"{count}. {student.nombre} {student.apellidos}")
        count += 1
    option = input("Selecciona el numero del alumno que quieres visualizar, o un 0 si quieres volver \n")
    while option != "0":
        if int(option) < 0 or int(option) > len(students_test_data):
            option = input(f"Porfavor, selecciona un número entre 1 y {len(students_test_data)}")
        else:
            show_student(students_test_data[int(option)-1])
            return


def show_student(student):
    print(f"nie: {student.nie} \n "
          f"nombre: {student.nombre} \n"
          f"apellidos: {student.apellidos} \n"
          f"tramo: {student.tramo} \n"
          f"bilingue: {"Si" if student.bilingue else "No"} \n")
    option = ""
    while option != "S" and option != "N":
        option = input("¿Quieres modificar los datos? S/N")
    if option == "S":
        modify_option = ""
        while modify_option != "6":
            modify_option = input("¿Que datos quieres modificar? \n" 
              "1.Nie \n" 
              "2.Nombre \n"
              "3.Apellidos \n"
              "4.Tramo \n"
              "5.Bilingue \n"
              "6.Guardar y salir \n")
            if modify_option == "1":
                student.nie = input("Introduce el nie nuevo que quieres guardar \n")

            elif modify_option == "2":
                student.nombre = input("Introduce el nombre nuevo que quieres guardar \n")

            elif modify_option == "3":
                student.apellidos = input("Introduce el/los apellidos nuevos que quieres guardar \n")

            elif modify_option == "4":
                student.tramo = input("Introduce el tramo que quieres guardar \n")

            elif modify_option == "5":
                bilingue = ""
                while bilingue != "S" or bilingue != "N":
                    bilingue = input("Introduce si es bilingue o no para volver a guardar \n")
                student.bilingue = True if bilingue == "S" else False







