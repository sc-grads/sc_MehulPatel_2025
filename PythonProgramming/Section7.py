#Truthy and Falsy
users: dict = {1: 'mario', 2: 'Luigi', 3: 'James'}

if users:
    for k, v in users.items():  #k stands for the user ID and v stands for the value
        print(k,v,sep=': ') #Prints the key and value with ': ' between them
else:
    print('No data found')

#comparing floats
from math import isclose

a: float = 0.999
b: float = 1.000

print(f'{a}=={b}?', isclose(a,b,rel_tol=.001,abs_tol=1))

#scopes

number: int = 999 #global scope

def change_number() -> None:
    number =10 #this is the inner scope

#global
number: int = 0

def change_number() -> None:
    global number
    number=10
print(number)
change_number()
print(number)

#non-local
def outer_func() -> None:
    name: str = ''
    value: int = 0

    def inner_func() -> None:
        nonlocal name, value
        name = 'Tom'
        value=100

    inner_func()
    print(name,value)