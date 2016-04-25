# Week 07, Day 01

---

# Goal for the Week

Become good enough with Javascript that we can successfully execute some basic DOM manipulation.  

---

# Goals for the day.

1. Review and reflect on projects and the class at large.
2. "Command Line" Javascript.

---

# Agenda

1. Project Show & Tell
2. Check-in & Feelings
3. Homework Review (JS)
4. Javascript!
5. Homework!

(Yoga at noon)

---

# Project Show & Tell

1. Pick a single feature
2. Walk us through that feature, making sure to show all relevant code. Consider this as a curated tour.

---

# Check-In & Feelings

1. How are you doing this week relative to last week?
2. How did Howlr go relative to your project from the previous week? What parts of the process went well? Which parts didn't? Why?
3. What will you do differently in future (full-stack) projects based on what you've learned so far?

---

# Homework Review

---

# Javascript!

1. The role of Javascript
2. Javascript on a page
3. The basic structures (brief review)
4. `prompt` and `alert`
5. Our first event listener

---

# The Role of JS

---

# Javascript on the Page

In the `head` of your document:

```
  <script src = "./myStyleSheet.js"></script>
```

---

# Syntax and Style Notes

1. Variables should be `camelCased` (rather than `snake_cased`).
2. Most lines end with a `;` (semicolon) unless that line starts a block.
3. Blocks must be surrounded by curly braces.
4. Expect some weird inconsistencies.

---

# Basic Structures

1. Variables
2. Strings and numbers
3. If-Statements
4. Loops
5. Arrays
6. Functions 

---

# Variables

Variables work almost like they do in Ruby, but with one major exception. You have to declare a variable before you can use it (otherwise you'll get weird scope errors later).

---

# Variables

```javascript
  var x = "This is where the treasure is";
  console.log(x);
```

---

# Strings and Numbers

Javascript has strings and numeric types, just like Ruby. There are other types too (booleans, arrays, object literals, etc.), but strings and numerics are pretty common.

---

# Strings and Numbers

```javascript
  var x = "This is where the treasure is";
  var doubloonCount = 5000;
```

---

# Strings and Numbers

Math works just like it does in Ruby (with the same operator precedence), though
some operators may be different.

---

# String and Numbers

Javascript also has concepts of *type coercion* and *strict equality*:

```javascript
  console.log("2" == 2);
  console.log("2" === 2);
```

---

# If-Statements

```javascript
  if (x % 2 == 1) {
    console.log("Odd!");
  } else if (x % 2 == 0) {
    console.log("Even");
  } else {
    console.log("Neither even nor odd.");
  }
```

---

# Arrays

```javascript
  var numbers = [1, 2, 3, 4, 5];
  var names = ["Anders", "Galen", "Tori", "Saul", "Ellen"];

  console.log(names.length);
  console.log(names[0]);
```

---

# Loops

1. `for` loops
2. `while` loops
3. `for/in` loops

---

# Loops

```javascript
  for (i = 0; i < names.length; i++) { 
    console.log(names[i]);
  }
```

---

# Loops

```javascript
  var i = 0;
  while (i < names.length) {
    console.log(names[i];
    i++;
  }
```

---

# Loops

```javascript
  for (name in names) {
    console.log(name);
  }
```

---

# Functions

```javascript
  function hello(name) {
    console.log("Hello, " + name + "!");
  }

  hello("Starbuck");
```

---

# Functions

```javascript
  mySum = sum(12, 4);
  console.log(mySum);
  
  function sum(a, b) {
    return a + b;
  }
```

---

# Functions

```javascript
  
  var firstHello = hello();
  var secondHello = hello;

  function hello() {
    return "Howdy!";
  }
```

---

# `prompt` and `alert`

It's not reasonable to expect our users to examine the console for Javascript input and output. So let's add some dynamic behaviors using `prompt` and `alert`:

---

# `prompt` and `alert`

```javascript
  var userInput = prompt("What's your name?");
  alert("Your name is " + name + ".");
```

---

# `prompt` and `alert`

We'll add some better functionality tomorrow. For today, we're stuck with prompting and alerting.

---

# Our First Event Listener

---

# Our First Event Listener

When working with the DOM (more on that tomorrow), we'll primarily work with it by defining functions that trigger when certain events happen. One of those events is the `"click"` event.

Today we'll call these functions in-line. Later, we'll add event listeners dynamically.

```html
  <a href="#" onclick="sayHi();">Want to be greeted?</a>
```

---

# Homework!

---

# Homework A

Given the starter HTML, write some Javascript to complete these exercises (matching the video). The exercises might look a bit familiar. Each piece should go in its own function which you call with an `onClick` attribute.

If you need to, go back and review Exercises **1 - 44** in *ASWtLJ* (or equivalent material).

---

# Homework B

Do Exercises **45 - 68** in *ASWtLJ*. By tomorrow morning, you should be able
to:

+ Describe the DOM
+ Select DOM elements within a page by ID or Class
+ Adjust styles, contents, or other attributes of DOM elements

---

# Homework C

**Journal Prompt**: Do some comparing and contrasting (with code samples) between Javascript and Ruby. How are variables created? What data types exist?  How about `if`-statements? Loops? Arrays? Methods? What are the relative advantages and disadvantages of Javascript as compared to Ruby? Given the four languages we know so far (Ruby, Javascript, HTML, and CSS), what is the purpose of each? How do they combine to form an application? How do they fit into the MVC structure as you know it so far?
