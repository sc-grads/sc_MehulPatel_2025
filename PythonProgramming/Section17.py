# #memoization
# import time
# from functools import cache  # Built-in memoization decorator (Python 3.9+)
#
#
# # Memoized function that counts vowels in a string
# @cache  # Caches the result for repeated inputs
# def count_vowels(text: str) -> int:
#     print('Counting...')  # This line will only print for new inputs
#     time.sleep(3)  # Simulate a slow computation (e.g. API, database, etc.)
#
#     # Count vowels (both uppercase and lowercase) in the input text
#     return sum(text.count(vowel) for vowel in 'AEIOUaeiou')
#
#
# # Main chatbot loop
# def main() -> None:
#     while True:
#         user_input: str = input('You: ').lower()  # Get user input and make it lowercase
#
#         if user_input == 'info':
#             # Show cache statistics (hits, misses, size, etc.)
#             print(f'Bot says: {count_vowels.cache_info()}')
#
#         elif user_input == 'clear':
#             # Clear all cached results
#             count_vowels.cache_clear()
#             print('Bot says: Cache has been cleared.')
#
#         else:
#             # Call the function and use the cache if available
#             print(f'Bot says: That text contains {count_vowels(user_input)} vowels.')
#
#
# # Run the chatbot only if the script is executed directly
# if __name__ == '__main__':
#     main()

#-----------------------------------------------------------------------------------
# #cached_property
# import time
# from functools import cached_property  # Importing the cached_property decorator
#
# # Class to hold a dataset and perform cached computations
# class DataSet:
#     def __init__(self, data: list[float]) -> None:
#         self._data = data  # Store the list of numbers
#
#     def show_data(self) -> None:
#         # Method to display the dataset
#         print('Current data:', self._data)
#
#     @cached_property
#     def sum(self) -> float:
#         # This property will be calculated once and then cached
#         print('Calculating sum...')
#         time.sleep(2)  # Simulate expensive calculation
#         return sum(self._data)
#
#     @cached_property
#     def mean(self) -> float:
#         # Cached mean calculation
#         print('Calculating mean...')
#         time.sleep(2)  # Simulate expensive calculation
#         return sum(self._data) / len(self._data)  # ✅ Corrected from: `sum(self._data/len(self._data))`
#
# # Interactive main function to simulate user commands
# def main() -> None:
#     ds: DataSet = DataSet([1.5, 2.5, 10, 7])  # Create a DataSet instance
#     ds.show_data()
#
#     while True:
#         user_input: str = input('You: ').lower()
#
#         if user_input == 'clear sum':
#             # Clear the cached value for sum
#             del ds.sum
#             print('Sum cache cleared.')
#
#         elif user_input == 'clear mean':
#             # Clear the cached value for mean
#             del ds.mean
#             print('Mean cache cleared.')
#
#         elif user_input == 'sum':
#             # Use the cached value or calculate if not cached
#             print(ds.sum)
#
#         elif user_input == 'mean':
#             print(ds.mean)
#
#         else:
#             print('Unknown command.')
#
# # Run the program only if executed directly
# if __name__ == '__main__':
#     main()

#---------------------------------------------------------------------
#monkey patching
import time
import logging

# A class simulating an internet connection
class Internet:
    def __init__(self, provider: str) -> None:
        self.provider = provider  # Store the provider name

    def connect(self) -> None:
        # Simulate an actual connection with delay
        print(f'[{self.provider}] Connecting...')
        time.sleep(2)  # Simulates time taken to connect
        print(f'[{self.provider}] You are now connected.')

# A test version of the connect method (used for monkey patching)
def test_connect(self) -> None:
    # Simulated fast connection (no delay), for testing purposes
    print(f'{self.provider} says: You are now connected.')

# Main program block
if __name__ == '__main__':
    # Create an instance of the Internet class
    internet: Internet = Internet('Verizon')

    # Call the original connect method (includes 2-second delay)
    internet.connect()

    # -------------------- MONKEY PATCHING BEGINS ----------------------

    # Replace the connect method of Internet class with the test_connect method
    Internet.connect = test_connect  # type: ignore to silence type checker
    print('\n[Monkey Patching Active]\n')

    # Now when we call connect, it uses the patched version (no delay)
    internet.connect()

    # ---------------------------------------------------------------

    # Monkey patching the built-in `print` function (⚠ dangerous in practice!)
    def new_print(text: str) -> None:
        # Custom print function that logs a warning instead of printing normally
        logging.warning(text)

    # Override print with the new_print function
    print = new_print

    # Now every "print" is actually logging.warning
    print('Hello World')  # Will log a warning
    print('Hi Bob')       # Will log a warning

#----------------------------------------------------------------------------------
#Timing coding
import timeit

# --------------------------------------------------------------
# Comparing the performance of list vs set creation
# --------------------------------------------------------------

# Code snippets to be timed
a: str = 'list(range(1000))'  # Code that creates a list of 1000 elements
b: str = 'set(range(1000))'   # Code that creates a set of 1000 elements

# Warming up (optional): helps Python "warm up" so results are more stable
timeit.timeit(stmt=a, number=1000)
timeit.timeit(stmt=b, number=1000)

# --------------------------------------------------------------
# Timing the actual executions
# --------------------------------------------------------------

# Time how long it takes to run each snippet 100,000 times
a_time = timeit.timeit(stmt=a, number=100_000)
b_time = timeit.timeit(stmt=b, number=100_000)

# Print the times (rounded to 6 decimal places)
print(f'a: {a_time:.6f} s')  # Time for list creation
print(f'b: {b_time:.6f} s')  # Time for set creation

# --------------------------------------------------------------
# Using repeat to get more consistent benchmark results
# --------------------------------------------------------------

repeat_count = 5          # Repeat the timing 5 times
number = 100_000          # Each timing involves 100,000 executions

# Pick the **minimum** time from 5 repeats (best-case scenario)
list_times = min(timeit.repeat(stmt=a, repeat=repeat_count, number=number))
set_times = min(timeit.repeat(stmt=b, repeat=repeat_count, number=number))

# Print repeated timing results
print(f'List creation (repeated): {list_times:.6f} s')
print(f'Set creation (repeated): {set_times:.6f} s')

# --------------------------------------------------------------
# Comparing built-in exponentiation vs math.pow
# --------------------------------------------------------------

# Setup code to define variables a and b for the next timing
setup_code = 'a, b = 10, 3'

# Time built-in exponentiation operator (**)
power_time = timeit.timeit(stmt='a ** b', setup=setup_code, number=1_000_000)
print(f'Power (a ** b): {power_time:.6f} s')

# Setup with import from math module
setup_code_math = 'from math import pow; a, b = 10, 3'

# Time the math.pow function
pow_time = timeit.timeit(stmt='pow(a, b)', setup=setup_code_math, number=1_000_000)
print(f'Power (math.pow): {pow_time:.6f} s')
