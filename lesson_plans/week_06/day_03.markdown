# Week 06, Day 03

---

# Weekly Goal

Learn some CSS so we can build some things

---

# Daily Goal

1. Get more CSS Practice
2. Learn to build some common components
3. Introduction to Responsive Design

---

# Agenda

1. Homework & Check-In
2. Common Components
3. Mixing Bootstrap & Custom CSS
4. (Optional) Responsive Design

**We'll have a guest speaker during lunch tomorrow. Lunch is on me tomorrow.**

---

# Homework & Check-In

---

## CSS Exercise

---

## *Practicing Rails*, Ch. 2

---

## *POODR*, Ch. 1

---

# Common Components

1. Navbar
2. Full Header
3. Footer
4. Sidenav

---

# Mixing Bootstrap with Custom CSS

---

# Mixing Bootstrap with Custom CSS

You can supplement Bootstrap with custom CSS, but there are some things you'll need to do first.

This is especially useful if you want Bootstrap to control the layout and for you to be able to control the look of individual elements more precisely.

---

# Mixing Bootstrap with Custom CSS

1. Include Bootstrap (use the CDN if you can)
2. Include your custom stylesheet *after* Bootstrap
3. Proceed from there as normal

---

# Mixing Bootstrap with Custom CSS

As your projects take shape, it may be wise to download the Bootstrap CSS proper and remove anything you're not using. But we don't have to worry about that yet.

---

# Responsive Design

---

# Responsive Design

*Responsive* web pages change their layout (and sometimes their styling) to account for different screen widths. The site responds to the screen width.

---

# Responsive Design

The basic strategy is simple:

1. Determine how wide the screen is (using a media query).
2. Apply CSS rules based on screen width.

---

# Responsive Design

Execution, as always, is trickier, especially if we're designing for a full-sized screen and then adapting for mobile devices.

---

# Responsive Design

One thing we should do before we go much further is add a viewport so our designs show up accurately on various devices.

```html
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
```

---

# Responsive Design

Bare minimum, you should provide a mobile-friendly and a full-screen friendly version of most, if not all, sites you build from here on out.

---

## Responsive Design with Bootstrap

---

## Responsive Design with Bootstrap

Bootstrap lets us modulate the column-width (and visibility) of a `div` based on screen-width.

```html
  <div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-lg-4">
      <p>This is some responsive text. Neat, huh?</p>
    </div>
  </div>
```

---

## Responsive Design with Bootstrap

With Bootstrap, we'll be using [the grid](http://getbootstrap.com/css/#grid-options), [responsive images](http://getbootstrap.com/css/#images), and [grid visibility settings](http://getbootstrap.com/css/#responsive-utilities-classes).

---

## Testing Responsive Design Across Devices

1. (OS X only) iOS Emulator
2. Chrome Inspector

---

## Responsive Design from Scratch

---

## Responsive Design from Scratch

With responsive design from scratch, we'll need to:

1. Construct our design (mobile first, preferably)
2. Make the screen wider until it looks weird
3. Construct a media query to modify behavior when the screen is at least that wide
4. Repeat until we're done

---

## Responsive Design from Scratch

Here's an example of a media query:

```css
  @media screen and (min-width: 500px) {
    h1 {
      color: red;
    }
  }
```

Turn all `h1` elements red when the screen is at least `500px` wide. Otherwise, they're black.

---

## Responsive Design from Scratch

The usual way to do media queries is to start from your narrowest width and work your way out wider. This lets your queries become more flexible.

---

## Responsive Design from Scratch

Check out [this mini-tutorial](http://www.w3schools.com/css/css_rwd_mediaqueries.asp) for more about media queries.

---

# The Rest of the Week

You have (at least) two options for tomorrow and Friday:

1. Work on your project from last week
2. Start a new project. Arrrooooooooo!

---

# Homework

---

# Homework - A

Do a front-end drill, but set a timer for 120 minutes (break this out into smaller chunks if you want). Build the site so it works both on mobile and full-screen. My preference is that you use Bootstrap for the responsive part, but you can write your media queries from scratch.

---

# Homework - B

Take [this basic Sinatra application]() (there aren't any models) and provide some styling. It should work on both a phone (or phone-width display) and on a full-screen desktop.

---

# Homework - C

Do another front-end drill, OR sign up for [Code Wars](http://www.codewars.com/) and do a Ruby exercise or two.
