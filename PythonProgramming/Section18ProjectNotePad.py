import os   # Used for interacting with the operating system (not used here but often used for file checks)
import sys  # Used to access system-specific parameters and functions like exiting the script

# Define a Notepad class
class Notepad:
    # Constructor to initialize author name and file name for the notepad
    def __init__(self, author: str, file_name: str) -> None:
        self.author = author              # Store the name of the user
        self._file_name = file_name       # Store the file where notes are saved (conventionally private with underscore)

    # Show instructions for the user
    def show_instructions(self) -> None:
        print(f"Welcome to Notepad, {self.author}!")   # Personalized greeting
        print("Commands:")                              # List available commands
        print("1 - Write a note")
        print("2 - Display note")
        print("0 - Exit Notepad")

    # Write a note to the file
    def write_note(self) -> None:
        user_input: str = input("Enter a note: ")       # Get note input from user

        # Open the file in 'write' mode (this will overwrite existing content)
        with open(self._file_name, 'w') as note:
            note.write(user_input)                      # Write the user's input to the file

        print("Bot: Note successfully created.")         # Confirmation message

    # Display the contents of the saved note
    def display_note(self) -> None:
        try:
            # Try to open the file in 'read' mode
            with open(self._file_name, 'r') as note:
                text: str = note.read()                 # Read entire content of the file
                print(f"Bot: {text}")                   # Display the note content to the user
        except FileNotFoundError:
            # If file doesn’t exist (user hasn't written a note yet)
            print("Bot: You need to write a note first.")

    # Exit the application
    def exit_notepad(self) -> None:
        print(f"See you next time, {self.author}!")     # Friendly exit message
        sys.exit()                                      # Terminate the program immediately

    # Main loop that handles user interaction
    def run(self) -> None:
        self.show_instructions()                        # Show instructions first

        while True:                                     # Loop to continuously interact until the user exits
            user_input: str = input(f"{self.author}: ") # Prompt the user for command input

            # Validate input; only allow 0, 1, or 2
            if user_input not in ('0', '1', '2'):
                print("Bot: Please enter a valid choice.")
                continue  # Skip to next iteration and ask again

            # If user chooses to write a note
            if user_input == '1':
                self.write_note()
            # If user chooses to read/display the note
            elif user_input == '2':
                self.display_note()
            # If user chooses to exit
            elif user_input == '0':
                self.exit_notepad()
            # Catch-all for any unexpected inputs (technically redundant here)
            else:
                print(f"Bot: Unknown command: {user_input}")

# Entry point function that starts the notepad app
def main() -> None:
    notepad: Notepad = Notepad('Bob', 'notes.txt')  # Create a Notepad object with author and file
    notepad.run()                                   # Start the notepad's user interface loop

# This block ensures the script runs only when executed directly (not when imported)
if __name__ == '__main__':
    main()
