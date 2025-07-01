#Introduction
from typing import TextIO  # Import TextIO type hint for file objects

# Define the path to the file
file_path: str = 'info.txt'

# -------------------------------------------------------------
# Step 1: Create a new text file and write some content to it
# -------------------------------------------------------------
with open(file_path, 'w') as f:  # Open the file in write mode ('w')
    f.write('This is some info.\nHi Bob.')  # Write two lines of text

# -------------------------------------------------------------
# Step 2: Traditional way of reading from a file (with manual closing)
# -------------------------------------------------------------
try:
    file: TextIO = open(file_path, 'r')  # Open the file in read mode
    text: str = file.read()  # Read the full content of the file
    print(text)  # Display the content on the console
    file.close()  # Close the file manually

except FileNotFoundError:
    # Handle case where the file doesn't exist
    print('Could not find the file.')

except Exception as e:
    # Handle any other unexpected error
    print(f'Error: {e}')

finally:
    # Ensure file is closed even if something went wrong
    if not file.closed:  # If the file is still open
        file.close()  # Force it to close
        print('File closed forcefully.')  # Inform user

# -------------------------------------------------------------
# Step 3: Preferred modern way using 'with' statement
# -------------------------------------------------------------
try:
    with open(file_path, 'r') as f:  # Open file using context manager
        text: str = f.read()  # Read the content
        print(text)  # Print the content

except FileNotFoundError:
    # If the file is missing, display a user-friendly message
    print(f'No file found at {file_path}')


#---------------------------------------------------------------------------
#reading
# -----------------------------------------------------------
# File Reading Modes Demonstration
# -----------------------------------------------------------

# 1. Reading a file in 'r' (read) mode — the default mode
with open('info.txt', 'r') as f:
    text = f.read()  # Reads the entire content of the file into a single string
    print(text)      # Prints: This is some info.\nHi Bob.

# 2. Demonstrating that reading is exhaustive (nothing left after first read)
with open('info.txt', 'r') as f:
    print(f.read())  # First read: reads all content
    print(f.read())  # Second read: returns an empty string (nothing left to read)

# 3. Reading specific number of bytes from the file
with open('info.txt', 'r') as f:
    print(f.read(5))  # Reads first 5 characters: "This "
    print(f.read(5))  # Reads next 5 characters: "is so"
    print(f.read())   # Reads the remaining characters: "me info.\nHi Bob."

# 4. Reading the file line by line using readline()
with open('info.txt', 'r') as f:
    print(f.readline(), end='')  # Reads the first line: "This is some info.\n"
    print(f.readline(), end='')  # Reads the second line: "Hi Bob."

# 5. Reading all lines into a list using readlines()
with open('info.txt', 'r') as f:
    lines = f.readlines()  # Each line becomes an item in the list
    print(lines)           # Output: ['This is some info.\n', 'Hi Bob.']

#Appending
# -----------------------------------------------------------
# Appending Text to a File
# -----------------------------------------------------------

# Define the file path
file_path: str = 'info.txt'

# 1. Opening the file in append ('a') mode
#    - If the file doesn't exist, it will be created.
#    - If it exists, content is added at the end without overwriting.
with open(file_path, 'a') as text:
    text.write('I am some text.\n')  # Appends a new line to the file

# 2. Writing multiple lines at once using writelines()
#    - Each string in the list must include its own newline character
with open('info.txt', 'a') as f:
    f.writelines(['eggs\n', 'ham\n', 'spam\n'])  # Appends 3 new lines to the file

# 3. Demonstrating that a new file is automatically created in append mode
#    - If 'test.txt' does not exist, this will create it and write into it
with open('test.txt', 'a') as f:
    f.write('This is a newly created file with append mode.\n')

#--------------------------------------------------------------------------
#Writing
# -----------------------------------------------------------
# WRITING TEXT TO A FILE USING WRITE ('w') MODE
# -----------------------------------------------------------

# Writing data to 'info.txt' using 'w' mode
# - 'w' stands for write mode
# - If the file does NOT exist, it will be created
# - If it DOES exist, its contents will be completely erased before writing
with open('info.txt', 'w') as txt:
    txt.write('Hello\n')   # Writes "Hello" followed by a newline
    txt.write('Bob\n')     # Writes "Bob" followed by a newline

# Demonstrating that opening in 'w' mode erases previous content
# This overwrites the previous "Hello\nBob\n" with new lines
with open('info.txt', 'w') as txt:
    txt.write('This is a completely new text file.\n')       # Overwrites old content
    txt.write('All previous data has been erased.\n')        # Adds another line

#-----------------------------------------------------------------
#JSON
# ------------------------------------------------------------
# WORKING WITH JSON IN PYTHON
# ------------------------------------------------------------

import json  # Import the JSON module to work with JSON data

# ---------- Reading JSON from a file ----------
# Assume 'data.json' contains valid JSON data like:
# {"name": "Mario", "age": 33, "friends": ["Luigi", "Toad"], "other_info": null}

file_path = 'data.json'  # File path to read from

with open(file_path, 'r') as file:
    data: dict = json.load(file)  # Parses JSON file into a Python dictionary

print(data)  # Output: {'name': 'Mario', 'age': 33, 'friends': ['Luigi', 'Toad'], 'other_info': None}

# ---------- Reading JSON from a string ----------
# JSON string (note: null is converted to None in Python)
my_json: str = '''
{
    "name": "Alice",
    "age": 30,
    "job": null
}
'''

data: dict = json.loads(my_json)  # Converts JSON string into Python dictionary
print(data)  # Output: {'name': 'Alice', 'age': 30, 'job': None}

# ---------- Creating a Python dictionary ----------
# This is just standard Python, preparing data to convert into JSON
data: dict = {
    "name": "Bob",
    "age": 43,
    "job": None  # This will become 'null' in JSON
}

# ---------- Writing JSON to a file ----------
# Writes the Python dictionary to a file in JSON format
with open('new_json.json', 'w') as file:
    json.dump(data, file)  # Serializes and saves the dictionary into the file

print('\nData written to new_json.json')

# ---------- Converting dictionary to JSON string ----------
# Converts Python dict to JSON-formatted string (in memory, not in a file)
json_format: str = json.dumps(data)
print('\nJSON String Format:', json_format)
# Output: {"name": "Bob", "age": 43, "job": null}
