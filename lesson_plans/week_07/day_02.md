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

# Agenda

1. Homework & Check-In
2. DOM Manipulation
3. Homework

---

# Homework & Check-In

---

# MVC Review

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

# Selecting Elements by ID

We will most frequently select individual elements by their ID.

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

Sometimes you want to select all the elements of a given tag (for example, all the `p` elements):

```javascript
  var paragraphs = document.getElementsByTagName("p");
```

In practice, we won't do this very often.

---

# Selecting Elements from Parent or Child Nodes

Given the DOM tree, we sometimes want to select a parent or child node (relative to our current node). 

We're going to ignore this for now and instead select elements by id.

---

# Changing contents of an elements on the DOM

---

# Changing contents of an element on the DOM

First, we need to be able to access the contents of a given node:

```javascript
  title = document.getElementById("title");
  titleText = title.innerHTML;
```

---

# Changing contents of an element on the DOM

From here, we can just re-assign the contents:

```javascript
  title.innerHTML = "This is my new content";
```

So long as you can select an element, you can modify its contents.

---

# Changing styles of elements on the DOM

---

# Changing styles of elements on the DOM

We can modify (inline) the attributes (mostly styles, but other attributes as well) of DOM elements:

```javascript
  var title = document.getElementById("title");
  title.setAttribute("style", "color: red");
```

Once we run this, our title text looks like this:

```html
  <h1 id="title" style="color: red">My Title</h1>
```

---

# Adding and removing classes 

---

# Adding and removing classes

The hard thing about styling elements through Javascript is that if you ever decide to re-theme your site, you have to also modify your Javascript.

For this reason, it is often easier to re-style elements by adding or removing classes (which in turn modify appearance based on CSS) than it is to modify styles directly.

---

# Adding and removing classes

We can access the classes of a node with `classList`, which gives us an array of strings. From there, we can manipulate the array as desired using `add` and `remove`.

```javascript
  var title = document.getElementById("title");
  title.classList.add("my-class", "my-other-class");
  title.classList.remove("my-class");
```

---

# Tying it together with `onclick`

---

# Tying it together with `onclick`

Just like with our homework from yesterday, we can define functions that perform this DOM manipulation.

There are two different variations here:

1. An `onclick` event modifying a known element somewhere (which we select).
2. An `onclick` event modifying the clicked element

---

# Tying it together with `onclick`

For example, we could, given this HTML, modify our `h1` title:

```html
  <h1 id="my-title">This is my old title</h1>
  <a href="#" onclick="changeTitle();">Click to Change</a>
```

When we click the `a` element; it'll trigger the `changeTitle()` function.

---

# Tying it together with `onclick`

Here's our Javascript. We grab the element, modify its contents, and add some styles.

```javascript
  function changeTitle() {
    var title = document.getElementById("my-title");
    title.innerHTML = "Here's the new title";
    title.setAttribute("style", "color: blue");
  }
```

There's no reason we can't do this for more than one element at a time if we want to.

---

# Tying it together with `onclick`

Similarly, there's no reason we can't have `onclick` events for elements of other types.

---

# Tying it together with `onclick`

Sometimes, we want the function triggered by an element's event to act on that element itself.

For example, we could click a `p` to change its text color. 

---

# Tying it together with `onclick`

We've got a bunch of paragraphs, but we want to work with them one at a time, and without assigning a specific ID to each of them (though we could do so with ERB).

```html
  <p onclick="changeColor(this);">Click to change me</p>
  <p onclick="changeColor(this);">Click to change me</p>
  <p onclick="changeColor(this);">Click to change me</p>
  <p onclick="changeColor(this);">Click to change me</p>
```

---

# Tying it together with `onclick`

In addition to arguments we might pass in (can we construct that dynamically?), we can also have an element pass itself in to a function by invoking the `this` keyword. This is analogous to `self` in Ruby.

```html
  <p onclick="changeColor(this);">Click to change me</p>
```

(Bonus: how can we change the cursor so our `p` looks clickable?)

---

# Tying it together with `onclick`

This function takes any DOM element as an argument (we still pass in *`this`*, but could pass in something else), then performs the function by way of modifying that element.

```javascript
  function changeColor(element) {
    //element.setAttribute("style", "color: green");
    element.style.color = "green";
  }
```

---

# Tying it together with `onclick`

We're not restricted to just using *`this`*. We can pass in any element:

```javascript
  function changeTitle() {
    var t = document.getElementById("title");
    changeColor(t);
  }

  function changeColor(element) {
    element.style.color = "green";
  }
```
  
---

# GitHub Pages

---

# GitHub Pages

1. Create a `gh-pages` branch.
2. In that branch, provide an `index.html` (plus JS and CSS).
3. Push it, but don't ever merge back into the *master* branch.
4. Navigate to `github.io/yourusername/repositoryname`

---

# Tomorrow

1. Better event listeners and handlers
2. Adding and destroying nodes
3. Some common Javascript tasks
4. Maybe we play a game?

---

# Homework

Given the starter HTML and the specs, write some Javascript that performs the
described tasks.

There are a handful of bonus objectives.
