
#try and except
try:
    result: float = 10/0
    print(result)
except Exception as e:
    print(f'error: {e}')

#
while True:
    try:
        user_input: str = input('Enter a number:')
        print(f'10 / {user_input}={10/float(user_input)}')
    except ZeroDivisionError:
        print("you cannot divide by 0")
    except ValueError:
        print('Please enter a valid number')

#
# Initialize the total as a float so it can handle decimals (like 2.5 + 3.1)
total: float = 0

# Start an infinite loop to repeatedly ask for input
while True:
    # Prompt the user to enter a number (input is always a string)
    user_input: str = input('Enter a number: ')

    # Check if the user wants to exit the program
    if user_input == '0':
        # If yes, print the total and exit
        print(f'Total: {total}')
        sys.exit()  # Stops the program immediately

    # Try to convert the user input to a float
    try:
        total += float(user_input)  # Add it to the running total
    except ValueError:
        # If conversion fails (e.g., user types "abc"), show an error message
        print("❌ Please enter a valid number")

#Else....Finally
user_input: str= ('10')

try:
    result: float = 1/ float(user_input)
    print(f'1?{user_input}={result}')
except ValueError :
    print(f'You cannot use {user_input} as a value')
except ZeroDivisionError:
    print('Don;t be silly, you cannot divide by 0')
else: #will only get executed if the try block is a success
    print('Success, there were no exceptions encountered')
finally: #will always be executed no matter what
    print('Finally: I am always executed')

#Raise
def check_age(age:int) -> bool:
    if age <0 :
        raise ValueError('Not a valid age...')
    elif age >=21 :
       print("you are old enough")
       return True
    else:
        print('You are not old enough..')
        return False



