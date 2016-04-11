# Week 05, Day 01

---

# Weekly Goal

Get closer to the canonical MVC structure and build our own application

---

# Daily Goal

1. Do a lot of cleaning up
2. Our first field trip!

---

# Agenda

1. Check-In, Project Review
3. Cleaning Up
  + Workflow
  + Better models, views, and controllers (routes)
  + Better `require` statements
4. Field Trip!

(Yoga at noon)

---

# Field Trip Preparations

---

# Check-In and Feelings

---

# Project Review

---

# Cleaning Up

---

# Cleaning Up - Checklist:

+ Do your routes follow the RESTful pattern, e.g. `/libraries/7` instead of `/library/7`?
+ Can you cleanly navigate through the application?
+ Are all your `get` routes free from database-writing?
+ 

---

# Cleaning Up: Views

---

# Cleaning Up: Models

---

# Cleaning Up: Routes

---

# Cleaning Up: `require_relative` 

---

# Cleaning Up: `require_relative`

```ruby
Dir[File.dirname(__FILE__) + '/app/models/*.rb'].each {|file| require file }
```

---

# Homework

---

# Homework - A

Clean up your Library Project from last week as best you can.

---

# Homework - B

Start thinking about a project idea. If you have time, come up with a spec.

---

# Homework - C

What questions do you have so far about Sinatra? About web applications? Write 'em down and bring 'em. I'll do mini-sessions throughout the rest of the week.
