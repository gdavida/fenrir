# Week 07, Day 03

---

# Weekly Goal

Do basic DOM manipulation and logic with Javascript.

---

# Daily Goal

1. Get more practice with DOM manipulation
2. Start using event listeners

---

# Agenda

1. Homework & Check-In
2. `debugger`
2. Event listeners
3. Project
4. 3p-4p: HUDL FIELD TRIP

---

# Homework & Check-In

---

# `debugger`

Remember `binding.pry`? We can do the same thing in Javascript. Just toss `debugger` in the middle of a function; when the console hits the `debugger` line, it'll stop.

This makes working with Javascript infinitely more pleasant.

---

# Event Listeners

---

# Event Listeners

1. What are events?
2. What kinds of events exist?
2. How do we listen for them?
3. How do we add an event listener to an element?
4. How do we remove an event listener from an element?
5. `window.addEventListener("load", setUpPage);`

---

# What are events?

*Events* are basically triggered occurrences. We've been using `"click"` events thus far, but there are lots of others.

---

# What kinds of events exist?

1. An element is clicked
2. The mouse goes over an element
3. A key is being held down
4. The user has pressed a key
5. The window loads
6. A form field has changed
7. ... (and [a bunch more](http://www.w3schools.com/jsref/dom_obj_event.asp))

---

# How do we detect events?

DOM events happen all the time, but we mostly ignore them. If we want to detect a certain event, we can create an **event listener** to watch for that event.

---

# How do we detect events?

We've been doing this implicitly by defining `onclick` inline in our HTML elements. But sometimes we want multiple functions to be defined for a given event, or multiple events for a given function, or for some events to only be listened for in certain circumstances, or....

---

# How do we detect events?

The better (and more canonical way) to do this is to add event listeners. We can do this dynamically.

---

# How do we add event listeners?

Assuming that we've selected some element (which we're calling `element`), we can do something like the following:

```javascript
  element.addEventListener("click", sayHey);
```

This says "Hey! When we *click* on this element, execute the *sayHey* function!"

---

# How do we add event listeners?

When we add an event listener, we need three things:

1. The element we're adding to (we can get this any of a number of ways)
2. The type of event we're listening for
3. The function we want to run when that event occurs (we have to define this somewhere, too!)

---

# How do we remove event listeners?

Assuming we've got an `element` already defined:

```javascript
  element.removeEventListener("click", sayHey);
```

We have to provide the same information, as we could have multiple event listeners on an element for a given type of event.

---

## `window.addEventListener("load", setUpPage);`

---

## `window.addEventListener("load", setUpPage);`

If we try to add event listeners in our script, we can't do it because the elements that we would add event listeners to elements that don't exist yet.

Thus, we need to wait for all those elements to exist before we can work with them.

---

## `window.addEventListener("load", setUpPage);`

`"load"` is also an event (which triggers when the page loads).

Once the page has loaded, we can add everything else.

```javascript
  window.addEventListener("load", setUpPage);

  function setUpPage() {
    // do some stuff here
  }
```

---

## `window.addEventListener("load", setUpPage);`

We can also do this with an *anonymous function*:

```javascript
  window.addEventListener("load", function() {
    // set up your event listeners here 
  });
```

Either approach is fine.

---

# Bubbles? Bubbles!

Suppose we have a `p` inside of a `div`, both of which have `click` events.  Which event should happen first?

---

# Bubbles? Bubbles!

By default, the innermost element's event handler triggers first, then the outer one. This is called *bubbling*.

Alternatively, we can *capture* the events, in which the outer element's event handler triggers first, then the inner one.

---

# Bubbles? Bubbles!

To capture, we'll do something like this:

```javascript
  outerDiv.addEventListener("click", outerClickEvent, true);
  innerP.addEventListener("click", innerClickEvent, true);
```

Again, the default is for events to bubble.

---

# Homework

Build a [Tic-Tac-Toe game](https://github.com/star-city-code-school/w07-d03-tic-tac-toe).

I've provided some HTML for you. You can build the CSS and Javascript. You may choose to modify the HTML to make it easier to work with, but this assignment is complete-able without making any changes (except getting rid of dummy information).
