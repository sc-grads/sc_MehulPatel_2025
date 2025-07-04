from uuid import uuid4, UUID  # Import UUID type and uuid4 function for generating unique IDs
from dataclasses import dataclass, field  # Import dataclass decorator and field function for default/init control

# Define a dataclass to represent a Note
@dataclass
class Note:
    id: UUID = field(init=False)  # Unique identifier for the note, not set during initialization
    title: str                   # Title of the note
    body: str                    # Content/body of the note

    # Automatically called after the default __init__ method generated by @dataclass
    def __post_init__(self) -> None:
        self.id = uuid4()  # Generate a unique UUID for this note when it's created


# Class that manages the note-taking app
class NoteApp:
    # Initialize the app with author name and an optional list of existing notes
    def __init__(self, author: str, notes: list[Note] | None = None) -> None:
        self.author = author  # Store the author name
        # If notes are provided, use them; otherwise, start with an empty list
        self._notes = notes if notes is not None else []
        self.display_instructions()  # Show usage instructions when app starts

    # Static method to print instructions, no need for class or instance data
    @staticmethod
    def display_instructions() -> None:
        print('Welcome to the Notes!')
        print('Here are the commands: ')
        print('1 - Add a new note')
        print('2 - Edit a note')
        print('3 - Delete a note')
        print('4 - Display all notes')

    # Add a new note by asking user for title and body
    def add_note(self) -> None:
        title: str = input('Title: ')  # Prompt for note title
        body: str = input('Body: ')    # Prompt for note content
        note: Note = Note(title, body) # Create a new Note object with the input
        self._notes.append(note)        # Append the new note to the internal list
        print('Note was added.')        # Confirmation message

    # Edit an existing note selected by the user
    def edit_note(self) -> None:
        print('Which note would you like to edit?')
        self.show_notes()               # Show list of current notes with indexes
        try:
            note_index: int = int(input('Index: ')) - 1  # Get user selection and convert to zero-based index
            current: Note = self._notes[note_index]      # Fetch the selected note
            new_title: str = input('New title: ')        # Get new title
            new_body: str = input('New body: ')          # Get new body
            current.title = new_title                     # Update the note's title
            current.body = new_body                       # Update the note's body
            print('Note was updated')                     # Confirm update
        except IndexError:
            print('Please select a valid note index...')  # Handle invalid index errors
            self.edit_note()                               # Retry editing
        except ValueError:
            print('Index cannot be empty...')             # Handle empty or invalid input
            print('Aborting operation.')                   # Abort edit operation

    # Delete a note selected by the user
    def delete_note(self) -> None:
        print('Which note would you like to delete?')
        self.show_notes()               # Show current notes
        try:
            note_index: int = int(input('Index: ')) - 1  # Get index to delete
            del self._notes[note_index]                   # Remove note from list
            print('Note was deleted!')                    # Confirm deletion
        except IndexError:
            print('Please select a valid note index...')  # Handle invalid index
            self.delete_note()                             # Retry deleting
        except ValueError:
            print('Index cannot be empty...')             # Handle invalid input
            print('Aborting operation.')                   # Abort deletion

    # Display all notes with their indexes
    def show_notes(self) -> None:
        if not self._notes:             # Check if notes list is empty
            print('No notes...')
            return
        # Enumerate notes starting from 1 for user-friendly indexing
        for i, note in enumerate(self._notes, start=1):
            print(f'[{i}] {note.title}: {note.body}')  # Print note index, title, and body

    # Helper method to select the correct action based on user input
    def _select_option(self, user_input: str) -> None:
        # Validate input, only accept '1', '2', '3', or '4'
        if user_input not in ['1', '2', '3', '4']:
            print('Please pick a valid option')  # Error message for invalid input
            return

        # Call corresponding method based on user choice
        if user_input == '1':
            self.add_note()
        elif user_input == '2':
            self.edit_note()
        elif user_input == '3':
            self.delete_note()
        elif user_input == '4':
            self.show_notes()

    # Main loop to run the app and accept commands
    def run_app(self) -> None:
        while True:                     # Infinite loop to continuously accept commands
            user_input: str = input('You: ')  # Prompt user for a command
            self._select_option(user_input)   # Process the input command


# Main function to initialize the app and start the interaction
def main() -> None:
    # Predefined sample notes to start with
    sample_notes: list[Note] = [
        Note(title='Title1', body='Hello there, Bob!'),
        Note(title='Title2', body='More text!')
    ]
    # Create the NoteApp instance with author and sample notes
    note_app: NoteApp = NoteApp(author='Bob', notes=sample_notes)
    note_app.run_app()  # Start the interactive app loop


# Entry point for script execution
if __name__ == '__main__':
    main()
