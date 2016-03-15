# Week 01, Day 02
## Ruby, Top to Bottom

---

# Agenda

1. Check-In
2. Homework Review
3. Journal Setup
3. Ruby, Top to Bottom
4. Homework

---

# Check In

---

## What is Pry?

---

## How do you run tests?

---

## How do I make a directory inside the current directory?

---

## In `git push origin master`, what is `master`? What is `origin`?

---

# Homework Review

---

# Ruby, Top to Bottom

---

# Naming Conventions

---

File names should:

+ be lower-cased in name
+ be snake-cased
+ have only letters and underscores
+ start with a letter

---

# Good:

+ `wombat.rb`
+ `giraffe_wrangler.rb`

---

# Bad:

+ `Wombat.rb`
+ `giraffewrangler.rb`
+ `1337HaX0rZ.rb`

---

# Output

---

+ Double-quoted strings unless otherwise necessary
+ String interpolation instead of concatenation
+ Blank lines and tabs where appropriate

---

`puts "Hello, #{name}"` 

instead of 

`puts "Hello, " + name`

---

## Starting today, _most_ of your methods will not output anything.

---

## Use `p` to inspect the value of a variable

---

# Variables

---

+ `snake_case`
+ Can include letters, numbers, and underscores
+ Should not start with a number or underscore
+ `SCREAMING_SNAKE_CASE` for constants
+ Should not include the type
+ Full words instead of abbreviations or acronyms
+ Favor readability over ease of typing

---

## Use lots of well-named variables to make your code more readable. Avoid multi-use variables.

---

## Use compound assignment operators when possible:

+ `+=`
+ `-=`
+ `*=`

Avoid `/=` and `%=`

---

## Good

+ `wombat_wrangler`
+ `very_long_variable_name`
+ `flux_capacitor_count`

---

## Bad

+ `name_string`
+ `x`
+ `thing`
+ `123_my_variable`
+ `myVariable`

---

# Math

---

+ Spaces between operators and values
+ Explicit casting where appropriate
+ Break a complex operation into simpler parts wherever possible
+ Favor readability

---

# Input

---

+ Use `gets.chomp` instead of `gets`
+ Provide a clear prompt

---

# If Statements

---

+ Prefer `if` to `unless` almost exclusively
+ If your conditional is complex, abstract it into a method of its own
+ Use `==` instead of `=`
+ (Advanced) Take advantage of "truthiness" and "falsiness"

---

+ Unless it's a tagged if, provide an `else` block (even if it does nothing)
+ With complex boolean logic, use parentheses to simplify `&&` and `||`

---

```ruby
  if user.banned? == true
    refuse_access
  end
```

---

```ruby
  if user.banned?
    refuse_access
  end
```

---

```ruby
  refuse_access if user.banned?
```

---

```ruby
  allow_access unless user.banned?
```

---

## Truthiness and Falsiness

Within the context of boolean logic:

+ `nil` and `false` both act like `false`
+ Everything else acts like `true`

---

# Loops

---

+ prefer `while` for sentinel controlled loops
+ prefer `.times do` for counter-controlled loops
+ prefer `.each`, `.map`, or `.select` when working with collections 

---

# Arrays

---

+ Create an empty array with `[]` instead of `Array.new`
+ Add elements with `.push` or `<<`
+ Keep like elements in the array
+ Prefer arrays for lists whenever possible

---

## If your array is really long, use line-breaks:

```ruby
  my_array = [ "One",
               "Two",
               "Three"
             ]
```
---

# Hashes

---

+ Use symbols for keys instead of strings, integers, or other objects
+ Get all keys with `.keys`. Iterate over keys with `.each_key`
+ Use hashes to store related information of different types
+ Be consistent about use of JSON-style or Hash-Rocket style.

---

```ruby
  license = { 
              name: "Andrew Ek",
              number: "H12345-678",
              height: "7-4"
            }
```

---

```ruby
  license = { 
              :name => "Andrew Ek",
              :number => "H12345-678",
              :height => "7-4"
            }
```

---

## Hashes and arrays are, by far, the most common collections we'll interact with.

---

# Methods

---

```ruby
  def my_method(name, age, height)
    "#{name} is #{age} years old and #{height} tall"
  end
```

---

+ If providing arguments, call with parentheses
+ If no arguments, call without parentheses
+ Methods ending in `?` return `true` or `false`
+ No space between method-name and parentheses

---

+ Clear, verb names
+ Well-named parameters
+ Return a single value or object
+ Prefer implicit `return`
+ If using `return` statements, use only once per method at the very end

---

### Methods should do one thing and one thing only (single responsibility principle)

---

### If a method does output, or modifies state, it should not do calculations.

---

### If a method does calculations or other logic, it should only return the result instead of doing any output.

---

# Method Documentation

---

## Use a [simplified TomDoc](http://tomdoc.org/)

---

# All methods you write should have documentation for:

+ A basic description
+ All parameters (with type and description)
+ What gets returned, if anything

---

```ruby
  # Given an age, height, and name, build a descriptive string
  #
  # name: string representing the name
  # age: integer representing age in years
  # height: string representing height with units (e.g. "five feet four inches")
  #
  # Returns the constructed string
  #
  def my_method(name, age, height)
    "#{name} is #{age} years old and #{height} tall"
  end
```

---

# Blocks

---

---

# Sandi Metz's Rules

---

## 1. No class should have more than 100 lines of code

---

## 2. No method should have more than 5 lines of code

---

## 3. No method should take more than 4 parameters (each hash option counts as a parameter)

---

## 4. Only one object instantiated per controller

---


---

# Homework

---

### Revise yesterday's assignment to follow Sandi Metz's rules, and make sure to document all methods you use. Make sure to follow the _single responsibility principle_.

---

# Journal Prompt

---

### What did you notice about doing this refactoring? What was challenging? What was easy? What surprised you? Do you feel like your code is better? Worse? The same?
