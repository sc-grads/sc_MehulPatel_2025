# Importing a helper function to find close string matches
from difflib import get_close_matches


# -------------------------------
# Function to get the best matching question from the knowledge base
# -------------------------------
def get_best_match(user_question: str, knowledge: dict) -> str | None:
    # Extract all questions (keys) from the knowledge dictionary
    questions: list[str] = [q for q in knowledge]

    # Use get_close_matches to find the most similar question
    # n=1 means we want only the top (best) match
    # cutoff=0.6 means the similarity must be at least 60%
    matches: list[str] = get_close_matches(user_question, questions, n=1, cutoff=0.6)

    # If any matches were found, return the top one
    if matches:
        return matches[0]

    # If no match was found, return None implicitly


# -------------------------------
# Function that runs the chatbot in a loop
# -------------------------------
def run_chat_bot(knowledge: dict) -> None:
    # Infinite loop to keep chatbot running until user stops it manually
    while True:
        # Prompt the user for a message
        user_input: str = input('You: ')

        # Find the best matching question in the knowledge base
        best_match: str | None = get_best_match(user_input, knowledge)

        # If a match is found, get the response from the dictionary
        response: str | None = knowledge.get(best_match)

        # If there is a valid response, print it
        if response:
            print(f'Bot: {response}')
        else:
            # If no match or no response found, show fallback message
            print(f'Bot: I do not understand...')


# -------------------------------
# Main entry point of the program
# -------------------------------
def main() -> None:
    # The "brain" of the bot — a dictionary mapping questions to responses
    brain: dict[str, str] = {
        'hello': 'Hey there!',
        'how are you': 'I am good, thanks!',
        'what time is it': 'Not clue.',
        'do you know what the time is?': 'No clue.',
        'what can you do?': 'I can answer questions.',
        'okay': 'Great!'
    }

    # Start the chat bot using the knowledge base
    run_chat_bot(brain)


# -------------------------------
# If this file is being run directly, call the main function
# -------------------------------
if __name__ == '__main__':
    main()
