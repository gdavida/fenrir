# Week 06, Day 01

---

# Weekly Goal

Get good enough at CSS that we can build most things

---

# Daily Goal

Learn enough Bootstrap to be dangerous

---

# Agenda

+ **Morning**: Show and tell, project review, troubleshooting, deployment
+ **Afternoon**: Bootstrap!

(Yoga at noon)

---

# Show and Tell, Review

---

# Deployment

---

# Bootstrap!

---

# Bootstrap!

1. Use Bootstrap as our window into front-end development
1. Learn the grid system (rows and columns)
2. Responsive layouts
3. Make use of Bootstrap idioms

---

# Sidebar: Front End Development

---

# Sidebar: Front End Development

What is front-end development and what are the tools?

---

# Sidebar: Front End Development

Front end development is concerned with:

+ How an application looks
+ How a user interacts with an application
+ How information is represented on-screen

---

# Sidebar: Front End Development

Front end developers use a variety of tools:

+ HTML
+ CSS
+ Javascript
+ Front end frameworks & Javascript libraries
+ Photoshop (et al.)

---

# Sidebar: Front End Development

Front end development is almost entirely concerned with the human experience of interacting with a piece of software.

---

# Sidebar: Front End Development

In this class, we'll partially focus on the front-end, but we'll use Bootstrap to make our lives easier.

---

# Bootstrap!

But what *is* Bootstrap?!

---

# Bootstrap!

Bootstrap is a collection of [CSS](http://getbootstrap.com/css/), [Components](http://getbootstrap.com/components/) (which are made out of HTML elements), and [Javascript](http://getbootstrap.com/javascript/), which powers our components.

Twitter made Bootstrap to make working with the front end easier, particularly for non-designers,and released it to the world a few years ago.

---

# Bootstrap! Grid system

---

# Bootstrap! Grid system

The [grid system](http://getbootstrap.com/css/?#grid) is the heart of Bootstrap. We break pages into rows and columns, which may contain more rows, which may contain more columns, and so on.

---

# Bootstrap! Grid system

We do this with `<div>` elements to which we apply classes.

---

# Sidebar: CSS Classes

We apply CSS classes like so:

```html
  <div class="row">
    <div class="col-xs-12">
      <h1>This is my header</h1>
    </div>
  </div>
```

---

# Sidebar: CSS Classes

We apply classes to HTML elements in order to apply common stylings (with CSS).  We also may use classes for Javascript, though less frequently.

---

# Bootstrap! Grid system

---

# Bootstrap! Grid system

A row contains many column-containers, the sum width of which should be 12 or less.

---

# Bootstrap! Grid system

Column-containers can vary in width, position, and visibility, both relative to each other and relative to screen-size.

---

# Bootstrap! Grid system

Your content goes in columns, which turn should be inside of rows (or other columns).

---

# Bootstrap! Grid system

There are four screen sizes we might consider:

+ `xs` (Extra small) -- phones, etc. (less than 768px wide)
+ `sm` (Small) - tablets (768+ px wide)
+ `md` (Medium) - large tablets, small desktops (992+ px wide)
+ `lg` (Large) - Desktops (1200+ px wide)

---

# Bootstrap! Grid system

When composing designs, try to break the screen into rows and columns. The breaks might not be intuitive at first.

---

# Bootstrap! Responsive layouts

---

# Bootstrap! Responsive layouts

*Responsive* sites are simply sites whose layout changes to accomodate different screen sizes.

---

# Bootstrap! Responsive layouts

In regular CSS, we accomplish this with *media queries* (we'll learn more about these later this week).

---

# Bootstrap! Responsive layouts

In Bootstrap, we accomplish this with the grid.

---

# Bootstrap! Responsive layouts

Put simply, we affix several different column classes to a div:

```html
  <div class="row">
    <div class="col-xs-12 col-sm-8 col-md-5 col-lg-3">
      ...
```

Now that column changes its width based on screen width.

---

# Bootstrap! Responsive layouts

When doing responsive design, it's usually easiest to start with the mobile design, then work towards the full-screen.

---

# Bootstrap! Responsive layouts

```html
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
```

The last thing we need for truly responsive layouts is a viewport, which keeps our pages looking good on certain mobile devices.

---

# Bootstrap! Idioms & Conventions

---

# Bootstrap! Idioms & Conventions

There are a few conventions we'll like to follow:

1. Apply some default styling to elements of each type
2. Control position with `<div>` elements and appropriate classes
3. Control specific styles by applying classes
4. Consider our page in terms of components, rather than HTML elements

---

# Bootstrap! Idioms & Conventions

No framework (Bootstrap included) will have everything you want or need. But the major ones (Bootstrap included) generally do things pretty well. You can follow these patterns when you write your own CSS.

---

# Tomorrow

Tomorrow, we'll start writing CSS from scratch

---

# Homework A: Working from comps

Pick one of the comps I've provided in the HW issue and see if you can build it with Bootstrap. If you want to, you can build with just HTML, but you can also build it in Sinatra if you'd like.

---

# Homework B: Try out another framework

Re-do your assignment from Part A, but with *Materialize*, *Foundation*, or *Primer* (etc.).

What's similar? What's different? Do you have a preference? I'll use Bootstrap for the remainder of this course as the default, but you can experiment.

---

# Homework C: Journal Prompt

What are the relative advantages and disadvantages of using a front-end framework like Bootstrap? What do you gain? What do you lose?

---

# Bonus Homework

See if you can figure out how to create the following (with Bootstrap) using only HTML:

1. A navbar (both fixed and responsive)
3. Content that is hidden at certain screen widths
4. Buttons with icons in them
5. Forms with icons in them
6. Links that are also buttons
