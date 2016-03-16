# This method takes three arguments: month, date, and year, and returns either TRUE
# or FALSE (the boolean values, not the string representation of those boolean
# values) depending on whether the date is valid (i.e. does exist on the calendar)
# or is not valid (i.e. does not exist on the calendar).
#
# Here are the rules:
#
# + The month must be between 1 and 12 (inclusive)
# + The year must be between 1880 and 2280 (inclusive)
# + The day must exist within the month
# + You must account for leap years (look up how leap years work)
# + No using the `Date` class (we'll refactor to allow the `Date` class later this week)
# + Only worry about integer inputs (no floats, strings, etc.)
#
# This method should, in its final form, not do any output.

require 'pry'

def valid_date?(month, day, year)
  validate_day(day, month, year) &&
  validate_year(year) && 
  validate_month(month)
end

# Validates the month (expressed as integer)
# 
# + month: integer representation of month (e.g. Jan = 1)
# 
# Returns true if the month is valid, otherwise returns false
def validate_month(month)
  month >= 1 && month <= 12
end

# Validates the year (expressed as integer)
# Year should be between 1880 and 2280
#
# + year: integer representing year
#
# Returns true if the year is good, otherwise false
def validate_year(year)
  year >= 1880 && year <= 2280
end

# Determines if we've got a leap year
#
# + year: integer representing the year
#
# Returns true if YEAR is a leap year, otherwise false
def determine_if_leap_year(year)
  year % 4 == 0 && year % 100 != 0 || year % 400 == 0
end

# Determines whether the day exists within the month in question
#
# + day: integer for the day part of the date
# + month: integer for the month part of the date
# + year: integer for the year part of the date
#
# Returns true or false, depending on if the day actually exists
def validate_day(day, month, year)
  day >= 1 && day <= determine_days_in_month(month, year)
end

# Determine how many days are in a given month
#
# + month: integer representation of the month
# + year: integer representation of the year
#
# Returns 28, 29, 30, or 31, depending on how many days are in that month
def determine_days_in_month(month, year)
  days_in_month = {
                    1 => 31,
                    2 => determine_days_in_february(year), 
                    3 => 31,
                    4 => 30,
                    5 => 31,
                    6 => 30,
                    7 => 31,
                    8 => 31,
                    9 => 30,
                    10 => 31,
                    11 => 30,
                    12 => 31
                  }

  days_in_month.default = 0

  days_in_month[month]
end

# Helper method to determine how many days are in February
# based on whether the year is a leap year
#
# + year: integer representation of the year
#
# Returns either 28 or 29, depending on if the year is a leap year
def determine_days_in_february(year)
  if determine_if_leap_year(year)
    29
  else
    28
  end
end
