# MYPY

var: str = 123  # This should be a string, but it's an integer.

#List with wrong type
items: list[str] = ["apple", "banana", True]  # Boolean is not a string.


#---------------------------------------------------------------------------

#WALRUS OPERATOR (:=)

# Function that provides a summary of a list of integers
def description(numbers: list[int]) -> dict:
    # Create a dictionary of statistics about the list using the walrus operator (:=)
    details: dict = {
        'length': (n_len := len(numbers)),            # Assigns and stores the length of the list
        'sum': (n_sum := sum(numbers)),               # Assigns and stores the sum of all numbers in the list
        'mean': n_sum / n_len if n_len > 0 else 0     # Calculates the average only if the list is not empty
    }
    return details

# Main function to run the program
def main() -> None:
    # Sample list of integers
    numbers: list[int] = [1, 10, 5, 200, -4, 7]

    # Call the description function and print the statistics of the list
    print(description(numbers))
    # Output: {'length': 6, 'sum': 219, 'mean': 36.5}

    # Demonstration of the walrus operator used inline
    print(x := 1 > 0)
    # This assigns True to variable x and prints it

# Entry point for the script
if __name__ == '__main__':
    main()

#------------------------------------------------------------------------------
#Lambda Functions


# Defining a lambda function that takes one argument and prints it
p = lambda x: print(x)

# Calling the lambda function with different types of input
p(10)           # Output: 10
p("Hello")      # Output: Hello


# A lambda function that adds two numbers
add = lambda a, b: a + b
print(add(4, 12))  # Output: 16

# -------------------------------
# FUNCTION USING A CALLABLE FUNCTION

from typing import Callable  # For type hinting functions passed as arguments
# A higher-order function that takes another function (f) and a list of integers
def use_all(f: Callable, values: list[int]) -> None:
    for value in values:
        f(value)  # Call the function on each item in the list

# Calling use_all with a lambda that prints "X" multiplied by the value
use_all(lambda value: print(f"{value * 'X'}"), [2, 4, 10])
# Output:
# XX
# XXXX
# XXXXXXXXXX

# -------------------------------
# REGULAR FUNCTION (Same as the lambda above)

# Defining a named function that does the same as the lambda above
def multiply_x(value: int) -> None:
    print(f"{value * 'X'}")

# Reusing the function in use_all
use_all(multiply_x, [2, 4, 10])
# Output (same as above):
# XX
# XXXX
# XXXXXXXXXX

# -------------------------------
# SORTING EXAMPLE USING LAMBDA

# List of names to sort
names: list[str] = ["Bob", "James", "Samantha", "Luigi", "Joe"]

# Sort by length of the name using a lambda as the sort key
sorted_names: list[str] = sorted(names, key=lambda x: len(x))
print(sorted_names)  # Output: ['Bob', 'Joe', 'James', 'Luigi', 'Samantha']

# -------------------------------
# SORTING IGNORING CASE

# New list with mixed-case names
names = ["bob", "James", "samantha", "luigi", "Joe"]

# Sort by length (ignoring case), using x.lower() in the lambda
sorted_names = sorted(names, key=lambda x: len(x.lower()))
print(sorted_names)
# Output: ['bob', 'Joe', 'James', 'luigi', 'samantha']

#-----------------------------------------------------------------------------------
#Generators
from typing import Generator  # Importing Generator type hint from typing module

# Function that yields numbers from 1 to 5
def five_numbers() -> Generator:
    for i in range(1, 6):  # Loop from 1 to 5
        yield i  # Yield each number (pauses the function and saves state)

# Create a generator object from the function
numbers: Generator = five_numbers()

print('Next values from generator:')  # Print header text

print(next(numbers))  # Get the first number from the generator (1)
print(next(numbers))  # Get the second number from the generator (2)
print(next(numbers))  # Get the third number from the generator (3)

# The generator still has remaining values (4 and 5)
print(list(numbers))  # Convert the rest of the generator to a list: [4, 5]

