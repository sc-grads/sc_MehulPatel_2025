import random
import sys

print("Welcome to RPS!")

moves: dict = {
    'rock': '✊',
    'paper': '✋',
    'scissors': '✌'
}

valid_moves: list[str] = list(moves.keys())

# Step 2: Infinite loop
while True:
    user_move: str = input('rock, paper, or scissors? >> ').lower()

    if user_move == 'exit':
        print('Thanks for playing!')
        sys.exit()

    if user_move not in valid_moves:
        print('Invalid move.')
        continue

    ai_move: str = random.choice(valid_moves)

    print('------')
    print(f'You: {moves[user_move]}')
    print(f'AI:  {moves[ai_move]}')
    print('------')

    # Check moves
    if user_move == ai_move:
        print("It is a tie!")
    elif (user_move == 'rock' and ai_move == 'scissors') or \
         (user_move == 'scissors' and ai_move == 'paper') or \
         (user_move == 'paper' and ai_move == 'rock'):
        print('You win! 🎉')
    else:
        print('AI wins... 🤖')
