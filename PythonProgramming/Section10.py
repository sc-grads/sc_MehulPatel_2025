#inheritance
# Base class: Animal
class Animal:
    # Constructor for Animal. Takes a name and assigns it to the object.
    def __init__(self, name: str) -> None:
        self.name = name  # Store the name in the instance

    # Method to simulate the animal drinking
    def drink(self) -> None:
        print(f'{self.name} is drinking.')  # Print message using the stored name

    # Method to simulate the animal eating
    def eat(self) -> None:
        print(f'{self.name} is eating.')  # Print message using the stored name

# Derived class: Dog (inherits from Animal)
class Dog(Animal):
    # Constructor for Dog, reuses Animal's constructor via super()
    def __init__(self, name: str) -> None:
        super().__init__(name)  # Call the parent class (Animal) constructor, the super refers to the parent class

    # Method unique to Dog
    def bark(self) -> None:
        print(f'{self.name} bark bark!')  # Print a dog barking message

    # Routine method that calls several actions in sequence
    def routine(self) -> None:
        self.eat()    # Dog eats
        self.bark()   # Dog barks
        self.drink()  # Dog drinks

# Derived class: Cat (inherits from Animal)
class Cat(Animal):
    # Constructor for Cat, reuses Animal's constructor
    def __init__(self, name: str) -> None:
        super().__init__(name)  # Call the parent class (Animal) constructor

    # Method unique to Cat
    def meow(self) -> None:
        print(f'{self.name} meow meow!')  # Print a cat meowing message

# Main function that will run when the script is executed
def main() -> None:
    # Create a Dog object with the name "Buddy"
    dog: Dog = Dog('Buddy')

    # Create a Cat object with the name "Snowball"
    cat: Cat = Cat('Snowball')

    # Call Dog's bark method (specific to Dog)
    dog.bark()       # Output: Buddy bark bark!
    # Call Cat's meow method (specific to Cat)
    cat.meow()       # Output: Snowball meow meow!

    # Call shared eat() method from Animal class
    dog.eat()        # Output: Buddy is eating.
    cat.eat()        # Output: Snowball is eating.

# This block ensures main() runs only if this file is executed directly
if __name__ == '__main__':
    main()
#----------------------------------------------------------
# super()

# Importing 'override' decorator for clarity (only available in Python 3.12+ or with a typing extension)
from typing import override

# Base class: Shape
class Shape:
    def __init__(self, name: str, sides: int) -> None:
        # Set name and number of sides for any shape
        self.name = name
        self.sides = sides

    def describe(self) -> None:
        # Print a simple description of the shape
        print(f'{self.name} ({self.sides} sides)')

    def shape_method(self) -> None:
        # A method to demonstrate inheritance (can be used by all child classes)
        print(f'{self.name}: shape_method')

# Child class: Square inherits from Shape
class Square(Shape):
    def __init__(self, size: float) -> None:
        # Call the constructor of the parent class (Shape) using super()
        # Passing "Square" as the name and 4 as the number of sides
        super().__init__('Square', 4)
        # Store the size of the square (side length)
        self.size = size

    @override  # Optional: clearly indicates we are overriding a method from the parent class
    def describe(self) -> None:
        # Provide a custom description specific to squares
        print(f'I am a {self.name} with a size of {self.size}')

# Child class: Rectangle inherits from Shape
class Rectangle(Shape):
    def __init__(self, length: float, height: float):
        # Call the parent constructor with name 'Rectangle' and 4 sides
        super().__init__('Rectangle', 4)
        # Store rectangle-specific attributes
        self.length = length
        self.height = height

    @override
    def describe(self) -> None:
        # Provide a custom description for rectangles
        print(f'I am a {self.name} ({self.height} x {self.length})')

# Main function where the program runs
def main() -> None:
    # Create a Rectangle object with height=10 and length=15
    rectangle: Rectangle = Rectangle(10, 15)

    # Call the describe() method — this runs the version defined in the Rectangle class
    rectangle.describe()  # Output: I am a Rectangle (10 x 15)

    # Call a method inherited from the Shape class
    rectangle.shape_method()  # Output: Rectangle: shape_method

# This ensures the main() function runs only if the script is executed directly (not imported)
if __name__ == '__main__':
    main()

#------------------------------------------------------------------
#Static Method (@staticmethod)

