# Week 01, Day 03

---

# Agenda

1. Check-In
2. Homework
3. Demonstration
4. Set up Journals
5. Work Time
6. Lunch
7. Testing
8. HW

---

# Check-In

---

# Homework

---

# Demonstration

---

# Set up Journals

---

1. `cd ~/code`
2. `mkdir yourgithubusername.github.io`
3. `cd yourgithubusername.github.io`
4. `git init`
5. `mkdir posts`

---

# Journal

From now on, you'll write journal entries in this folder.

`2016-03-16-wednesday-journal.md`

---

# Journal

Later (in a week or two), we'll turn this into a live blog

---

# Journal Prompt

`2016-03-16-refactoring-with-methods.md`

What did you learn from the refactoring process? What did you see during the demo that you can do going forward? How did your approach differ from my approach? How were our approaches the same? If you were to do this again, how would you approach it?

---

# Lunch and Work Time

---

# Testing (the long way)

---

### How do you verify that your programs are correct? If you didn't have the `rake` test task, how would you do it?

---

## Steps of Testing

1. Setup
2. Assertions
3. Teardown

---

## Steps of Testing

**Setup** is where you create the conditions the test needs in order to start

---

## Steps of testing

**Assertions** (or the test proper) is where you perform the behavior being tested
and verify that it works.

---

## Teardown

**Teardown** is usually handled for you, but refers to destroying any database
records you created, etc.

---

## Testing Philosophy

1. Each test should test one thing and one thing only
2. You should test the "happy path" (when things work)
3. You should test various failure paths (when things don't work)

---

## Ad Hoc Tests

---

## Homework

---

## MySpace Name Generator

Write a method that, when provided with a string, converts that string into a
*MySpace name*. Here's what this looks like:

1. Prepend with `xX_`
2. Append with `Xx_`
3. Remove all whitespace (spaces, tabs, newline) and punctuation
4. Alternate caps and lowercase

---

## MySpace Name Generator

Thus, `Andrew Ek` should become `xX_AnDrEwEk_Xx`

---

## MySpace Name Generator

You'll need to write your own tests for this (write them the long way, rather than
with Minitest and Rake) for all methods.

---

## MySpace Name Generator

Think about:

1. Valid strings
2. All-Caps strings
3. Lower-case strings
4. Strings with mostly punctuation
5. Empty Strings
6. Strings containing numbers

---

## Bonus Homework

If you have time, pick another exercise from the ones listed on the issue, and give
that one a try.
