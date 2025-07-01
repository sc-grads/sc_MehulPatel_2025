# -----------------------------------------------------------------
# DATA CLASS (@dataclass)
# -----------------------------------------------------------------

# Importing dataclass from the built-in dataclasses module
from dataclasses import dataclass

# A data class is used to quickly create classes that store data
# It automatically adds methods like __init__, __repr__, and __eq__

@dataclass  # This decorator turns the class into a data class
class Coin:
    name: str       # Name of the cryptocurrency (e.g., Bitcoin)
    value: float    # Market value of the cryptocurrency
    id: str         # Unique identifier (e.g., BTC, XRP)

# Main function demonstrating the use of data classes
def main() -> None:
    # Creating objects of the Coin data class
    bitcoin: Coin = Coin('Bitcoin', 10000, 'BTC')
    bitcoin2: Coin = Coin('Bitcoin', 10000, 'BTC')
    ripple: Coin = Coin('Ripple', 200, 'XRP')

    # Displaying the created Coin objects
    print(bitcoin)   # Output: Coin(name='Bitcoin', value=10000, id='BTC')
    print(ripple)    # Output: Coin(name='Ripple', value=200, id='XRP')

    # Comparing Coin objects for equality
    print(bitcoin == ripple)     # Output: False (different values and id)
    print(bitcoin == bitcoin2)   # Output: True (same values and id)

    # ------------------
    # Comparison: Regular class without @dataclass
    # You'd have to manually define __init__, __repr__, and __eq__
    class CoinRegular:
        def __init__(self, name: str, value: float, coin_id: str) -> None:
            self.name = name
            self.value = value
            self.coin_id = coin_id

        # Optional: you'd need to manually add __repr__ and __eq__ if needed

if __name__ == '__main__':
    main()

# -----------------------------------------------------------------
# FIELDS IN DATACLASSES
# -----------------------------------------------------------------

# Import necessary modules
from dataclasses import dataclass, field
from typing import List

# Creating a data class for Fruit
@dataclass
class Fruit:
    name: str                    # Name of the fruit
    grams: float                 # Weight of the fruit in grams
    price_per_kilo: float        # Price per kilogram
    edible: bool = True          # Optional field with a default value of True

    # related_fruits is a list. Since lists are mutable, use `default_factory`
    related_fruits: List[str] = field(default_factory=list)

    # Note: `field(default_factory=...)` is used instead of `related_fruits=[]`
    # to avoid all instances sharing the same list (a common bug)

# Main function to demonstrate the usage
def main() -> None:
    # Creating a Fruit object with default values (edible = True, related_fruits = [])
    apple: Fruit = Fruit('Apple', 100, 5)
    print(apple)
    # Output: Fruit(name='Apple', grams=100, price_per_kilo=5, edible=True, related_fruits=[])

    # Creating a Fruit object with custom related fruits list
    pear: Fruit = Fruit('Pear', 250, 10, related_fruits=['Apple', 'Orange'])
    print(pear)
    # Output: Fruit(name='Pear', grams=250, price_per_kilo=10, edible=True, related_fruits=['Apple', 'Orange'])

    # Accessing just the related fruits
    print(pear.related_fruits)
    # Output: ['Apple', 'Orange']

# Entry point of the script
if __name__ == '__main__':
    main()

#-----------------------------------------------------------------
# POST INITIALIZER
# (__post_ init__)

from dataclasses import dataclass, field

# Define a data class to represent a Fruit
@dataclass
class Fruit:
    name: str               # Name of the fruit (e.g., Apple)
    grams: float            # Weight in grams
    price_per_kilo: float   # Price per kilogram
    total_price: float = field(init=False)  # Will be calculated after init

    # Post-initializer method: runs automatically after __init__
    def __post_init__(self) -> None:
        # Calculate total price based on weight and price per kilo
        self.total_price = (self.grams / 1000) * self.price_per_kilo

    # Method to describe the fruit in a human-readable way
    def describe(self) -> None:
        print(f'{self.grams}g of {self.name} costs ${self.total_price}')

