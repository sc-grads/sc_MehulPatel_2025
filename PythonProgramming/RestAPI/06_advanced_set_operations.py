# -- Difference between two sets --

friends = {"Bob", "Rolf", "Anne"}
abroad = {"Bob", "Anne"}

# local_friends = ...
# If there are 3 friends, and 2 are abroad, that means that 1 friend is local.
# We can easily calculate which names are in `friends` but not in `abroad` by using `.difference`

local = friends.difference(abroad)
print(local)

print(abroad.difference(friends))  # This returns an empty set

# -- Union of two sets --

local = {"Rolf"}
abroad = {"Bob", "Anne"}

# friends = ...
# If we have 1 local friend and 2 abroad friends, we could calculate the total friends by using `.union`

friends = local.union(abroad)
print(friends)

# -- Intersection of two sets --

art = {"Bob", "Jen", "Rolf", "Charlie"}
science = {"Bob", "Jen", "Adam", "Anne"}

# Given these two sets of students, we can calculate those who do both art and science by using `.intersection`

both = art.intersection(science)
print(both)

# exercise 2
# Create a list, called my_list, with three numbers. The total of the numbers added together should be 100.

# Create a tuple, called my_tuple, with a single value in it

# Modify set2 so that set1.intersection(set2) returns {5, 77, 9, 12}
# set1 = {14, 5, 9, 31, 12, 77, 67, 8}
# set2 = {5}

# my_list=[100,0,0]
# my_tuple=5,


# set2 = {5, 77, 9, 12}
