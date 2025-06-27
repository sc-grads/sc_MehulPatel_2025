import sys
from datetime import datetime

def get_response(text: str) -> str:
    lowered: str = text.lower()

    if lowered in ['hello', 'hi','hey']:
        return 'hey there!'
    elif 'how are yoy' in lowered:
        return ' I am good thanks'
    elif 'your name' in lowered:
        return 'My name is: bot '
    elif 'time' in lowered:
        current_time: datetime=datetime.now()
        return f'The time is: {current_time:%H:%M}'
    elif lowered in ['bye', 'see you','goodbye']:
        return "it was nice talking to you, BYE"
    else:
        return f"sorry, I do not understand: {text}"

while True:
    user_input: str = input('You:')

    if user_input == 'exit':
        print('bot: it was a pleasure talking to you')
        sys.exit()

    bot_response: str = get_response(user_input)
    print(f'Bot: {bot_response}')