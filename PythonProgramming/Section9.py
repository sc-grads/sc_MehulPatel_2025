#class and objects
# Define a class called Car
class Car:
    # Constructor method to initialize brand and number of wheels
    def __init__(self, brand: str, wheels: int) -> None:
        self.brand = brand       # Brand of the car (e.g., BMW, Volvo)
        self.wheels = wheels     # Number of wheels the car has

    # Method to simulate turning the car on
    def turn_on(self) -> None:
        print(f'Turning on : {self.brand}')

    # Method to simulate turning the car off
    def turn_off(self) -> None:
        print(f'Turning off : {self.brand}')

    # Method to simulate driving the car a certain number of kilometers
    def drive(self, km: float) -> None:
        print(f'Driving: {self.brand} for {km}km')

    # Method to print a description of the car
    def describe(self) -> None:
        print(f'{self.brand} is a car with {self.wheels} wheels')

# Main function to demonstrate usage of the Car class
def main() -> None:
    # Create a Car object for BMW with 4 wheels
    bmw: Car = Car('BMW', 4)
    bmw.turn_on()       # Turn on the BMW
    bmw.drive(10)       # Drive it for 10 kilometers
    bmw.turn_off()      # Turn it off
    bmw.describe()      # Print description

    # Create a Car object for Volvo with 6 wheels
    volvo: Car = Car('Volvo', 6)
    volvo.turn_on()     # Turn on the Volvo
    volvo.drive(30)     # Drive it for 30 kilometers
    volvo.turn_off()    # Turn it off
    volvo.describe()    # Print description

# If this script is being run directly, execute the main function
if __name__ == '__main__':
    main()

#---------------------------------------------------------------------------
#__init__()
class Connection:
    def __init__(self,connection_type:str, cost:float)->None:
        print(f'{connection_type} connection established! (Cost:${cost}/h)' )
        self.connection_type=connection_type
        self.cost=cost

    def close_connection(self)->None:
        print(f'Closing {self.connection_type} connection')

def main() -> None:
    internet:Connection= Connection('Internet',2)
    satellite: Connection = Connection('Satellite',20)
    internet.close_connection()
    satellite.close_connection()

if __name__ == "__main__":

    main()

#---------------------------------------
#self refers to the current instance of the class. Everytime you create a new object, you want all of the data that you
#insert into that class to be asscociated with that instance of the class and not the class it self.
class Fruit:
    def __init__(self, name:str,grams:float)-> None:
        self.name=name
        self.grams=grams

    def eat(self)->None:
        print(f'Eating {self.grams}g of {self.name} ')


def main() -> None:
    apple: Fruit= Fruit('Apple',25) #self insures that Fruit('Apple',25) stays in apple.
    print(apple.name)
    apple.eat()

    banana:Fruit=Fruit('Banana',10)
    print(banana.name)
    banana.eat()
if __name__ == "__main__":

    main()

#-------------------------------------------------------------------------
#Attributes(class and instance)
#Attributes are everything that belongs to the class
class Car:
    SPEED_LIMIT_KM: float=140

    def __init__(self,brand:str)->None:
        self.brand=brand

    def drive(self,*,speed:float)->None:
        if speed > self.SPEED_LIMIT_KM:
            print(f'Limiter activated: Driving at {self.SPEED_LIMIT_KM}km/h')
        else:
            print(f'Driving at {speed}km/h')

def main() -> None:
    toyota: Car= Car('Toyota')
    bmw : Car=Car('BMW')

    toyota.drive(speed=200)
    bmw.drive(speed=200)

    Car.SPEED_LIMIT_KM=170
    toyota.drive(speed=200)
    bmw.drive(speed=200)


if __name__ == "__main__":
    main()

#example

class Animal:
    tricks: list[str]=[]

    def __init__(self,name)->None:
        self.name=name
    def teach_trick(self, trick_name:str)-> None:
        self.tricks.append(trick_name)

def main() -> None:
    cat: Animal = Animal('Helios')
    dog: Animal = Animal('Boomer')

    cat.teach_trick('Wash dishes')
    cat.teach_trick('Get a job')
    print(cat.tricks)

    dog.teach_trick('Do finances')
    dog.teach_trick('Invest in stocks')
    print(dog.tricks)

