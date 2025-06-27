#list comprehensions
numbers: list[int]=[1,2,3]

doubled: list[int]=[]
for number in numbers:
    doubled.append(number*2)

doubled_lc: list[int]= [number*2 for number in numbers] #we reversed the above process
print(doubled_lc)

#example
names: list[str]= ['Mario','James','Luigi','John']
j_names: list[int]=[]

for name in names:
    if name.startswith('J'):
        j_names.append(name)

j_names_lc: list[str]=[name for name in names if name.startswith('J')]
print(j_names_lc)

#example
numbers: list[int]=[1,2,4,5,7,10]

even_numbers: list[int]= []

for number in numbers:
    if number % 2 ==0:
        even_numbers.append(number)


even_numbers_lc : list[int]=[number
                            for number in numbers
                            if  number % 2 ==0]

print(even_numbers_lc)

#slicing
numbers: list[int]= [1,2,3,4,5,6]
print(numbers[0:3])
print(numbers[2:4])
print(numbers[0:4:2])
print(numbers[::2])

#Don't loop and modify
people: list[str]= ['Anna','Bob','Chris','David','Fred']
new_people: list[str]=[]
for person in people:
    print(f'-{person}, {people.index(person)}')

    if person == 'Bob':
        print(f'Removing: {person}')
        continue

    new_people.append(person)

print(new_people)
