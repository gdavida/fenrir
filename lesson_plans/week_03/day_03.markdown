# Week 03, Day 03

---

# Agenda

1. Homework & Check-In
2. Feature branches
3. ActiveRecord validations
4. ActiveRecord associations
5. Mapping out your driver
6. Tonight's Homework

---

# Homework & Check-In

---

# Feature branches

---

# Feature branches

When we need to make big changes to our code, how do we preserve our old copy in case we need it?

---

# Feature branches

Git provides the ability to create *branches*, which effectively create an isolated, alternate timeline for your code.

---

# Feature branches

To work in a branch that currently exists, just check it out:

`git checkout my-feature-branch`

---

# Feature branches

To check out a new branch, add the `-b` tag.

`git checkout -b my-feature-branch`

---

# Feature branches

To see a list of all of your branches:

`git branch`

---

# Feature branches

Your current branch is displayed in your terminal.

---

# Feature branches

From now on, your `master` branch is untouchable directly (except for your initial commit). 

---

# Feature branches

Think of `master` as "the latest stable version"

---

# Feature branches

```
  git checkout -b my-new-feature
  # make lots of changes
  git checkout master
  git merge my-new-feature
```

---
# Feature branches

Most of the time, git knows how to handle that merge gracefully.

Sometimes it does not and you will get a *merge conflict*.

---

# Feature branches

If you get a merge conflict, open the affected files and look for things like this:

```ruby
  <<<<<<<<<<<<<HEAD
  puts "hello world"
  =============
  puts "hello, world"
  >>>>>>>>>1ab587h
```
---

# Feature branches

To reiterate:

1. No more touching the `master` branch except to merge into it
2. Do all your work on well-named feature branches
3. `master` should always be ready to go
4. Create new branches liberally
5. Make sure to commit all changes before switching branches

---

# Feature branches

You can even push branches to GitHub and create pull requests on your own repositories!

`git push origin my-awesome-feature`

---

# Validations

---

# Validations

Yesterday, we created our own `my_valid?` method. It works okay. We can do better.

---

# Validations

ActiveRecord provides a host of validators for us. Let's make use of those.

---

# Validations

```ruby
  class Insect < ActiveRecord::Base

    validates :name, presence: true
  end
```

---

# Validations

Now, we can do things like this:

```ruby
  mantis = Insect.new(name: "Furry Mantis", researcher_id: 1,
                      description: "Insists on making sure everyone has snacks",
                      location: "Anywhere there are people")
  mantis.new_record? # => true
  mantis.valid? #=> true
  mantis.name = nil
  mantis.valid? #=> false
  mantis.save => #=> won't save, false instead
```

---

# Validations

ActiveRecord also gives each AR-object an `errors` hash that we can inspect.

```ruby
  mantis.errors
```

---

# Validations

Here are some other validations we might use:

+ `inclusion`
+ `length`
+ `uniqueness`

---

# Validations

We can also pass in options, like `:allow_blank` and `:allow_nil`

---

# Mini-Project

Replace your `my_valid?` methods with ActiveRecord validations. Do this piece by piece. Make sure to update the tests appropriately. Do this all in a feature branch, then merge back into master when you're ready.

---

# Associations

---

# Associations

Yesterday, we created associations by hand. ActiveRecord has some nice methods to do this for us.

---

# Associations

+ `has_many`
+ `belongs_to`

---

# Associations

In your model with the foreign key, you'll stick a `belongs_to`. For example, since our `Insect` model has a `researcher_id`, we'll replace our previous associational methods with `belongs_to :researcher`

---

# Associations

This gives our `Insect` objects the ability to look up their researcher. It
doesn't allow our researchers to look up their insects.  

For that, we'll need `has_many`

---

# Associations

```ruby
  class Insect < ActiveRecord::Base
    
    # validation methods

    belongs_to :researcher
  end
```
---

# Associations

```ruby
  class Researcher < ActiveRecord::Base
    
    # validation methods here

    has_many :insects
  end
```
---

# Associations

`belongs_to` goes in the model with the foreign key.

`has_many` goes in the model without the foreign key (and to whom the other foreign key refers).

---

# Associations

This lets us do all sorts of exciting things:

+ `my_insect.researcher = another_researcher`
+ `1my_researcher.insects << some_new_insect`
+ `my_researcher.insects.where(location: "FUSE")`
+ `insect.build_researcher(name: "Some new researcher", age: 73)`

---

# Mini-Project

Replace your relationships (written the long way) with ActiveRecord associations. Then play around with it a bit.

---

# Drivers

---

# Drivers

There are seven "cardinal routes":

+ Index
+ New (and create)
+ Edit (and update)
+ Show
+ Destroy

---

# Drivers

---

# Tonight's Homework - A

Given the project specifications, plot out:

1. What you think the driver path will look like
2. What your plan of attack will be (in terms of which features you'll build first, second, third, and so on).

Don't start building this until you've gotten my sign-off (tomorrow morning).

---

# Tonight's Homework - B

Build out the driver for one of your BugTracker classes per the example. If that works and feels good, build it out for a second class. And so on.

---

# Tonight's Homework - C

Do more playing with ActiveRecord validations and associations. Add more classes
to your BugTracker.

