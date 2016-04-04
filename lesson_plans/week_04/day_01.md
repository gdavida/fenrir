# Week 04, Day 01

> Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it. 

-- Brian Kernighan

---

# Week's Objective

Build our first MVC web applications.

---

# Day's Objectives

1. Understand and create many-to-many relationships
2. Build our first web applications with Sinatra

---

# Agenda

1. Homework & Check-In
2. Many/Many Relationships
3. Mini-Project - HABTM practice
4. Web Applications with Sinatra
5. Homework

(Yoga at noon)

---

# Homework & Check-In

---

# Many-to-Many Relationships

---

# Many-to-Many Relationships

Our Bug Tracker currently has three models:

+ Insect
+ Researcher
+ Paper

These three models are related to each other through one-to-many relationships.

---

# Many-to-Many Relationships

We've covered *one-to-many* relationships already. They look something like this:

```ruby
class Researcher
  has_many :insects
end

class Insect
  belongs_to :researcher
end
```

---

# Many-to-Many Relationships

Now we want to track all the different places a given insect has been seen.

But here's the catch: some of these locations have multiple types of insects!

---

# Many-to-Many Relationships

How do we accomplish knowing both all the places an insect has been seen and all the insects seen in a place?

(As a hint, there are two generally accepted strategies)

---

# Many-to-Many Relationships

One strategy is to create a separate model to act as an intermediary:

```ruby
class Sighting
  belongs_to :insect
  belongs_to :location
end
```

---

# Many-to-Many Relationships