class Calculator:
    # Constructor to initialize the Calculator with a version number
    def __init__(self, version: int) -> None:
        self.version = version  # Store version in the instance

    @staticmethod
    # Static method: can be used without creating a Calculator object
    def add(*numbers: float) -> float:
        # Accepts any number of float values and returns their sum
        return sum(numbers)

    # Instance method: requires a Calculator object to be called
    def get_version(self) -> int:
        return self.version  # Return the version number

# Main function — program starts here
def main() -> None:
    # Use the static add method without creating an object
    result: float = Calculator.add(1, 2, 3, 4)

    # Print the result of the addition
    print(result)  # Output: 10

# Run the main function if the file is executed directly
if __name__ == '__main__':
    main()

#------------------------------------------------------------------
#CLASS METHOD (@classmethod)

from typing import Self  # For typing the factory method return type

class Car:
    # Class variable shared by all Car instances
    LIMITER: int = 200 # we do not want our cars to go faster than this

    # Constructor: initialize each Car with brand and max_speed
    def __init__(self, brand: str, max_speed: int) -> None:
        self.brand = brand
        self.max_speed = max_speed

    # Class method to change the speed limiter for all cars
    @classmethod
    def change_limit(cls, new_limit: int) -> None:
        cls.LIMITER = new_limit  # Update class-level limiter

    # Factory method: creates a Car with max_speed based on the brand
    @classmethod
    def autogenerate_max_speed(cls, brand: str) -> Self:
        lowered: str = brand.lower()   # Normalize brand name
        max_speed: int = 200           # Default max speed

        # Set max_speed depending on brand
        if lowered == 'toyota':
            max_speed = 270
        elif lowered == 'bmw':
            max_speed = 290
        elif lowered == 'volvo':
            max_speed = 300

        # Return new Car instance with brand and max_speed
        return cls(brand, max_speed)

    # Instance method to display information about the car
    def display_info(self) -> None:
        print(f'{self.brand} (max={self.max_speed}, limiter={self.LIMITER})')

def main() -> None:
    # Create cars using the factory method
    volvo: Car = Car.autogenerate_max_speed('Volvo')
    toyota: Car = Car.autogenerate_max_speed('Toyota')
    bmw: Car = Car.autogenerate_max_speed('BMW')

    # Display info before changing limiter
    volvo.display_info()   # Output: Volvo (max=300, limiter=200)
    toyota.display_info()  # Output: Toyota (max=270, limiter=200)
    bmw.display_info()     # Output: BMW (max=290, limiter=200)

    # Change the speed limiter for all cars
    Car.change_limit(150)

    # Display info after changing limiter (all instances reflect new limiter)
    volvo.display_info()   # Output: Volvo (max=300, limiter=150)
    toyota.display_info()  # Output: Toyota (max=270, limiter=150)
    bmw.display_info()     # Output: BMW (max=290, limiter=150)

if __name__ == '__main__':
    main()

#ABSTRACT METHOD (abstractmethod)

#---------------
from abc import ABC, abstractmethod

# -----------------------------
# ABSTRACT BASE CLASS: Appliance
# -----------------------------
# Importing required tools to create abstract base classes
from abc import ABC, abstractmethod

# ---------------------------------------------
# ABSTRACT BASE CLASS: Appliance
# This acts like a blueprint for all appliances
# It defines what methods must exist in any subclass
# ---------------------------------------------
class Appliance(ABC):
    # Constructor that sets brand name, version number, and power state
    def __init__(self, brand: str, version_no: int) -> None:
        self.brand = brand                  # e.g., 'Z-Lite', 'Bosch'
        self.version_no = version_no        # version of the appliance
        self.is_turned_on: bool = False     # power state (off by default)

    # Abstract method that subclasses must implement to turn the appliance on
    @abstractmethod
    def turn_on(self) -> None:
        ...

    # Abstract method that subclasses must implement to turn the appliance off
    @abstractmethod
    def turn_off(self) -> None:
        ...

