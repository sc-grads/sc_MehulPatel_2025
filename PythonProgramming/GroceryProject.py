# Import the sys module to allow clean exiting of the program using sys.exit()
import sys

# ------------------------ Welcome Message ------------------------
# This function prints a welcome message and the menu options
def welcome_message() -> None:
    print('Welcome to Groceries!')
    print('Enter:')
    print('--------------------------')
    print('1 - To add an item')       # Option to add an item to the list
    print('2 - To remove an item')    # Option to remove an item from the list
    print('3 - To list all items')    # Option to display the grocery list
    print('0 - To exit the program')  # Option to exit the program
    print('--------------------------')

# ------------------------ Add Item ------------------------
# Adds a new item to the grocery list
def add_item(item: str, groceries: list[str]) -> None:
    groceries.append(item)  # Add the item to the end of the list
    print(f'"{item}" has been added!')  # Print confirmation message

# ------------------------ Remove Item ------------------------
# Removes an item from the grocery list
def remove_item(item: str, groceries: list[str]) -> None:
    if not groceries:  # Check if the list is currently empty
        print('Your list is empty.')
        return  # Exit the function early

    try:
        groceries.remove(item)  # Try to remove the item
        print(f'"{item}" has been removed.')  # Print confirmation if successful
    except ValueError:
        # If the item doesn't exist in the list, inform the user
        print(f'No "{item}" found in: {groceries}')

# ------------------------ Display Items ------------------------
# Displays the current items in the grocery list
def display_groceries(groceries: list[str]) -> None:
    if not groceries:  # If list is empty, inform the user
        print('Your list is empty.')
        return

    print('___LIST___')
    # Use enumerate to show item number starting from 1
    for i, item in enumerate(groceries, 1):
        print(f'{i}. {item.capitalize()}')  # Capitalize item names for readability
    print('_' * 10)  # Print a separator line

# ------------------------ Option Validator ------------------------
# Checks whether the input is one of the valid options (0-3)
def is_an_option(text: str) -> bool:
    return text in ['1', '2', '3', '0']  # Returns True if valid, False otherwise

# ------------------------ Main Logic ------------------------
# This is the main function that controls the user interface loop
def main():
    groceries: list[str] = []  # Initialize an empty list to store grocery items
    welcome_message()  # Print welcome and menu options

    # Infinite loop to continuously prompt the user
    while True:
        user_input = input('Choose: ').lower()  # Get user input and normalize to lowercase

        if not is_an_option(user_input):  # Validate input
            print('Please pick a valid option.')  # Show error if invalid
            continue  # Skip to the next loop iteration

        # Option 1: Add item
        if user_input == '1':
            new_item = input('What item would you like to add? >> ').lower()  # Get item and normalize
            add_item(new_item, groceries)

        # Option 2: Remove item
        elif user_input == '2':
            item_to_remove = input('What item would you like to remove? >> ').lower()  # Get item and normalize
            remove_item(item_to_remove, groceries)

        # Option 3: List all items
        elif user_input == '3':
            display_groceries(groceries)

        # Option 0: Exit program
        elif user_input == '0':
            print('Exiting the program...')
            sys.exit()  # Exit cleanly using sys module

# ------------------------ Run Main ------------------------
# Ensures that the program runs only if this file is executed directly
if __name__ == '__main__':
    main()

