# Week 06, Day 02

---

# Weekly Goal

Learn enough CSS that we can build most things

---

# Daily Goal

CSS from scratch for both styles and layout

---

# Agenda

+ **Morning**: Apply CSS styles to HTML elements
+ **Afternoon**: Control the layout of HTML elements

---

# Homework Review

---

# Sidebar: How to Practice

---

# Sidebar: How to Practice

1. Pick a page on a site.
2. Set a timer - 30 to 90 minutes is probably good.
3. See how close you can get to building that page or component without looking at the inspector.
4. After you're done, or after the timer goes off, check out what you were building with the inspector.
5. Good work! Pat yourself on the back.

---

# Sidebar: How to Practice

Additionally, take the time to examine pages with neat elements. All the HTML, CSS, and Javascript are exposed to you. Make use of this.

---

# Sidebar: How to Practice

You don't need world-class talent to be a good enough designer that you can design something relatively usable.

You mostly just need to be able to ask good questions and practice diligently.

---

# Sidebar: How to Practice

You don't need any design talent at all to become good at working with HTML and CSS as it pertains to building things other people designed.

---

# Sidebar: How to Practice

Front end development, design, and usability are all skills you can learn and improve through deliberate practice and asking good questions.

The goal here is not to replace designers. The goal is to, at minimum, know enough about design that you can work effectively with designers.

---

# CSS Basics

---

# What is CSS?

![inline](http://media.tumblr.com/tumblr_lq4g1xyrJB1qeusrl.png)

---

# Creating a CSS Document

When working with Sinatra, we'll put our stylesheets in `public/`. If we have lots of stylesheets (and we might), we may with to make a subfolder.

---

# Creating a CSS Document

CSS documents have a `.css` file extension

---

# Parts of a CSS Document

A CSS document is full of CSS rules, which contain a few parts:

1. A selector
2. One or more attributes

---

# Parts of a CSS Document

```css
  h1 { 
    color: red;
    float: right;
  }
```

---

# Parts of a CSS Document

A given CSS document may have multiple rules and selectors; CSS is often very long.

We'll talk later this week about organization strategies.

---

# How CSS Works

![inline](http://media.tumblr.com/tumblr_lq4g6awlf81qeusrl.png)

---

# How CSS Works

Once the HTML is in place (or sometimes as it is loading), the browser applies rules based on the type of element.

If a given element has multiple rules that apply to it, the ones listed last override (if necessary) the ones listed earlier.

---

# Applying CSS Styles to Elements

To apply styles to an element, we must first select it, then we apply styles.

For example, consider the following HTML:

```html
  <div>
    <h1>Let's Make This Red</h1>
  </div>
```

---

# Applying CSS Styles to Elements

```css
  div h1 { 
    color: red;
  }
```

Select all `h1` elements directly inside of a `div`

---

# Applying CSS Styles to Elements

If we only select by element, we end up with some really weird and anguished CSS
selectors, e.g.

```css
  div div div div div p {
    /* do some css */
  }
```

---

# Parent and Child Elements

In this example, the `h1` is the *child* of the `div`, and the `div` is the parent of the `h1`

```html
  <div>
    <h1>Let's Make This Red</h1>
  </div>
```
---

# CSS Layout and Positioning

---

# CSS: Inline and Block Elements

*Inline* elements, like `b`, flow and stay on the same line.

*Block* elements, like `div` and `li`, occupy their own line.

We can modulate these with `display: inline;` or `display; block` (or `display: inline-block;`!) 

---

# CSS Box Model

The browser renders each HTML element in a box (either inline or block) using the [CSS Box Model](http://www.w3schools.com/css/css_boxmodel.asp)

+ Content
+ Padding
+ Margin
+ Border

---

# CSS Positioning Types

+ static: where it normally is
+ relative: moved relative to where it would normally be
+ fixed: positioned relative to the viewport
+ absolute: positioned relative to the nearest non-static-positioned ancestor

---

# CSS Positioning Types

Using these positioning types, plus the `top`, `bottom`, `left`, and `right` positioning rules, we can make most things.

We can also modulate which elements appear in front of or behind other elements using the `z-index`.

By default, the element that appears *last* in the HTML appears on top.

---

# CSS Positioning Types

[More about CSS positioning](http://www.w3schools.com/css/css_positioning.asp)

---

# CSS Floats & Clear

More modern web layouts are usually made by [floating elements](http://www.w3schools.com/css/css_float.asp), which removes them from the main flow of content and gives you a lot more flexibility in terms of positioning.

That said, floating is a more complex strategy.

---

# Strategies

---

# Strategies

The single best strategy we can use is to consider design-components of a page, instead of thinking about HTML elements. The HTML elements are a means to an end.

---

# Strategies

Just like with Bootstrap, think about breaking elements down into rows and columns, if possible.

---

# Strategies

Even if you can't do this, think about breaking the page into components, each of which might be made of sub-components.

---

# Strategies

It's likely that each component will have a box of its own (containing the whole component). What kind of HTML element would you use for this?

---

# Strategies

The trick is to write your CSS and HTML in such a way that you have the freedom to quickly change your layout or styling. Adding, changing, or removing elements from a page shouldn't break the entire page.

Avoid fragile layouts.

---

# Strategies

We'll talk later this week about how to keep our HTML and CSS from being fragile.

But if we use Bootstrap as our model, what strategies might we employ?

---

# Homework

---

# Homework: A

---

# Homework: B

---

# Homework: C
