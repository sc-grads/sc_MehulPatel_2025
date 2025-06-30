#Doc string
# Define a class named User
class User:
    """Base class for creating users."""  # Class-level docstring describing what the class represents, we added a doc string

    # Constructor method to initialize the User object with a user_id
    def __init__(self, user_id: int) -> None:
        self.user_id = user_id  # Store the user ID

    # Method to display the user ID
    def show_id(self) -> None:
        """Prints the user ID."""  # Method-level docstring
        print(self.user_id)

# Function to check whether a User exists in a given database (set of users)
def user_exists(user: User, database: set[User]) -> bool:
    """
    Checks if a user is inside a database.

    :param user: The user to check for.
    :param database: The database to check inside
    :return: bool — True if user is found, False otherwise
    """
    return user in database  # Use Python's 'in' operator to check presence in set

# Main function (entry point)
def main() -> None:
    # Create two users
    bob: User = User(0)
    anna: User = User(1)

    # Create a database (set) that holds User objects
    database: set[User] = {bob, anna}

    # Check if 'bob' exists in the database and print result
    if user_exists(bob, database):
        print("User exists in the database.")
    else:
        print("No user found.")

    # Print the docstring of the User class
    print(User.__doc__)

    # Print the docstring of the user_exists function
    print(user_exists.__doc__)

# Run the main function if this script is executed directly
if __name__ == '__main__':
    main()


#-----------------------------------------------------------------
# F-STRINGS (Formatted String Literals)


# --------------------
# Debugging with F-Strings
# --------------------

var: int = 10

def add(a: int, b: int) -> int:
    return a + b

# Prints both variable name and value (good for debugging)
print(f'{var=}')  # Output: var=10

# Basic variable printing (only value)
print(f"{var}")  # Output: 10

# Shows the expression and result — useful for debugging
print(f"{add(5, 10) = }")  # Output: add(5, 10) = 15

# --------------------
# Number Formatting
# --------------------

big_number: float = 123456789

# Adds comma as thousands separator
print(f"{big_number:,}")  # Output: 123,456,789

# Adds underscore as separator (useful for readability in code)
print(f"{big_number:_}")  # Output: 123_456_789

# --------------------
# Fraction Formatting
# --------------------

fraction: float = 1234.5678

# Rounds to 2 decimal places
print(f"{fraction:.2f}")  # Output: 1234.57

# Adds commas and rounds to 2 decimal places
print(f"{fraction:,.2f}")  # Output: 1,234.57

# --------------------
# Percentage Formatting
# --------------------

percent: float = 0.5555

# Formats as percentage with 2 decimal places
print(f"{percent:.2%}")  # Output: 55.55%

# --------------------
# Alignment and Padding
# --------------------

var: str = "BOB"

# Left-aligned in a 10-character space
print(f"{var: <10}")  # Output: "BOB       "

# Right-aligned in a 10-character space
print(f"{var: >10}")  # Output: "       BOB"

# Center-aligned in a 10-character space
print(f"{var: ^10}")  # Output: "   BOB    "

# --------------------
# Custom Fill Characters
# --------------------

# Left-aligned with '-' as filler
print(f"{var:-<10}")  # Output: "BOB-------"

# Right-aligned with '*' as filler
print(f"{var:*>10}")  # Output: "*******BOB"

# Center-aligned with '@' as filler
print(f"{var:@^10}")  # Output: "@@@BOB@@@"

# --------------------
# Formatting Numbers in a Loop
# --------------------

numbers = [1, 10, 100, 1000, 10000]

# Right-align each number in a 5-character space, filled with underscores
for num in numbers:
    print(f"{num:_>5}: counting!")
# Output:
# ____1: counting!
# ___10: counting!
# __100: counting!
# _1000: counting!
# 10000: counting!

# --------------------
# Raw Strings with F-Strings (Windows file paths)
# --------------------

# Standard path string with escaped backslashes
path: str = "\\Users\\Username\\Documents\\"
print(path)  # Output: \Users\Username\Documents\

# --------------------
# Combining Raw and F-Strings
# --------------------

user: str = "myusername"

# Using raw+f-string (fr"") to create a safe Windows path
print(fr"C:\Users\{user}\Documents")
# Output: C:\Users\myusername\Documents

# -----------------------------------------------------------------
# ASSERTIONS — Used to catch errors during development (not for production error handling)

