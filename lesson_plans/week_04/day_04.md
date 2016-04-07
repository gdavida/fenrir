# Week 04, Day 04

---

# Weekly Goal

Build our first MVC Application

---

# Daily Goals

+ Flesh out our RESTful routes
+ Handle associations with forms

---

# Agenda

---

# Agenda

1. Homework & Check-In
2. Finish out our RESTful Routes
3. Associations with Forms
4. Preview of Next Week
5. Project Description

---

# RESTful Routes

---

# RESTful Routes

+ new: `get '/insects/new'`
+ show: `get '/insects/:id'`
+ index: `get '/insects'`
+ edit: `get '/insects/:id/edit'`

---

# RESTful Routes

+ create: `post '/insects'`
+ update: `post '/insects/:id`
+ destroy: (we'll worry about this one later)

---

# RESTful Routes

With the `edit` action, we'll render a form much like we do with `new`.

---

# RESTful Routes

We have two new challenges, though:

1. We need to pre-populate the form with existing data
2. We need to carry the `id` over without (meaningfully) exposing it to the user.

---

# Associations with Forms

---

# Associations with Forms

With one-to-many relationships, we have to be able to set our foreign key somehow using a form.

---

# Associations with Forms

We'll stick the form element in form associated with the model with the foreign key.

---

# Associations with Forms

For a one-to-many, the most conventional way to do this is with either a *select* menu or with *radio buttons*.

(There are other ways, too; usually it's some sort of autocomplete text field)

---

# Associations with Forms

Regardless of what sort of input type we use, the *value* we submit should be the foreign key id itself, and the *name* of the input should be something like `researcher_id`, e.g. the foreign key column.

---

# Association with Forms

The last task for us is figuring out how to make the right value be pre-selected on the *EDIT* action.

---

# Associations

As we display both our objects and their related records in our views, we need to be mindful of how many database queries we make.

It's common to see `n + 1` queries, especially on index pages.

---

# Associations

There exist techniques to reduce the number of database queries we make for a single request, including *eager loading* and *joins*. We'll talk about those in a few weeks.

---

# Associations

We'll talk next week about how to work with HABTM relationships with forms.

---

# Next Week

---

# Next Week

+ **Monday**: Project review, testing, field trip
+ **Tuesday**: HABTM, Deployment, Project Design
+ **Wednesday - Friday**: Project (independent)

---

# The Coming Weeks

We'll spend a few weeks augmenting our Sinatra applications (CSS styling, JS behavior, more complex interactions), then we'll switch to Rails.

---

# Homework

---

# Homework

Rebuild the Library, but as a Sinatra application.

It should:

+ Preserve functionality of models and tests
+ Follow RESTful route conventions
+ Allow associational interactions
