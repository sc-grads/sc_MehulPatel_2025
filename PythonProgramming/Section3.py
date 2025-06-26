#if,elif and else
age: int = 20

if age>=21:
    print('You may enter the club')
else:
    print('You are not allowed in ')


weather: str = 'cloudy'

if weather == 'clear':
    print('It is a nice day')
elif weather == 'cloudy':
    print('The weather could be better..')
elif weather== 'rainy':
    print('what an awful day')
else:
    print('unknown weather')

age: int=19

if age >= 21:
    print('You are an adult')
elif age >= 18:
    print('You are a young adult')
elif age > 12:
    print('You are a teenager')
else:
    print('unknown age')

#if else shorthand

number: int =0

if number >0:
    result: str = 'Above 0'
else:
    result: str = '0 and below'

#result: str = 'Above 0' if number>0 else 'O and below'
print(result)

condition: bool = True
var: str ='True' if condition else 'False'
print(var)

#for loop

text: str = 'Hellow, world!'

for i in range(3):
    print(text)

text: str = 'Hellow, world!'

for i in range(3):
    print(f'{i}:{text}') #using a formatted string

people: list[str] = ['Bob', 'James', 'Maria']

for person in people:
    print(person)

for person in people:
    if len(person)>4:
        print(f'{person} has a long name')
    else:
        print(f'{person} has a short name')


#while loop
i: int=5

while i > 0:
    print(f'"hello": {i}')
    i=i-1

import time
connected: bool = True

while connected:
    print('Using internet')
    time.sleep(5) #going to sleep for 5 seconds
    connected=False
print ('Connection ended')

#example of a chatbot
#while True:
   # user_input: str = input('You: ') #we have to enter something and it stores it as user_input

   # if user_input == 'hello':
      #  print('Bot:hey there!')
    #else:
       # print('Bot: yes, that is interesting')

#break and continue

number: int = 5

while number > 0:
    number= number -1

    if number == 2:
        print('Breaking at 2')
        break #continue it will skip 2

    print(number)
print('Done!')

total: int = 0

print('Welcome to Calc+! Add positive numbers , or insert "0 to exit.')
while True:
    user_input: int =int(input('Enter a number:'))

    if user_input < 0:
        print('!!! Please enter positive numbers only')
        continue

    if user_input == 0: #As soon as we hit 0 it will trigger this blook and give us the total
        print(f'Total: {total}')
        break

    total += user_input

#Loop Else

for i in range(3):
    print(f'Iteration: {i}')
else:  #this willl be triggered
    print('Success!')