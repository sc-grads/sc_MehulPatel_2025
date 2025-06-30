
# CALLABLE (callable())
# It allows us to check whether an object is callable or not.

# ------------------------------
# CALLABLE (callable())
# ------------------------------
# callable() checks if an object can be "called" — meaning, can you put () after it?

# A string variable (not callable)
fruit: str = 'apple'

# An integer variable (also not callable)
number: int = 10

def func() -> None:
    print('func() was called!')

# Strings are NOT callable
print(f'callable(): {callable(fruit)}')


# Integers are NOT callable
print(f'callable(): {callable(number)}')


# Functions ARE callable — you can do func()
print(f'callable(): {callable(func)}')

# ------------------------------
# Built-in callable types
# ------------------------------

# range is a built-in callable function (e.g., range(5))
print(f'callable(): {callable(range)}')


# str is also a callable function that creates a string (e.g., str(123))
print(f'callable(): {callable(str)}')


# ------------------------------
# Using callable in a conditional statement
# ------------------------------
# This checks if func is callable before calling it
if callable(func):
    func()  # If it's callable, execute it
else:
    print('The object is not callable.')


#-----------------------------------------------------------------
# FILTER (filter())

# ---------------------------------------------
# Working with filter(), lambda functions, and list comprehensions
# ---------------------------------------------

# Creating a list of numbers from 1 to 20
numbers: list[int] = list(range(1, 21))
print(numbers)
# Output: [1, 2, 3, ..., 20]

# ---------------------------------------------
# 1. Using filter() with a named function
# ---------------------------------------------

# Define a function that checks if a number is even
def is_even(number: int) -> bool:
    return number % 2 == 0  # Returns True for even numbers, False otherwise

# Apply the filter to extract even numbers using the named function `is_even`
even_numbers: filter = filter(is_even, numbers)

# Convert the filtered result to a list and print
print(list(even_numbers))
# Output: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

# Note: printing the filter object directly doesn't show the contents (just its memory reference)
print(f'Even numbers (named function): {even_numbers}')
# Output: Even numbers (named function): <filter object at ...>

# ---------------------------------------------
# 2. Using filter() with a lambda function
# ---------------------------------------------


numbers: list[int] = list(range(1, 21))
print(numbers)

# Use filter with a lambda function (inline, no need to define a separate function)
# Lambda takes each number `n` and checks if it is divisible by 2 (even)
even_numbers: filter = filter(lambda n: n % 2 == 0, numbers)

# Convert to list and print
print(list(even_numbers))
# Output: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

# ---------------------------------------------
# 3. Another example: Using filter() with strings
# ---------------------------------------------

# Define a list of names (strings)
people: list[str] = ['Anna', 'Bob', 'Betty', 'James', 'John']

# Use filter with a lambda to keep names with more than 4 characters
# lambda takes each name and checks if len(name) > 4
long_names: filter = filter(lambda name: len(name) > 4, people)

# Convert to list and print
print(list(long_names))

# ---------------------------------------------
# 4. Same logic using a list comprehension (more readable for many people)
# ---------------------------------------------

# List comprehension version of the same filtering logic
ln: list[str] = [name for name in people if len(name) > 4]

# Print the result
print(ln)
# Output: ['Betty', 'James']

# MAP (map())

# -----------------------------------
# 1. Basic Example: Doubling values using map()
# -----------------------------------
# List of integers to be doubled
numbers: list[int] = [1, 2, 3, 4, 5]

# A regular function to double a number
def double(number: int) -> int:
    return number * 2

# Using map with a named function
doubled: map = map(double, numbers)

# map returns a map object (like an iterator), not a list directly
print(doubled)  # Output: <map object at ...>

# Convert the map object to a list to view the doubled numbers
print(list(doubled))  # Output: [2, 4, 6, 8, 10]


# -----------------------------------
# 2. Using map with a lambda function (shortcut)
# -----------------------------------

# This does the same as above, but uses a lambda (no need to define double())
doubled: map = map(lambda n: n * 2, numbers)
print(doubled)  # Output: <map object at ...>
print(list(doubled))  # Output: [2, 4, 6, 8, 10]