# Generator function for huge range of numbers (up to 100 billion)
def huge_data() -> Generator:
    for i in range(100_000_000_000):  # Loop from 0 to 100 billion
        yield i  # Yield numbers one by one without loading all into memory

# Create the huge generator object
data: Generator = huge_data()

# Print the first 5 values from the generator
for i in range(5):
    print(next(data))  # Output: 0 1 2 3 4

# Generator function to yield vowels one at a time
def generate_vowels() -> Generator[str, None, None]:
    vowels = 'aeiou'  # Define the vowels
    for vowel in vowels:  # Loop over each vowel
        yield vowel  # Yield each vowel character one by one

# Create generator for vowels
vowels = generate_vowels()

# Fetch vowels one at a time using next()
print(next(vowels))  # Output: a
print(next(vowels))  # Output: e
print(next(vowels))  # Output: i

# Use a loop to continue fetching remaining vowels
for vowel in vowels:
    print(vowel)  # Output: o u

# Try fetching again, but generator is now exhausted
try:
    print(next(vowels))  # This will raise StopIteration
except StopIteration:
    print('Generator is empty.')  # Handle the exception gracefully

#-------------------------------------------------------------------------------------------
# #Match-Case- used for pattern matching
# # Example 1:
# status: int = 200  # Define a status code variable
#
# # Use Python's match-case (similar to switch-case) to handle different status codes
# match status:
#     case 200:
#         print("Connected")  # If status is 200, print this
#     case 403:
#         print("Forbidden")  # If status is 403, print this
#     case 404:
#         print("Not Found")  # If status is 404, print this
#     case _:
#         print("Unknown")  # Default case if none of the above match
#
# # -------------------------------
#
# # Example 2: Advanced Pattern Matching with Commands
#
# # This creates an infinite loop to keep asking the user for input
# while True:
#     user_input: str = input("Enter a command: ")  # Get user input as a string
#     command: list[str] = user_input.split()       # Split the string into a list of words
#
#     # Example: input "find image.png" → ['find', 'image.png']
#
#     # Match-case block to handle different command patterns
#     match command:
#
#         # Matches if command starts with 'find' followed by one or more image names
#         case ["find", *images]:
#             print(f"Finding images: {images}")  # Output: list of image names
#
#         # Matches command like "enlarge cat.png 2"
#         case ["enlarge", image, amount]:
#             print(f"You enlarged {image} by {amount}x")
#
#         # Matches "rename" command with old name and new name
#         # The "if" guard checks that the new name has more than 3 characters
#         case ["rename", image, new_name] if len(new_name) > 3:
#             print(f"{image} was renamed to {new_name}")
#
#         # Matches "download" followed by one or more image names
#         case ["download", *images]:
#             print(f"Downloading images: {images}")
#
#         # Matches either "delete" or shorthand "x" followed by image names
#         case ["delete" | "x", *images]:
#             print(f"Deleting images: {images}")
#
#         # Default case if none of the above match
#         case _:
#             print("Command not found.")

#----------------------------------------------------------------------------------------
#Decorators
import time  # Provides time-related functions
from typing import Callable  # For typing the decorator argument and return
from functools import wraps  # To preserve metadata of the original function in decorators


# Decorator function to measure execution time of any function it wraps
def get_time(func: Callable) -> Callable:
    """Times how long it takes to execute a function."""

    @wraps(func)  # Ensures the wrapper function keeps the name and docstring of 'func'
    def wrapper(*args, **kwargs) -> None:
        start_time: float = time.perf_counter()  # Record the high-resolution start time

        func(*args, **kwargs)  # Call the original function with all passed arguments

        end_time: float = time.perf_counter()  # Record the end time after function completes

        # Calculate duration and print formatted to 3 decimal places
        print(f'Time: {end_time - start_time:.3f} s')

    return wrapper  # Return the wrapper function to replace the original


# Function to demonstrate how the decorator works
@get_time  # Apply the timing decorator to 'calculate'
def calculate():
    """Calculates() docstring"""
    print('Calculating...')

    # Simulate a CPU-intensive task by looping 20 million times
    for i in range(20_000_000):
        pass  # Loop does nothing but consumes time

    print("Done")


