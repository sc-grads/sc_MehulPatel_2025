#Type conversion
txt_value: str = '100'
int_value: int=50
print(int(txt_value)+int_value) #converting the string into an integer

#Simple adder
print("welcome to your simple adder!")
print("---------------------------------")
#a: str = input ('Enter s value for "a": ')
#b: str = input ('Enter s value for "b": ')
print("---------------------------------")
#print ("the result is :", int(a)+int(b))

#lists
people: list[str]=['Bob', 'James', 'Tom']
print(people[0])
print("original:",people)

#add people
people.append('Jerermy')
print(people)

#remove people
people.remove('Bob')
print(people)

#removing the last person from the list
people.pop()
print(people)

#changing the value of a person
people[0]= "Charlotte"
print(people)

#inserting in a specific position
people.insert(1,"Timothy")
print(people)

#clear the list
people.clear()
print(people)

#Tuples
coordinates: tuple[float,float] = 1.5, 2.5 #we cannot modify tuples

#sets-they have no order and they cannot have duplicate values
elements: set = {99,True,"Bob"}
print(elements)

#add elements
elements.add("James") #.remove to remove elements
print(elements)

#pop this will remove a random element
elements.pop()

#dictionaries they are key value pairs
users: dict = {1: 'Bob', 2: 'Luigi'}
print(users)

#add a user
users[3]="mario"

#delete a user
users.pop(2) #delete users[2]

weather: dict= {'time': '12:00',
               'weather': {'morning': 'rain',
               'evening': 'more rain'}}
print(weather)
print(weather['time'])
print(weather['weather'])
print(weather['weather']['morning'])