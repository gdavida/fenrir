# Week 07, Day 02

---

# Weekly Goal

Do basic DOM manipulation and logic with Javascript.

---

# Daily Goal

Manipulate the style and contents of elements in the DOM.

---

# Agenda

---

1. Homework & Check-In
2. DOM Manipulation

---

# Homework & Check-In

---

# DOM Manipulation

---

# What is the DOM?

---

# What is the DOM?

The *Document Object Model* is just a representation of HTML (and XML, and XHTML) as a *tree* with a variety of nodes. The browser reads HTML, builds and renders the DOM from that HTML.

---

# What is the DOM?

Most of the Javascript we cover in this course is primarily concerned with modifying the DOM.

---

# Selecting Elements from the DOM

---

# Selecting Elements from the DOM

Before we can modify elements on the DOM, we have to find them. We have four strategies:

1. **Select by ID**
2. **Select by class-name**
3. Select by element type
4. Select relative to a parent, child, or neighbor

---

# Selecting Elements by ID

Given this HTML:

```html
  <h1 id="my-header">This is My Header</h1>
```

We can *select this element by ID* like so:

```javascript
  var myHeader = document.getElementById("my-header");
```

This requires that we follow the convention of unique IDs for elements.

---

# Selecting Elements by Class Name

Given this html:

```html
  <ul>
    <li class="list-item">First</li>
    <li class="list-item">Second</li>
  </ul>
```

We can select those `li` objects like so:

```javascript
  var listItems = document.getElementsByClassName("list-item");
```

---

# Selecting Elements by Tag

---

# Selecting Elements from Parent or Child Nodes

---

# Changing contents of an elements on the DOM

---

# Changing styles of elements on the DOM

---

# Adding and removing classes 

---

# Adding and removing classes

The hard thing about styling elements through Javascript is that if you ever decide to re-theme your site, you have to also modify your Javascript.

For this reason, it is often easier to re-style elements by adding or removing classes (which in turn modify appearance based on CSS) than it is to modify styles directly.

---

# Adding and removing classes



---

# GitHub Pages

---

# Homework

Build a Tic-Tac-Toe game (given the starter HTML). It should:

1. Alternate between players
2. Output the winner (or a tie)
3. Allow the user to reset the game without resetting the page

There are a few bonus objectives, too.
