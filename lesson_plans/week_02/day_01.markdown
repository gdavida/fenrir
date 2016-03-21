# Week 02, Day 01

---

# Agenda
![](https://upload.wikimedia.org/wikipedia/commons/8/81/Kodiak_bear_in_germany.jpg)

---

# Agenda

1. Check-In
2. Clean-Up
3. More Advanced Methods
4. **BEAR FARM FOR BEARS**
5. Objects and Classes
6. Homework

---

# Check-In
![](https://upload.wikimedia.org/wikipedia/commons/7/71/2010-kodiak-bear-1.jpg)

---

# Clean-Up
![](http://kodiakbearcenter.com/wp-content/uploads/2015/03/bears.jpg)

---

# Clean-Up

+ Indentation
+ Documentation
+ Only one `return` (even if it's implicit)

---

# More Advanced Methods
![](https://www.kodiak.org/uploads/gallery_slides/image/.1400x800/bears_8.jpg)

---

# More Advanced Methods

1. Default Values
2. Splat Operator
3. Options Hash

---

# More Advanced Methods: Default Values
![](http://blogdailyherald.com/wp-content/uploads/2014/09/Brown-Bear-and-Cubs1.jpg)

---

# More Advanced Methods: Default Values

You can set default values for parameters, making them *effectively optional* (but not quite optional)

Here's the way we've been doing it:

```ruby
  def say_hello(name)
    puts "Hello, #{name}"
  end
```

---

# More Advanced Methods: Default Values

And here is the new-ish way with default parameter values

```ruby
  def say_hello(name="human")
    puts "Hello, #{name}"
  end
```

---

# More Advanced Methods: Default Values

Use this technique when you can assume a safe default and when a parameter is truly optional. Don't use it otherwise.

---

# More Advanced Methods: Default Values

`nil` is a fine default value. So are empty strings, hashes, or arrays.

---

# More Advanced Methods: SPLAT!
![](http://themysteriousworld.com/wp-content/uploads/2014/01/Kodiak-bear.jpg)

---

# More Advanced Methods: SPLAT!

Sometimes you want to pass a list of arguments to a method:

```ruby
  def say_hello(names=[])
    names.each do |name|
      puts "Hello, #{name}"
    end
  end
```

---

# More Advanced Methods: SPLAT!

When you've already got an array, this is easy-peasy. But sometimes you don't already have an array. SPLAT! operator to the rescue!

---

# More Advanced Methods: SPLAT!

```ruby
  def say_hello(*names)
    names.each do |name|
      puts "Hello, #{name}"
    end
  end

  say_hello("Fido", "Fifi", "Rex")
  
  # equivalent to:
  # say_hello( ["Fido", "Fifi", "Rex"] )
```

---

# More Advanced Methods: Options Hash
![](http://stmedia.startribune.com/images/bear012115.jpg)

---

# More Advanced Methods: Options Hash

Methods, the way we've been using them, require parameters to be given in specific order. This isn't a big deal now, but some methods we write (hint: later today) will have enough parameters that this becomes obnoxious.

---

# More Advanced Methods: Options Hash

```ruby
  def valid_date?(month, day, year)
    # method body omitted for brevity
  end
```

---

# More Advanced Methods: Options Hash

Rather than passing a list of values, we pass a hash. We still have to provide the right arguments (with the right keys), but order doesn't matter as much.

---

# More Advanced Methods: Options Hash

```ruby
  def valid_date?(options={})
    month = options[:month]
    day = options[:day]
    year = options[:year]

    # the rest of the method continues as normal
  end
```

---

# More Advanced Methods: Options Hash

Or you can just work with the options hash directly:

```ruby
  def valid_date?(options={})
    year_valid?(options[:year]) && 
    month_valid?(options[:month]) &&
    day_valid?(options[:day], options[:month], options[:year])
  end
```

---

# More Advanced Methods: Options Hash

More succinctly:

```ruby
  def valid_date?(options={})
    year_valid?(options[:year]) && 
    month_valid?(options[:month]) &&
    day_valid?(options)
  end
```

---

# More Advanced Methods: Options Hash

We can call our method (with its new options hash) like so:

```ruby
  options = { month: 3, day: 21, year: 2016 }
  puts valid_date?(options)
```

---

# More Advanced Methods: Options Hash

Or we can define the hash literal as a parameter:

```ruby
  puts valid_date?({month: 3, day: 21, year: 2016})

  # or

  puts valid_date?({month: my_month, day: my_day, year: my_year})
```

---
# More Advanced Methods: Options Hash

If we're passing in an options hash and no other parameters, we can ignore the `{}` curly braces and just pass in key/value pairs:

```ruby
  puts valid_date?(month: 3, day: 21, year: 2016)
```

---

# More Advanced Methods: Options Hash

We can even re-arrange our key-value pairs without fear of negative consequences: 

```ruby
  puts valid_date?(year: 2016, month: 3, day: 21)
```

---

# BEAR FARM FOR BEARS
![](https://i.ytimg.com/vi/Tluaarbb0bE/maxresdefault.jpg)

---

# BEAR FARM FOR BEARS: Problem Statement

We have a lot of bears. Those bears need to farm. We need to keep track of our bears and their farms.

---

# BEAR FARM FOR BEARS: Problem Statement

We would like to know:

+ The general state of our bears
+ The general state of their farms

---

# BEAR FARM FOR BEARS: Problem Statement

Here's our process:

1. Start small
2. Get a little bigger
3. Get a little bigger still
4. Re-evaluate

---

# BEAR FARM FOR BEARS
![](https://upload.wikimedia.org/wikipedia/commons/8/81/Kodiak_bear_in_germany.jpg)

---

# Objects and Classes
![](https://upload.wikimedia.org/wikipedia/commons/7/71/2010-kodiak-bear-1.jpg)

---

# Objects and Classes

1. Statement of Purpose
2. State and Behavior
3. Attributes
3. Constructors
4. Getters and Setters
5. Adding Behaviors
6. BEAR FARM FOR BEARS

---

# Statement of Purpose
![](http://kodiakbearcenter.com/wp-content/uploads/2015/03/bears.jpg)

---

# Statement of Purpose

In large programs, particularly those with LOTS of moving pieces, it's difficult to keep things straight. *Object Oriented Programming* is a technique by which we:

1. Bundle related data and behaviors for ease of comprehension
2. Split our program into smaller pieces for ease of comprehension

---

# Statement of Purpose

There is nothing you can do with OOP that you can't do without. Additionally, some languages (like C, as well as some newer _functional_ languages) do not have objects, per se.

---

# Statement of Purpose

We do OOP to **make life easier for programmers**, rather than for computers.

---

# Statement of Purpose

In order to do OOP, we use _objects_ and _classes_. Objects are created from classes.

---

# Statement of Purpose

Classes represent a template (a description, really) of what an object will be.

---

# Statement of Purpose

The object itself is a specific instance of a class.

---

# Statement of Purpose

When we define a class, we do so like this:

```ruby
  # bear.rb
  class Bear
    # we'll fill this in as we go 
  end
```

---

# State and Behavior
![](https://www.kodiak.org/uploads/gallery_slides/image/.1400x800/bears_8.jpg)

---

# State and Behavior

With OOP, we're concerned with _state_ and _behavior_.

---

# State and Behavior

**State** refers to raw information about what something is and what characteristics it has. **State**, by itself, doesn't change. It just is.

---

# State and Behavior

**Behavior** refers to the methods an object can call. Some of these methods act on the object's *state* (and thus could change it). Some of them might act on other objects.

---

# Attributes / State
![](http://blogdailyherald.com/wp-content/uploads/2014/09/Brown-Bear-and-Cubs1.jpg)

---
# Attributes / State

So far, we've only dealt with *local variables* (scoped inside a method). But how do we keep track of an object's characteristics?

---

# Attributes / State

We use *instance variables* (or attributes: more on these in a second), which are scoped to an entire object, rather than just to a single method.

---

# Attributes / State

Instance variables are scoped to the entire class, and are thus available to all methods defined within a class. The values stored in instance variables (the attributes) are _not_ shared between objects of that class.

---
# Attributes / State

Attributes (instance variables) are like regular variables, but we prepend with `@`

```ruby
  @name = "Andrew"
```

But we can't use them until we've created our objects.

---

# Constructors
![](http://themysteriousworld.com/wp-content/uploads/2014/01/Kodiak-bear.jpg)

---

# Constructors

We create new objects using `.new`

```ruby
  bear = Bear.new
```

This creates a new _instance_. Creation is also called _instantiation_.

---

# Constructors

But this doesn't do anything with the object's attributes. If we want to give attributes to the object upon construction, we need to define a *constructor*.

---

# Constructors

To define the constructor, we create an `initialize` method. This method gets called as part of the object's construction (i.e. when we call `.new`.

The arguments we pass to `.new` get passed to `initialize` by default.

---

# Constructors

You shouldn't call an object's methods from inside `initialize`. You can also safely ignore validation in most cases.

---

# Constructors

When we move to using `ActiveRecord` (next week), you'll only define a `.new` method for non-model classes.

(Don't worry about this now)

---

# Constructors

Creating an object does not save it anywhere. It just exists, temporarily, in memory. If we create the object from a database record (for instance), modifying the object does not necessarily update the record.

---

# Constructors

```ruby
  class Bear
    
    def initialize(name, age, height)
      @name = name
      @age = age
      @height = height
    end
  end
```

---

# Constructors

```ruby
  class Bear
    
    def initialize(options)
      @name = options[:name]
      @age = options[:age]
      @height = options[:height]
    end
  end
```

---

# Constructors

```ruby
  class Bear
    
    def initialize(options)
      @name = options[:name]
      @age = options[:age] || 1
      @height = options[:height]
    end
  end
```

---

# Constructors

Now we can make a new bear:

```ruby
  bear = Bear.new(name: "Andrew", age: 30, height: "7-8")
```

---

# Constructors

What happens if our options hash is missing a key/value pair?

```ruby
  # We'll give it a name and height, but not an age
  bear = Bear.new(name: "Andrew", height: "7-8")
```

---

# Getters and Setters
![](http://stmedia.startribune.com/images/bear012115.jpg)

---

# Getters and Setters

We've given our object some attributes. But how do we get them? And how do we change them later?

---

# Getters and Setters

*Getter* methods fetch information. Most of the time, you'll have a getter method for each of your attributes, but not all of the time.

---

# Getters and Setters

```ruby
  class Bear

    def initialize(options)
      #...
    end

    # Here's our :name getter method, which just returns @name
    def name
      @name
    end
  
  end
```

---

# Getters and Setters

Now we can do something like this:

```ruby
  bear = Bear.new(name: "Andrew", age: 30, height: "7-8")

  puts bear.name
```

Getter methods are usually pretty simple.

---

# Getters and Setters

*Setter* methods set your attributes. What we want to be able to do is something like this:

```ruby
  bear = Bear.new(name: "Andrew")
  puts bear.name # Andrew

  bear.name = "Rufus"
  puts  bear.name # Rufus
```

---

# Getters and Setters

Here's how we'd define a setter method for `@name`:

```ruby
  class Bear
    # ...

    def name=(new_name)
      @name = new_name
    end
  end
```

---

# Getters and Setters

As written, is there anything preventing us from doing this?

```ruby
  bear = Bear.new(age: 30, name: "Andrew", height: "7-8")

  bear.age = -7318237

  puts "#{bear.name} is #{bear.age} years old"
```

---

# Getters and Setters

Setters can also impose constraints:

```ruby
  class Bear
    # ...

    def age=(new_age)
      @age = new_age unless new_age < 1
    end
  end
```

---

# Adding Behaviors
![](https://i.ytimg.com/vi/Tluaarbb0bE/maxresdefault.jpg)

---

# Adding Behaviors

We can (and will) add methods that are neither getters nor setters to our classes:

```ruby
  class Bear
    
    # ...

    def eat_some_food(food="delicious snacks")
      "#{name} ate some #{food}"
    end
  end
```

---

# Adding Behaviors

Methods are *pure* if they carry with them no side-effects. Side effects may include:

+ Output to the console
+ Changing the state of an attribute
+ Creating or modifying another object
+ Performing an external service interaction
+ Writing to the database

---

# Adding Behaviors

Getter methods are usually pure. Setter methods are never pure.

---

# Adding Behaviors

Is the `eat_some_food` method we defined earlier pure? Why or why not?

```ruby
  class Bear
    
    # ...

    def eat_some_food(food="delicious snacks")
      "#{name} ate some #{food}"
    end
  end
```

---

# BEAR FARM FOR BEARS
![](https://upload.wikimedia.org/wikipedia/commons/8/81/Kodiak_bear_in_germany.jpg)

---

# BEAR FARM FOR BEARS

Using what we just learned, let's re-tool our bear farm a bit.

---

# BEAR FARM FOR BEARS

Rules for objects and classes:

+ Only one class per file
+ Classes are named in `CapitalCamelCase`
+ Files are named in `snake_case`
+ The file name and class name should match (case notwithstanding)

---

# BEAR FARM FOR BEARS

Rules for objects and classes:

+ Attributes should describe the object, rather than being used as a convenient way to handle global state
+ Every attribute should have a getter method unless there's a good reason not to
+ Some attributes should have a setter method, but probably not all of them

---

# BEAR FARM FOR BEARS

+ Getter and setter method names should match the attribute name exactly unless there's a good reason otherwise
+ Make note of which methods have side effects and which ones do not.
+ Every class we make (for now) should have an `initialize` method which takes an options hash

---

# Homework
![](https://upload.wikimedia.org/wikipedia/commons/7/71/2010-kodiak-bear-1.jpg)

---

# Homework

Make a three of your own classes for objects (everyday objects are probably fine).  What attributes does each one have? How do you know? Why did you pick those? Add getter and setter methods. Are there any private (non-public-facing) attributes? If so, what are they?

Make three different classes (with real-world analogs). Don't worry about tests yet.

---

# Bonus Homework

Learn about `attr_reader`, `attr_writer`, and `attr_accessor`. What do they do?  How do you use them? Why do you use them?

---

# Bonus Homework

Read through [this article](http://www.daedtech.com/solid-principles-real-life/) on the SOLID Principles. It's okay if you don't understand it yet.

---

# Tomorrow
![](http://kodiakbearcenter.com/wp-content/uploads/2015/03/bears.jpg)

---

# Tomorrow

"Our Bears Get Farms," OR:

1. Testing Objects
2. Static methods
2. Collections of Objects
3. Objects interacting (passing messages)
4. Objects with other objects
5. SOLID

---

# Later This Week

+ Objects with objects with objects
+ Your first project

---

![](https://www.kodiak.org/uploads/gallery_slides/image/.1400x800/bears_8.jpg)