# Main function that runs the decorated function
def main() -> None:
    calculate()  # This will now be timed due to the decorator


# Standard boilerplate to run main when the script is executed directly
if __name__ == '__main__':
    main()

#----------------------------------------------------------------------------------------------
#Decorators continued
from typing import Callable, Any  # For typing function signatures
from functools import wraps  # To preserve original function metadata (name, docstring)


# Decorator factory: returns a decorator that repeats a function call
def repeat(number: int) -> Callable:
    """Repeat a function call x amount of times."""

    # Actual decorator that wraps the target function
    def decorator(func: Callable) -> Callable:
        @wraps(func)  # Keeps the function's original name and docstring
        def wrapper(*args, **kwargs) -> Any | None:
            value: Any = None  # To store the result of the function
            for _ in range(number):  # Repeat the function 'number' times
                value = func(*args, **kwargs)  # Call the function and capture its return value
            return value  # Return the last returned value (from final call)

        return wrapper  # Return the wrapped function

    return decorator  # Return the actual decorator


# Applying the decorator: this function will be executed twice
@repeat(2)
def add(a: int, b: int) -> int:
    """A function used to add two numbers."""
    print(f'{a+b=}')  # Debug output showing the result of addition
    return a + b  # Return the sum


# Main function to run our example
def main() -> None:
    result: int = add(1, 2)  # Call the decorated function
    print(result)  # Output: 3 (result from final call)

    # Display preserved metadata due to @wraps
    print(add.__name__)  # Output: 'add' — the name of the original function
    print(add.__doc__)  # Output: "A function used to add two numbers."


# Entry point to run the script
if __name__ == '__main__':
    main()

#----------------------------------------------------------------------------
#ENUM
from enum import Enum  # Import Enum base class

# Define an Enum class for device states
class State(Enum):
    OFF = 0  # State when the device is off
    ON = 1   # State when the device is on

# Set the current state of the device
state: State = State.OFF  # Change to State.ON to test the "on" path

# Check the state using conditionals
if state == State.ON:
    print('The device is turned on.')  # This will print if state is ON
elif state == State.OFF:
    print('The device is turned off.')  # This will print if state is OFF
else:
    print('Unknown input...')  # Catch-all if state doesn't match known enums


# ------------------------------------------------------------
# Another Enum: Colour — used to categorize colors
class Colour(Enum):
    RED: str = 'R'     # Red color represented by 'R'
    GREEN: str = 'G'   # Green color represented by 'G'
    BLUE: str = 'B'    # Blue color represented by 'B'

# Create a color variable
red: Colour = Colour.RED

# Access enum attributes
print(red)           # Output: Colour.RED (name and class)
print(red.value)     # Output: R (the string value)
print(red.name)      # Output: RED (the name of the enum member)
print(Colour('R'))   # Output: Colour.RED (lookup by value)


# ------------------------------------------------------------
# Function that uses Colour enum to describe a car purchase
def buy_car(brand: str, colour: Colour) -> None:
    """
    Simulates buying a car with a specified brand and colour.
    Uses the Colour enum to determine the message to display.
    """
    if colour == Colour.RED:
        print(f'You bought a smoking hot red {brand}.')
    elif colour == Colour.GREEN:
        print(f'You bought an eco-friendly green {brand}.')
    elif colour == Colour.BLUE:
        print(f'You bought a cool blue {brand}.')
    else:
        print('Unknown color.')  # Catch-all fallback


# ------------------------------------------------------------
# Main function to demonstrate enum usage in a real-world context
def main() -> None:
    buy_car('BMW', Colour.BLUE)      # You bought a cool blue BMW.
    buy_car('Volvo', Colour.RED)     # You bought a smoking hot red Volvo.
    buy_car('Toyota', Colour.GREEN)  # You bought an eco-friendly green Toyota.

# Run main function only if the script is executed directly
if __name__ == '__main__':
    main()