if __name__ == "__main__":
    main()

#dunder methods- we never call them directly

from typing import Self  # Importing 'Self' to use for type hints (Python 3.11+ feature)


# Define a class called Book
class Book:
    # Constructor: called when a new Book object is created
    def __init__(self, title: str, pages: int) -> None:
        self.title = title  # Store the book's title in the instance
        self.pages = pages  # Store the number of pages in the instance

    # Special method to define behavior when using len() on a Book
    def __len__(self) -> int:
        return self.pages  # Return the number of pages (so len(book) gives page count)

    # Special method to define behavior when using + between two Book objects
    def __add__(self, other: Self) -> Self:
        # Combine the titles of both books with an '&' in between
        combined_title: str = f'{self.title}&{other.title}'
        # Add the number of pages from both books
        combined_pages: int = self.pages + other.pages
        # Return a new Book object with the combined title and total pages
        return Book(combined_title, combined_pages)


# The main function — this is where execution starts if the script is run directly
def main() -> None:
    # Create the first Book object with title 'PyDaily' and 100 pages
    py_daily: Book = Book('PyDaily', 100)

    # Create the second Book object with title 'Harry Potter' and 340 pages
    harry_potter: Book = Book('Harry Potter', 340)

    # Use the + operator to combine the two books into one.
    # This calls the __add__ method: py_daily.__add__(harry_potter)
    combined_books: Book = py_daily + harry_potter

    # Print the length (number of pages) of the first book (calls __len__)
    print(len(py_daily))  # Output: 100

    # Print the length of the second book (calls __len__)
    print(len(harry_potter))  # Output: 340

    # Print the title of the combined book
    print(combined_books.title)  # Output: PyDaily&Harry Potter

    # Print the total number of pages in the combined book
    print(combined_books.pages)  # Output: 440


# This line ensures that main() only runs when the script is executed directly
if __name__ == "__main__":
    main()


#-----------------------------------------------------------
# Demonstrating __str__() and __repr__() in a class
class Person:
    def __init__(self, name: str, age: int):
        # Initialize the Person object with name and age
        self.name = name
        self.age = age

    def __str__(self) -> str:
        # Defines the string representation shown when using print(object)
        # This is meant to be readable for end users
        return f'{self.name}: {self.age} years old'

    def __repr__(self) -> str:
        # Defines the official string representation of the object
        # This is used in debugging and development (e.g., in REPL, lists, or repr())
        return f'Person(name={self.name}: {self.age} years old)'


# Main function where execution starts
def main() -> None:
    # Create a Person object named "Mario" who is 27 years old
    mario: Person = Person('Mario', 27)

    # Print the object — this calls __str__()
    print(mario)  # Output: Mario: 27 years old

    # Print the object using repr() — this calls __repr__()
    print(repr(mario))  # Output: Person(name=Mario: 27 years old)


# Ensure the main() function only runs if the script is executed directly (not imported)
if __name__ == "__main__":
    main()


#-----------------------------------------------
# Dunder Method:__eq__()
from typing import Self

# Car class with dunder method for comparison
class Car:
    # Initializer for the Car class
    def __init__(self, brand: str, car_id: int, colour: str) -> None:
        self.brand = brand  # Assigning to instances
        self.car_id = car_id
        self.color = colour

    # Dunder method for equality comparison
    def __eq__(self, other: Self) -> bool:
        # Comparing all attributes of the car using their dictionaries
        print('Current:', self.__dict__)
        print('Other:', other.__dict__)
        return self.__dict__ == other.__dict__

# Main block to test the Car class
if __name__ == '__main__':
    # Creating two car objects with the same properties
    car1 = Car('BMW', 1, 'Red')
    car2 = Car('BMW', 1, 'Red')

    # Comparing the two cars (should return True)
    print(car1 == car2)  # Output: True because all attributes are identical

    # Creating another car with different properties
    car3 = Car('BMW', 2, 'Blue')

    # Comparing different cars (should return False)
    print(car1 == car3)  # Output: False because car_id and color differ

