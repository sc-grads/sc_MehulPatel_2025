import string  # Provides a prebuilt list of all ASCII letters

# Function that checks if the input text contains only letters and spaces
def is_letters_only(text: str) -> None:
    alphabet: str = string.ascii_letters + ' '  # a-z, A-Z, and space

    # Loop through each character in the text
    for char in text:
        if char not in alphabet:
            # If a non-letter character is found, raise an error
            raise ValueError('Text can only contain letters from the alphabet')

    # If the loop finishes with no errors, print success message
    print(f'"{text}" is letters-only. ✅ Good job!')

# Main loop to prompt user for input
def main() -> None:
    while True:
        try:
            user_input: str = input('Check text: ')
            is_letters_only(user_input)  # Check if input is valid
        except ValueError:
            print('❌ Please only enter English letters and spaces.')
        except Exception as e:
            # Catch any other unexpected exceptions
            print(f'⚠️ Encountered an unknown exception: {type(e).__name__} — {e}')

# This was the problem — you forgot the parentheses to actually call main()
main()