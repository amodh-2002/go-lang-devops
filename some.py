# write me a program that prints out the number of seconds in a year
# (365 days, 1 day = 24 hours, 1 hour = 60 minutes, 1 minute = 60 seconds)
# Your output should be in the format of: "There are <seconds> in a year"

# Your code here
seconds = 60
minutes = 60
hours = 24
days = 365

seconds_in_a_year = seconds * minutes * hours * days
print(f"There are {seconds_in_a_year} in a year")

# Run the file
# python3 some.py

# Output
# There are 31536000 in a year