# -----------------------------------
# 3. Modern Alternative: List comprehension
# -----------------------------------

# Using list comprehension is often more readable and Pythonic
doubled: list[int] = [double(n) for n in numbers]  # or simply [n * 2 for n in numbers]
print(doubled)  # Output: [2, 4, 6, 8, 10]


# -----------------------------------
# 4. Advanced Example: Combining two lists using map()
# -----------------------------------

# Two lists of different types
numbers: list[int] = [1, 2, 3, 4, 5]
letters: list[str] = ['A', 'B', 'C']

# Define a function to combine a number and a letter into a tuple
def combine_elements(numbers: int, letters: str) -> tuple[int, str]:
    return numbers, letters

# Use map to combine elements from the two lists
combined: map = map(combine_elements, numbers, letters)
print(list(combined))  # Output: [(1, 'A'), (2, 'B'), (3, 'C')], it stops once we run out of elements in the shorter list

# Same logic using a lambda function instead of a named function
combined: map = map(lambda numbers, letters: (numbers, letters), numbers, letters)
print(list(combined))  # Output: [(1, 'A'), (2, 'B'), (3, 'C')]

#-----------------------------------------------------------------
# SORTED (sorted())
# -----------------------------------------------
# Using the sorted() function in Python
# -----------------------------------------------

# 1. Sorting a list of integers
numbers: list[int] = [1, 10, 5, 3]

# sorted() returns a new list with elements sorted in ascending order
sorted_numbers: list[int] = sorted(numbers)
print(sorted_numbers)  # Output: [1, 3, 5, 10]


# 2. Sorting a list of strings alphabetically
people: list[str] = ['Anna', 'Mario', 'James', 'Tom']

# Alphabetical sort (A-Z), they are sorted by the ASCII values
sorted_names: list[str] = sorted(people)
print(sorted_names)  # Output: ['Anna', 'James', 'Mario', 'Tom']


# 3. Sorting strings in reverse (Z-A)
sorted_names_reverse: list[str] = sorted(people, reverse=True)
print(sorted_names_reverse)  # Output: ['Tom', 'Mario', 'James', 'Anna']


# 4. Sorting by string length using the 'key' argument
# Here, we sort names based on how many characters they have
sorted_by_length: list[str] = sorted(people, key=lambda x: len(x))
print(sorted_by_length)  # Output: ['Tom', 'Anna', 'Mario', 'James']


# -----------------------------------------------
# Sorting with a custom class
# -----------------------------------------------

# Define a class called Animal
class Animal:
    def __init__(self, name: str, weight: int):
        self.name = name           # Animal's name (e.g., 'Dog')
        self.weight = weight       # Animal's weight (e.g., 10)

    # __repr__ is used to define what the object looks like when printed
    def __repr__(self):
        return f'{self.name} ({self.weight}kg)'

# Create three Animal objects
cat = Animal('Cat', 10)
dog = Animal('Dog', 5)
kangaroo = Animal('Kangaroo', 30)

# Store all animals in a list
animals = [cat, dog, kangaroo]

# Sort animals based on their weight using a lambda function
# 'key=lambda animal: animal.weight' means we sort by the weight attribute
sorted_animals = sorted(animals, key=lambda animal: animal.weight)

# Print the sorted list of animals by weight
print(sorted_animals)  # Output: [Dog (5kg), Cat (10kg), Kangaroo (30kg)]

# ----------------------------------------------------------------------------------------
# EVAL (eval())
# ----------------------------------------------------------------------------------------
# eval() is a built-in Python function that takes a string and evaluates it as a Python expression.
# It's powerful but should be used carefully due to potential security risks.

# Declare two integer variables
x: int = 5
y: int = 10

# Using eval to evaluate a basic arithmetic expression from a string
# '1 + 10 + 100' is a string, but eval evaluates it as if you wrote: 1 + 10 + 100
result: int = eval('1 + 10 + 100')  # Evaluates to 111
print(result)  # Output: 111