Then we could do something like this (spoiler: there's a better way):

```ruby
class Insect

  has_many :sightings
  def locations
    locations = []
    sightings.each do |s|
      locations << s.location
    end
    locations.uniq
  end
end
```

---

# Many-to-Many Relationships

We could simplify further using the [*has many through*](http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association) association:

```ruby
  class Insect
    has_many :sightings
    has_many :locations, through: :sightings
  end

  class Location
    has_many :sightings
    has_many :insects, through: :sightings
  end
```

---

# Many-to-Many Relationships

This lets us do the following:

```ruby
i = Insect.first # or some other Insect record
i.locations # => an array
```
---

# Many-to-Many Relationships

Unfortunately, we can't just add a location to an insect directly (or vice-versa); we have to create a Sighting record first.

---

# Many-to-Many Relationships

The nice thing about the *has many through* relationship is that it uses associations we already know. But it's clunky.

---

# Many-to-Many Relationships

If in `Sighting` we're only really linking insects and locations (rather than adding new information), then there is a better way.

---

# Many-to-Many Relationships

The more conventional way to do this is to create a *has and belongs to many* relationship, which requires no intermediate record.

---

# Many-to-Many Relationships

We'll create a **join table**, which is a special type of table containing two columns, each of which are a foreign key.

---

# Many-to-Many Relationships

```ruby
class CreateInsectsLocationsJoinTable < ActiveRecord::Migration
  def change
    create_table :insects_locations, id: false do |t|
      t.integer :insect_id
      t.integer :location_id
    end
  end
end
```

---

# Many-to-Many Relationships

How to name your join table

1. Take the table names for your two models
2. Put them in alphabetical order
  + Use the `<` and `>` operators if you are unsure
3. Stick an underscore between 'em.

---

# Many-to-Many Relationships

1. `Dog` and `Ball`
2. `Student` and `Teacher`
3. `Cat` and `Category`
4. `LlamaWrangler` and `Llama`

---

# Many-to-Many Relationships

As with most things, it's easiest to [let ActiveRecord do it for you](http://edgeguides.rubyonrails.org/active_record_migrations.html#creating-a-join-table):

```ruby
class CreateInsectsAndLocationsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :insects, :locations
  end 
end
```

---

# Many-to-Many Relationships

Once we have our join table, we can do this:

```ruby
class Insect
  has_and_belongs_to_many :locations
end

class Location
  has_and_belongs_to_many :insects
end
```

---

# Many-to-Many Relationships

```ruby
i = Insect.first
i.locations

l = Location.first
l.insects
```

---

# Many-to-Many Relationships

So which one do I use?

---

# Many-to-Many Relationships

Use **has and belongs to many** if all you need is the relationship.

Use **has many through** if you have some other model to keep track of.

---

# Web Applications

---

## How the Internet Works

---

## How the Internet Works

> [T]he Internet is not something that you just dump something on. It's not a big truck. It's a series of tubes.... [T]hose tubes can be filled ... [W]hen you put your message in, it gets in line and it's going to be delayed by anyone that puts into that tube enormous amounts of material....

-- Former Senator Ted Stevens

---

## How the Internet Works

---

## Structure of a URL

**https://www.google.com/search?q=search+queries**

---
## Structure of a URL

The first section is the *protocol*. This determines how information is sent.

**https://**www.google.com/search?q=search+queries

---
## Structure of a URL

Then we have the subdomain (sometimes).

+ https://**www**.google.com/search?q=search+queries
+ https://**images**.google.com
+ https://**admissions**.starcitycodeschool.com

---

## Structure of a URL

Then we have the domain name:

https://www.**google.com**/search?q=search+queries

---

## Structure of a URL

Then we have the path:

https://www.google.com/**search**?q=search+queries

---

## Structure of a URL

Finally, we have the query, which may contain one or more parameters:

https://www.google.com/search**?q=search+queries**

---

## Structure of a URL

We may also have a port:

http://localhost:**4567**/hello

All URLs have an implicit port of `80` or `443` unless otherwise specified.

---

## Structure of a URL

There are some other interesting facts. [Read more](https://doepud.co.uk/blog/anatomy-of-a-url).

---

## Requests

A web request consists of two parts:

+ A URL
+ An HTTP verb (usually `get` or `post`, but there are others)

---

## Requests

`get` requests fetch information from the server; the URL tells the server what to fetch.

`post` requests upload information to the server for it to store.

---

## Web Applications

Web applications have a few components:

1. The ability to handle and parse incoming requests
2. Logic around those requests (instead of just fetching files)
3. The ability to send a response

---

## Sinatra

[*Sinatra*](http://www.sinatrarb.com/intro.html) is a very lightweight web framework we'll use for the next few weeks.

It's build on `Rack`, which lets it act as a server for web applications.

---

## Sinatra

Installing and setting up Sinatra can be very easy:

```ruby
# Gemfile
gem "sinatra"
```
---

## Sinatra

```ruby
#main.rb
require "sinatra"

get "/" do
  "Hello!"
end
```

---

## Sinatra

We run sinatra by typing `ruby main.rb` in our command line. Then we open up `localhost:4567` in our web browser.

To end the Sinatra server session, simply use `CTRL+C`

---

## Routes and Matching

Your `main.rb` file will just be a list of routes and associated blocks.

Upon receiving a request, Sinatra compares it to the first route, and if they match, does that block. If not, it moves to the next route.

---

## More Dynamic Behavior

Right now, not much distinguishes our Sinatra application from a static page.  Let's add in some dynamic behavior.

---

## More Dynamic Behavior

I want to, as part of my URL, give Sinatra a name. Then the page should output `Hello, Andrew!` (or whatever the supplied name is).

---

## More Dynamic Behavior

There are two ways we can do this (we'll need both techniques):

1. Create a named parameter in the URL (as part of the path)
2. Pass it in as a query option

---

## More Dynamic Behavior

In either case, we'll make use of the `params` hash (this is very similar to the options hash we've used before in our `initialize` methods) Sinatra provides automatically for each request.

---

## Named Parameters in the URL

*Named Parameters* act sort of like the path of a URL, except that they are dynamically defined.

---

## Named Parameters in the URL

What this should look like:

1. We visit `localhost:4567/andrew`
2. Our text is `"Hello, andrew!"`

(Except with any name!)

---

## Named Parameters in the URL

Here's how we set this up:

```ruby

get "/:name" do
  "Hello, #{params['name']}!"
end
```

---

## Named Parameters in the URL

Now, with whatever path we enter, Sinatra will store that in `params['name']` for us to use.

---

## Named Parameters in the URL

We'll make really extensive use of this technique for the remainder of this course.

---

## Parameters from Queries

The other option we have is to simply provide the information as a query:

`localhost:4567/hello?name=andrew`

---

## Parameters from Queries

```ruby
get "/hello" do
  "Hello, #{params['name']}"
end
```

---

## Parameters from Queries

We'll also use this technique pretty extensively, though mostly when working with forms.

---

## Questions for Exploration

+ Can you have more than one named parameter in a URL?
+ Can you have more than one query in a URL?
+ Can you mix named parameters and queries?
+ What happens if you have two parameters (either named or from queries) with the same name?
+ Can you pass in integers as parameters? Floats? Booleans? If so, how?

---

## Questions for Exploration

+ Can you perform logic inside a route block?
+ Can you define your own methods and call them from a route?
+ Can you define methods in a class elsewhere then use those in a route?
+ If a route is accessed, can you redirect elsewhere? How? 

---

# Homework

---

# Homework - A

Sketch out and build the models, complete with relationships and validators, specified. Don't worry about building a driver. The tests should pass and it should work in Pry.

---

# Homework - B

Build your first Sinatra application. It should run, you should be able to access it through `localhost:4567`, and it should have routes as specified in the assignment file.

Once you're done with these, repeat them but with queries. Then consider the bonus exercises.

---

# Homework - C

Become comfortable with HTML. You should be able to:

1. Make headers, paragraphs, ordered lists and unordered lists.
2. Create forms with text fields, drop-down selects, radio buttons, checkboxes, and submit buttons. These forms shouldn't do anything yet.
3. Create links to other pages.
