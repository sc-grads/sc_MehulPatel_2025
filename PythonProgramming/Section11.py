# PRINT (print())

# Print a simple string
print('Hello, Bob')

print(1, 2, True, ['a', 'b'])

print('A', 'B', 'C', sep='-')  # Output: A-B-C

print('A', 'B', 'C', sep=' . ')  # Output: A . B . C

print('Hello', end='!!!\n')  # Output: Hello!!!

# Remove newline with 'end'
print('Hello', end='')
print('Bob')  # Output: HelloBob

# Use 'sep' and 'end' together
print('A', 'B', 'C', sep=', ', end='.')  # Output: A, B, C.

# Unpack list elements with * (each element separately)
people = ['Alice', 'Bob', 'Charlie']

# Print list as a single element
print(people)

# Print list elements separately
print(*people, sep=', ', end='.')  # Output: Alice, Bob, Charlie.


#-----------------------------------------------------------------
# ENUMERATE (enumerate())
elements: list[str] = ['A', 'B', 'C']

for i, element in enumerate(elements, start=1):
    print(f'{i}: {element}')


#-----------------------------------------------------------------
# ROUND (round())


#List of float values
a: float = 200.3123399
b: float = 18.12132
c: float = 47.12312

# Adding the float values
result: float = a + b + c
print(result)

# Rounding to 1 decimal place
print(round(result, 1))  # Output: 265.6

# Rounding to 0 decimal places (nearest whole number)
print(round(result, 0))  # Output: 266.0

# Rounding with negative values (rounding whole numbers)
print(round(result, -1))  # Output: 270.0, this rounds it to the nearest 10th
print(round(result, -2))  # Output: 300.0, this rounds it to the nearest 100th

#-----------------------------------------------------------------
# RANGE (range())

# Creating a range from 1 to 5
my_range: range= range(1, 6)
print(my_range)

# Converting range to a list
print(list(my_range))

# Creating a range from 1 to 100
my_range = range(1, 101)
print(my_range)
print(list(my_range))

# Creating a range without specifying a start value (starts at 0)
my_range = range(5)
print(list(my_range))  # Output: [0, 1, 2, 3, 4]

# Creating a range with a step value
my_range = range(0, 10, 2)
print(list(my_range))

# Creating a range that counts down
my_range = range(0, -5, -1)
print(list(my_range))  # Output: [0, -1, -2, -3, -4]

# Using range in a for loop
for i in range(3):
    print(i)  # Output: 0, 1, 2


#-----------------------------------------------------------------
# SLICE (slice())

text: str = 'Hello World'

# get the first three characters
first_three: slice = slice(0, 3)
print(text[first_three])  # Output: Hel

# writing the text from right  to left
reverse_slice: slice = slice(None, None, -1) #same as []::-1]
print(text[reverse_slice])  # Output: dlroW olleH

# removing every second character
step_two: slice = slice(None, None, 2)
print(text[step_two])  # Output: HloWrd: Every second character


second_text: str = 'Python Programming'
print('second_text'[first_three])
print('second_text'[reverse_slice])
print('second_text'[step_two])

#-----------------------------------------------------------------

# ALL (all())

wifi_enabled: bool = True
has_electricity: bool =True
has_subscription: bool =True

if wifi_enabled and has_subscription and has_electricity:
    print('Connected to the internet')


# using the built in python code to do this
requirements: list[bool] = [wifi_enabled,has_electricity, has_subscription]
if all(requirements):
     print('Connected to the internet')


# Voting example
people_voted = [1, 1, 0, 1]  # 1 = voted, 0 = not voted

# Function to check voting status

if all(people_voted):
     print('Everyone voted')
else:
    print('Some people did not vote')

#---------------------------------------------------
# ANY (any())
#Checks that at least one element in a list is true for it to pass the check

people_voted = [0, 1, 0, 0, 0]  # 1 = voted, 0 = not voted

# Check if at least one person voted
if any(people_voted): #or write list here : if any([1,1,1,1])
    print('At least one person voted')
else:
     print('No one voted')

#---------------------------------------------------
# IS INSTANCE ( isinstance())
#Used specifically to check data types
#Checks if object is an instance of another object or sub-class of another object.

num: int = 42
pi: float = 3.14
text: str = 'Hello World'
my_list: list[int] = [1, 2, 3]

print(isinstance(num, int))
print(isinstance(num, str))
print(isinstance(num, float))

print(isinstance(pi, float))
print(isinstance(pi, int))

# Union to check if pi is integer or float
print(isinstance(pi, int | float))

print(isinstance(text, str))

print(isinstance(my_list, list))
print(isinstance(my_list, tuple))
#-------------

class Animal:
     pass

class Cat(Animal):
     pass


print(isinstance(Cat(), Animal))  
print(isinstance(Animal(), Cat))