# Using eval with variables that exist in the current scope
# It will evaluate 'x + y' using the values of x (5) and y (10) from above
result_vars: int = eval('x + y')  # Evaluates to 15
print(result_vars)  # Output: 15

# Creating a simple calculator that evaluates user-entered expressions
while True:
    user_input: str = input("Enter math: ")  # Example: "10 + 10" or "5 * 4"

    # eval will process the string and return the result of the expression
    print(eval(user_input))  # Output depends on what the user types (e.g., 20 for "10 + 10")

# ----------------------------------------------------------------------------------------
# ⚠️ SECURITY WARNING ⚠️
# Never use eval() with untrusted input (like user input in real applications)
# because it can execute arbitrary code, which may be dangerous!
# Example: eval("__import__('os').system('rm -rf /')") would be catastrophic on Unix systems.
# In real-world applications, prefer safer alternatives like `ast.literal_eval()` for evaluating simple literals.
# ----------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------
# EXEC (exec())
# ----------------------------------------------------------------------------------------
# The exec() function allows execution of dynamically created Python code.
# It can run entire blocks of code (including variable assignments, loops, function definitions, etc.)

# A multiline string containing Python code
code = '''
x = 5                # Declare a variable x and assign it value 5
y = 10               # Declare a variable y and assign it value 10
z = x + y            # Add x and y and store the result in z
print('Hello World!')  # Print a greeting

# A simple for loop that prints numbers from 0 to 2
for i in range(3):
    print(i)
'''

# Execute the string as Python code using exec()
exec(code)  # This runs the entire block as if it were written directly in the script

# ----------------------------------------------------------------------------------------
# Example 2: Interactive command execution using exec
# ----------------------------------------------------------------------------------------

# Infinite loop to accept user commands
while True:
    user_input: str = input(" Command: ")  # Get command input from the user (e.g., print("Hello"))
    exec(user_input)  # Execute the entered string as Python code

# ----------------------------------------------------------------------------------------
# ⚠️ SECURITY WARNING ⚠️
# Like eval(), exec() can be very dangerous if used with untrusted input.
# For example: exec("import os; os.remove('important_file.txt')") will run and delete a file.
# Only use exec() in controlled environments where the input is safe.
# Avoid in production or with any user-facing input unless heavily sandboxed.
# ----------------------------------------------------------------------------------------

# ZIP FUNCTION (zip()) — Combines elements from multiple iterables (like lists) into tuples

# Creating three lists of different types and lengths
numbers: list[int] = [1, 2, 3, 4]       # List of integers
letters: list[str] = ['A', 'B', 'C', 'D']  # List of letters
symbols: list[str] = ['!', '@', '#']      # List of symbols (shorter list)

# Using zip to combine numbers and letters into pairs (tuples)
zipped: zip = zip(numbers, letters)     # Creates a zip object
print(zipped)                           # Output: <zip object at ...> (just shows object info)
print(list(zipped))                     # Output: [(1, 'A'), (2, 'B'), (3, 'C'), (4, 'D')]

# zip() objects are iterators and are exhausted after use, so we create it again for looping
zipped = zip(numbers, letters)

# Using a for-loop to iterate through the zipped pairs
for n, l in zipped:
    print(n, l, sep=': ')               # Output: 1: A, 2: B, 3: C, 4: D

# Using zip with two lists of different lengths (symbols has only 3 items)
zipped_symbols = zip(numbers, symbols)
print(list(zipped_symbols))             # Output: [(1, '!'), (2, '@'), (3, '#')]
# zip stops at the shortest iterable

# Using zip with strict mode (Python 3.10+)
# Raises ValueError if the iterables are not of the same length
zipped_strict = zip(numbers, symbols, strict=True)
print(list(zipped_strict))              # Output: [(1, '!'), (2, '@'), (3, '#')]

# Combining all three lists into a single zip object
zipped_all: zip = zip(numbers, symbols, letters)
print(list(zipped_all))                 # Output: [(1, '!', 'A'), (2, '@', 'B'), (3, '#', 'C')]