# ---------------------------------------------
# CONCRETE CLASS: Lamp
# Implements the abstract methods from Appliance
# ---------------------------------------------
class Lamp(Appliance):
    def __init__(self, brand: str, version_no: int) -> None:
        # Call the parent class constructor to initialize shared values
        super().__init__(brand, version_no)

    def turn_on(self) -> None:
        # Check if lamp is already on
        if self.is_turned_on:
            print(f'{self.brand} is already turned on!')
        else:
            self.is_turned_on = True
            print(f'{self.brand} is now turned on!')

    def turn_off(self) -> None:
        # Check if lamp is already off
        if self.is_turned_on:
            self.is_turned_on = False
            print(f'{self.brand} is now turned off!')
        else:
            print(f'{self.brand} is already turned off!')

# ---------------------------------------------
# CONCRETE CLASS: Oven
# Another child of Appliance, with its own behavior
# ---------------------------------------------
class Oven(Appliance):
    def __init__(self, brand: str, version_no: int) -> None:
        super().__init__(brand, version_no)  # Initialize inherited values

    def turn_on(self) -> None:
        if self.is_turned_on:
            print(f'{self.brand} oven is already turned on!')
        else:
            self.is_turned_on = True
            print(f'{self.brand} oven is now heating up!')

    def turn_off(self) -> None:
        if self.is_turned_on:
            self.is_turned_on = False
            print(f'{self.brand} oven is now cooling down!')
        else:
            print(f'{self.brand} oven is already off!')

# ---------------------------------------------
# MAIN FUNCTION
# This is where the program starts when run
# ---------------------------------------------
def main() -> None:
    print("----- Lamp Test -----")
    lamp: Lamp = Lamp('Z-Lite', 1)   # Create a Lamp instance
    lamp.turn_on()                   # Should turn on the lamp
    lamp.turn_on()                   # Should print already on
    lamp.turn_off()                  # Should turn off the lamp
    lamp.turn_off()                  # Should print already off
    lamp.turn_on()                   # Turn it back on
    lamp.turn_off()                  # Turn it off again

    print("\n----- Oven Test -----")
    oven: Oven = Oven('Bosch', 2)    # Create an Oven instance
    oven.turn_on()                   # Should heat up the oven
    oven.turn_on()                   # Already on
    oven.turn_off()                  # Should cool down the oven
    oven.turn_off()                  # Already off

# ---------------------------------------------
# ENTRY POINT
# This ensures main() runs only when script is executed directly
# ---------------------------------------------
if __name__ == '__main__':
    main()

#------------------------------------------------------------------
# NAME MANGLING

# Define a class called Car
class Car:
    # Class-level constant (name mangled with double underscores)
    # Makes it hard to access outside the class or subclasses
    __YEAR: int = 2000

    # Constructor to initialize brand and fuel type
    def __init__(self, brand: str, fuel_type: str) -> None:
        # Double underscore makes this attribute "private" via name mangling
        self.__brand = brand               # e.g., 'Toyota'
        self.__fuel_type = fuel_type       # e.g., 'Electric'

        # This is a manually name-mangled variable (how Python stores __var internally)
        # Not a recommended way to define a variable — for illustration only
        self._Car__var: str = "red"

    # Public method to simulate driving
    def drive(self) -> None:
        # Accessing the name-mangled (private) brand attribute
        print(f"Driving {self.__brand}.")

    # Private method (name mangled using double underscores)
    # Only meant to be used inside the class
    def __get_description(self) -> None:
        print(f"{self.__brand}: {self.__fuel_type}")

    # Public method that tries to display the car's color using the name-mangled variable
    def display_color(self) -> None:
        # This will raise an error unless __var is defined
        # The correct access should be self._Car__var, not self.__var
        print(f"{self.__brand} is {self.__var.capitalize()}.")


# Subclass of Car named Toyota
class Toyota(Car):
    def __init__(self, brand: str, fuel_type: str) -> None:
        # Always call the parent constructor first using super()
        super().__init__('Toyota', fuel_type)
        # This is a new attribute specific to Toyota instances
        self.var = 100  # Not mangled — it's a regular public attribute


# Entry point of the script
if __name__ == '__main__':
    # Create a Car object with brand "Toyota" and fuel type "Electric"
    car: Car = Car("Toyota", "Electric")

    # Call the public method drive()
    car.drive()  # Output: Driving Toyota.

    # Access and call the private method using its mangled name
    # This is legal but not recommended unless necessary
    car._Car__get_description()  # Output: Toyota: Electric

    # Access and print the private brand attribute using the mangled name
    print(car._Car__brand)  # Output: Toyota
