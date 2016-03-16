# Date Validation

You will write a method which takes a date (as three arguments: the month, the day,
and the year), and which returns `true` or `false` depending on whether the date is
valid or not.

Here are some rules:

+ The month must be between 1 and 12 (inclusive)
+ The year must be between 1880 and 2280 (inclusive)
+ The day must exist within the month
+ You must account for leap years (look up how leap years work)
+ No using the `Date` class (we'll refactor to allow the `Date` class later this week)
+ Only worry about integer inputs

You'll call this method like so: `valid_date?(3, 14, 2016)` (March 14th, 2016).

As with the prep-work, you'll be able to run `rake` to run the tests.