# Main function
def main() -> None:
    # Create fruit objects
    apple: Fruit = Fruit('Apple', 1500, 5)     # 1.5kg × $5 = $7.5
    orange: Fruit = Fruit('Orange', 2500, 10)  # 2.5kg × $10 = $25.0

    # Print full object info (auto-generated __repr__ from dataclass)
    print(apple)   # Fruit(name='Apple', grams=1500, price_per_kilo=5, total_price=7.5)
    print(orange)  # Fruit(name='Orange', grams=2500, price_per_kilo=10, total_price=25.0)

    # Use describe() method
    apple.describe()   # 1500g of Apple costs $7.5
    orange.describe()  # 2500g of Orange costs $25.0

    # Change the price per kilo
    apple.price_per_kilo = 100

    # Describe again (BUT price won’t update because __post_init__ runs only ONCE)
    apple.describe()  # Still says: 1500g of Apple costs $7.5

# Entry point
if __name__ == '__main__':
    main()

#-----------------------------------------------------------------
# INITVAR (InitVar)

from dataclasses import dataclass, field, InitVar

# Creating the Fruit data class
@dataclass
class Fruit:
    name: str                        # Name of the fruit (e.g., Apple)
    grams: float                     # Weight of the fruit in grams
    price_per_kilo: float            # Price per kilo in currency

    is_rare: InitVar[bool | None] = None  # Only used during initialization (not saved)

    total_price: float = field(init=False)  # Total price to be calculated, not set by user

    # This method runs after __init__, and gets is_rare passed into it
    def __post_init__(self, is_rare: bool | None) -> None:

        # If fruit is marked as rare, double the price per kilo
        if is_rare:
            self.price_per_kilo *= 2

        # Now calculate the total price
        self.total_price = (self.grams / 1000) * self.price_per_kilo

    # Helper method to print fruit info
    def describe(self):
        print(f'{self.grams}g of {self.name} costs ${self.total_price:.2f}')


# Main section
def main() -> None:
    # Creating normal fruits
    apple = Fruit('Apple', 1500, 5)           # Normal fruit
    orange = Fruit('Orange', 2500, 10)        # Normal fruit

    # Creating a rare fruit (price will be doubled!)
    passion = Fruit('Passion Fruit', 100, 50, is_rare=True)

    # Display the fruit prices
    apple.describe()     # 1500g of Apple costs $7.50
    orange.describe()    # 2500g of Orange costs $25.00
    passion.describe()   # 100g of Passion Fruit costs $10.00

    # Print the fruit objects to show attributes
    print(apple)
    print(orange)
    print(passion)  # is_rare is NOT printed because it's not stored in the object


if __name__ == '__main__':
    main()

#-----------------------------------------------------------------
# PROPERTY (@property)
# from dataclasses import dataclass, field, InitVar

from dataclasses import dataclass


# Define a dataclass called Fruit
@dataclass
class Fruit:
    name: str  # Name of the fruit
    grams: float  # Weight of the fruit in grams
    price_per_kilo: float  # Price per kilogram

    # Define a dynamic property that calculates total price based on current values
    @property
    def total_price(self) -> float:
        # Convert grams to kilograms and multiply by the price per kilogram
        return (self.grams / 1000) * self.price_per_kilo

    # Method to display a human-readable description of the fruit and its price
    def describe(self) -> None:
        print(f'{self.grams}g of {self.name} costs ${self.total_price}.')


# Main function to demonstrate usage
def main() -> None:
    # Create a Fruit object with initial values
    apple: Fruit = Fruit('Apple', 1500, 5)

    # Display the object — this shows the dataclass fields
    print(apple)
    # Output: Fruit(name='Apple', grams=1500, price_per_kilo=5)

    # Use the describe method (uses total_price property)
    apple.describe()
    # Output: 1500g of Apple costs $7.5

    # Update the price per kilo
    apple.price_per_kilo = 20

    # Print the object again to confirm updated price per kilo
    print(apple)
    # Output: Fruit(name='Apple', grams=1500, price_per_kilo=20)

    # Call describe again, which will now show the new total_price automatically
    apple.describe()
    # Output: 1500g of Apple costs $30.0


# Run the main function when the script is executed
if __name__ == '__main__':
    main()
