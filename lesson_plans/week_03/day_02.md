# Week 03, Day 02

---

# Agenda

1. Homework Review and Check-In
2. Validations
3. Relationships
4. Homework

---

# Homework Review and Check-In

---

# Validations

---

# Validations

Before saving our records to the database, we should *validate* them, that is, we should ensure they conform to some reasonable constraints.

---

# Validations

The most frequent validations we'll do are simply ensuring that an attribute is present (and not empty or nil), but we may also ensure that it meets other constraints.

---

# Validations

ActiveRecord provides us with some convenient validation methods, but we're not going to use those yet.

---

# Validation

Instead, we'll define two of our own methods:

+ `my_valid?`
+ `my_save`

(Don't worry; we'll stop using these soon)

---

# Validation

Here's the full contents of `my_create`:

```ruby
def my_save
  if my_valid?
    save
  else
    false
  end
end
```

(We'll create this inside our model(s))

---

# Validation

Now you'll need to define a `my_valid?` method:

```ruby
def my_valid?
  #... method goes here
end
```

It should return either `true` or `false` (depending on if the record is valid).

It may also print out error messages.

---

# Validation

You'll also want to write tests for your validations:

```ruby
  def test_validator_should_fail_insect_with_no_name
    i = Insect.create(name: "Fuzzy mantis", description: "Fierce and cuddly",
                      seen_by: "Andrew", location: "In a tree")
    assert(i.my_valid?, "should be valid at creation")

    i.name = nil
    refute(i.my_valid?, "should be invalid without a name")

    i.name = ""
    refute(i.my_valid?, "should be invalid with an empty name")
  end
```

---

# Interlude: Tests

For right now, you should write tests for your models, but don't write tests that involve saving to the database.

---

# Homework, Part A:

---

# Homework, Part A:

Per the description in the issue, add custom validation methods to your two models. Test thoroughly. We'll reconvene after lunch.

---

# Relationships

---

# Relationships

Right now, our Insects have a `seen_by` attribute. But now that we have researchers, what we really want is to be able to do is tell each researcher which insects they are responsible for researching.

---

# Relationships

Thus, each researcher will be responsible for many insects. We can further say that no researchers will share an insect.

---

# Relationships

This is called a *1-to-many* relationship.

---

# Relationships

What we want, then, is to be able to do things like this:

```ruby
  r = Researcher.first
  r.insects # gives us an array of insect objects

  i = Insect.first
  i.researcher # gives us the researcher assigned to them
```

---

# Relationships

We have two tables right now: `insects` and `researchers`.

---

# Relationships

Thus, we can store the relationship in one of three places:

1. In the `insects` table
2. In the `researchers` table
3. In a new table (with maybe a new model?)

---

# Relationships

In addition, we have to think about *how* we're going to represent these relationships, and what information we might use to make sense of those.

---

# Relationships

The answer comes to us in the form of *primary keys* and *foreign keys*.

---

# Relationships

Each record (and each table) has its own *primary key id*, which is guaranteed to be unique within a table.

---

# Relationships

Thus, we can do things like this:

```ruby
  i = Insect.find_by_id(7)
  r = Researcher.find_by_id(43)
```

---

# Relationships

We also can set a *foreign key* in a model, which corresponds to the primary key of a record of another model.

---

# Relationships

In a *one-to-many relationship*, the foreign key goes into the model on the "many" side.

---

# Relationships

Since each researcher will have many insects, we'll put the foreign key in the `Insect` model.

---

# Relationships

Primary keys are named `id`. Foreign keys are named something like `researcher_id` (where the first part is the singular name of the model it belongs to)

---

# Relationships

+ one dog has many tennis balls
+ one class has many students
+ one teacher has many students
+ one student has many assignments

---

# Relationships

A given model may have several associations with other models.

For example:

One class has many teachers and many students

---

# Relationships

To add a foreign key, we'll need to do a few things:

1. Write a migration to add the foreign key column (always an integer)
2. Write both of those associative methods
3. Create some records and test them out!

---

# Relationships

Given this method, is it possible for an insect to belong to multiple researchers?

---

# Homework - B

Create the relationships between `Insect` and `Researcher`. I should be able to do the following (`i` is an Insect, `r` is a researcher)

1. `i.researcher` - get the associated researcher
2. `r.insects` - get an array of associated insects
3. `i.researcher = Researcher.first` - assign a new researcher to the insect

---

# Homework - B - BONUS METHOD

+ `r.add_insect( i )` - assign an insect to the researcher

---

# Homework - B

Don't worry too much about handling rules around these associations. Keep it simple.

So long as you can create associations and change those associations, everything else is good.

---

# Homework - C

Consider adding on one or more of the following:

+ An insect belongs to a genus
+ A researcher belongs to a cohort
+ A researcher has many papers, each of which are about a bug (does a bug then also have many papers?)

---

# Homework - D

Do some research into ActiveRecord Validations. If you want to, you can replace your `my_valid?` method with the default `valid?` method ActiveRecord provides.  See if you can make the change over. We'll work on this tomorrow.

---

