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
+ `my_create`

(Don't worry; we'll stop using these soon)

---

# Validation

Here's the full contents of `my_create`:

```ruby
def my_create
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
    refute(i.valid?, "should be invalid without a name")

    i.name = ""
    refute(i.valid?, "should be invalid with an empty name")
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

# Homework
