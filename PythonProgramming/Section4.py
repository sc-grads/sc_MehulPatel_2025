#Creating a function
def greet():
    print('Hello!')
greet()

from datetime import datetime
import time

def show_time():
    now: datetime= datetime.now()
    print(f'Time:{now:%H:%M:%S}')
show_time()
time.sleep(2)
show_time()

#Pass-is used when we know we need a specific function but we do not know what the function does
#Note we can use it in any block of code not just functions
def get_status():
    pass #it tells python that we should ignore this type of code

#Parameters and arguments

def greet(name:str): #so the name is a parameter
    print(f'Hello, {name:}')
greet('Mario') #the name here is an argument

def greet(name:str, language:str,default:str = "Hello"):
    if language == "it":
        print(f'Ciao, {name:}')
    else:
        print(f'{default:},{name}')

greet('Mario',"po")

#return functions

def get_length(text:str) -> int: #we want to get an integer back
    print(f'Getting the length of : {text}')
    return len(text)

name: str='Mario'
length: int=get_length(name)
print(length)

def make_upper(text:str)->str:
    return text.upper()

print(make_upper("hello"))

#Recursion
import time

def connect_to_internet(signal: bool,delay:int)->None:
    if delay > 5:
        signal = True
    if signal:
        print('connected')
    else:
        print(f'Connection failed. Try again in : {delay}s')
        time.sleep(delay)
        connect_to_internet(signal,delay+2)

connect_to_internet(False,0)

#args and kwargs
def add(*args:int) -> int:
    print(args)
    return sum(args)

print(add(1,2,3))

def greet(greeting: str, *people: str, ending:str)->None:
    for person in people:
        print(f'{greeting},{person}{ending}')
greet('Hello','bob','james','maria', ending='!')

def pin_position(**kwargs:int) -> None: #kwargs get converted into a dictionary
    print(kwargs)
pin_position(x=10,y=20)

#*&/
def func(var_a:str,/,var_b:str) -> None:
    print(var_a)
    print(var_b)
func('a','b')

def func(var_a:str,*,var_b:str) -> None:
    print(var_a)
    print(var_b)
func('a',var_b='b')