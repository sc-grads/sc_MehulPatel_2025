student = {"name": "Rolf", "grades": (89, 90, 93, 78, 90)}


def average(sequence):
    return sum(sequence) / len(sequence)


# ave = average(student["grades"])
# print(ave)
print(average(student["grades"]))

# But wouldn't it be nice if we could...
# print(student.average()) ?


class Student:
    def __init__(self):
        self.name = "Rolf"
        self.grades = (89, 90, 93, 78, 90)

    def average(self):
        return sum(self.grades) / len(self.grades)


student = (
    Student()
)  # Creating a thing from a class. We telling it to use the class to create an object.
# it behaves like what this class defines. It creates a new empty container and it runs the init method.
print(student.average())

# Identical to Student.average(student)


# -- Parameters in __init__ --


class Student:
    def __init__(
        self, name, grades
    ):  # this is a constructor which is called when we create a new object
        self.name = name
        self.grades = grades

    def average(self):
        return sum(self.grades) / len(self.grades)


student = Student("Bob", (36, 67, 90, 100, 100))
print(student.average())

# -- Remember *args ? --


class Student:
    def __init__(self, name, *grades):
        self.name = name
        self.grades = grades

    def average(self):
        return sum(self.grades) / len(self.grades)


student = Student("Bob", 36, 67, 90, 100, 100)
print(student.average())
