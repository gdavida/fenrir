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
  
  # Assume a good date unless told otherwise
  valid_date = true
  
  #### VALIDATE MONTH ###
  month_valid = validate_month(month)

  if month_valid == false
    valid_date = false
  end
  ########################

  year_valid = validate_year(year)
  
  if year_valid == false
    valid_date = false
  end

  ########################

  # Determine if we've got a leap year
  leap_year = determine_if_leap_year(year)

  ########################

  if month == 2 && leap_year
    if day < 1 || day > 29
      valid_date = false
    end
  elsif month == 2 && ! leap_year
    if day < 1 || day > 28
      valid_date = false
    end
  elsif month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12
    if day < 1 || day > 31
      valid_date = false
    end
  elsif month == 4 || month == 6 || month == 9 || month == 11
    if day < 1 || day > 30
      valid_date = false
    end
  else
    # month isn't listed
    valid_date == false
  end

  valid_date
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
  if year < 1880 || year > 2280
    false
  else
    true
  end
end

# Determines if we've got a leap year
#
# + year: integer representing the year
#
# Returns true if YEAR is a leap year, otherwise false
def determine_if_leap_year(year)
  year % 4 == 0 && year % 100 != 0 || year % 400 == 0
end

