user_age = input("Enter your age: ")
age_number = int(user_age)

months = age_number * 12
seconds = age_number * 365 * 24 * 60 * 60
print(f"{age_number} is equal to {months} months and {seconds} seconds.")