# Function to start a program that depends on a non-empty database
def start_program(db: dict[int, str]) -> None:
    # Assertion to ensure the database is not empty before continuing
    assert db, 'Database is empty'  # If db is empty, this line raises an AssertionError
    print('Database loaded:', db)
    print('Program started successfully!')

# Entry point of the script
def main() -> None:
    # Sample database with valid data
    db1: dict[int, str] = {0: 'A', 1: 'B'}
    # This will pass the assertion because db1 is not empty
    start_program(db=db1)  # Output: Program started successfully!

    # Example with an empty dictionary
    db2: dict[int, str] = {}
    # This will fail the assertion and raise AssertionError with the message 'Database is empty'
    start_program(db=db2)

    # Additional assertion example
    var: int = -5
    # Ensure that var is greater than 0, otherwise raise an error with a custom message
    assert var > 0, f'{var} is not greater than zero'

# Ensures the main() function only runs when this script is executed directly
if __name__ == '__main__':
    main()

# --------------------------------------------------------------
# UNPACKING in Python – Assigning multiple values in a single line
# --------------------------------------------------------------

# Assigning two values to two variables using unpacking
a, b = 5, 10
print(f'a: {a}, b: {b}')  # Output: a: 5, b: 10

# Assigning three values at once
a, b, c = 5, 10, 15
print(f'a: {a}, b: {b}, c: {c}')  # Output: a: 5, b: 10, c: 15

# Unpacking characters from a string into variables
x, y = 'AB'
print(f'x: {x}, y: {y}')  # Output: x: A, y: B

# Using * to gather multiple values (everything between 'a' and 'c') into a list
a, *b, c = 'ABCDEF'
print(a, b, c)  # Output: A ['B', 'C', 'D', 'E'] F

# Using _ (underscore) to ignore values we don't need
*_, last = 'ABCDEF'
print(last)  # Output: F

# --------------------------------------------------------------
# Unpacking in Function Arguments
# --------------------------------------------------------------

# A simple function to add two numbers and display result
def add(a: int, b: int) -> None:
    print(f'{a + b= }')  # Shows: a + b = value

# Calling the function with two numbers
add(5, 10)  # Output: a + b= 15

# Creating a dictionary whose keys match the parameter names of the function
numbers: dict[str, int] = {'a': 5, 'b': 10}

# Using ** to unpack dictionary keys and values directly into function parameters
add(**numbers)  # Output: a + b= 15

# --------------------------------------------------------------
# Unpacking with print() – combining * and **
# --------------------------------------------------------------

# Creating a list of numbers
numbers: list[int] = [1, 2, 3, 4, 5]

# Creating a dictionary for print settings
params: dict[str] = {'sep': ' - ', 'end': '.'}

# Using * to unpack the list and ** to apply keyword arguments to print()
print(*numbers, **params)  # Output: 1 - 2 - 3 - 4 - 5.

# -------------------------------------------------------------
# EQUALITY (==) VS IDENTITY (is)
# -------------------------------------------------------------

# Comparing small integers
a: int = 200
b: int = 200

# Equality checks if the values are the same
print(a == b)   # True → Values are equal

# Identity checks if both variables point to the same memory location (object)
print(a is b)   # True → For small integers (usually -5 to 256), Python reuses objects

# -------------------------------------------------------------

# Larger integers may not point to the same object
a: int = 1000
b: int = int('1000')  # Converted from string

# Equality still works (values are the same)
print(a == b)   # True

# Identity may fail (two different objects in memory)
print(a is b)   # False → a and b are two distinct objects

# Showing memory addresses (IDs) of both objects
print(f'{id(a)=}')  # Example: id(a)=139981924168976
print(f'{id(b)=}')  # Example: id(b)=139981924169104

# -------------------------------------------------------------

# Checking for None is best done using `is`
var: int | None = None

if var is None:
    print('There is no var')  # Correct way to check for None
else:
    print(f'The var is {var}')

# -------------------------------------------------------------

# Identity comparison with custom class instances
class Animal:
    pass

cat = Animal()
dog = Animal()

# These are different instances (different memory)
print(cat is dog)  # False

# Same object comparison
print(cat is cat)  # True

# Show unique memory addresses for each object
print(f'ID of cat: {id(cat)}, ID of dog: {id(dog)}')
