# Week 04, Day 02

> A program that produces incorrect results twice as fast is infinitely slower.
--John Osterhout

---

# Weekly Objective

Build our first web application

---

# Daily Objective

+ Render HTML with Sinatra
+ Use forms to get information
+ Deploy to Heroku

---

# Agenda

1. Review and Check-In
2. ERB / HTML output
3. Forms for input
4. Layout
5. Working with Other Classes
6. Deploy to Heroku

---

# Review & Check-In

---

# ERB / HTML Output

---

# ERB / HTML Output

So far, each of our Sinatra actions has produced raw text.

This is fine, but limited in terms of ways to display content.

---

# ERB / HTML Output

**ERB** to the rescue!

---

# ERB / HTML Output

First, let's talk about *Hypertext Markup Language* (HTML)

---

# ERB / HTML Output

```html
<!DOCTYPE html>
<html>
<head>
  <title>Awesome Dogs</title>
</head>
<body>
  <h1>Dogs are pretty cool sometimes</h1>
  <p>Most of the time, in fact!</p>
</body>
</html>
```
---

# ERB / HTML Output

We've got a couple of important tags:

+ `<html>`
+ `<head>`
+ `<title>`
+ `<body>`
+ `<h1>`
+ `<p>`

---

# ERB / HTML Output

We've also got a useful convention of opening and closing tags.

```html
<h1>This is my title</h1>
```

---

# ERB / HTML Output

HTML is for *static* pages, mostly. We can't dynamically interact with HTML directly, but we have to use it because it's what web browsers expect.

---


# ERB / HTML Output

This is where *Embedded Ruby* (ERB) comes in. Sinatra takes our ERB templates and then renders them into HTML, which it sends to the browser.

---

# ERB / HTML Output

Here's what it looks like. Instead of this:

```html
<h1>This is my title</h1>
```

We have this:

```html
<h1><%= "this is my title".capitalize %></h1>
```
---

# ERB / HTML Output

When ruby hits the `<%=` and `%>` tags, it takes whatever is in those tags, then takes the result (as a string) and inserts it directly.

---

# ERB / HTML Output

There are two types of ERB tags:

+ `<%=` and `%>` - Output (prints)
+ `<%` and `%>` - Logic (doesn't print)

---

# ERB / HTML Output

```html
  <ul>
    <% 10.times do |n| %>
      <li><%= n %></li>
    <% end %>
  </ul>
```
---

# ERB / HTML Output

We can think of ERB as augmented HTML. ERB documents can do everything HTML can do and more.

---

# ERB / HTML Output

Sinatra knows how to use ERB off the bat. We have to do some work before we can use this, though:

---

# ERB / HTML Output

1. Create a `views/` folder in our main directory
2. Create an ERB file inside our views folder
3. Tell our route to render it

---

# ERB / HTML Output

In `views/hello.erb`

```html
  <h1>Hello, World</h1>
```

---

# ERB / HTML Output

In `main.rb`

```ruby
  get "/hello" do
    erb :hello
  end
```

This will render `views/hello.erb` as HTML (right now it's just HTML).

---

# ERB / HTML Output

This is all fine and good, but what if we want to pass in information?

---

# ERB / HTML Output

```ruby
  get "/hello" do
    @name = params['name']
    erb :hello
  end
```

---

# ERB / HTML Output

```html
  <h1>Hello, <%= @name %></h1>
```

---

# ERB / HTML Output

```html
  <a href="dogs/#{@dog.id}"><%= @dog.name %></a>
```

---

# ERB / HTML Output

We can pass in objects, arrays, hashes, strings, integers -- you name it!

The `@` convention simply makes that variable available to the views, rather than being constrained to just a local variable in the route action.

---

# ERB / HTML Output

Once the view has been rendered, our passed-in variables are obliterated.

---

# ERB / HTML Output

**Mini-Project:** Take your Sinatra Assignment from last night and revise it so that it renders HTML views instead of raw text.

---

# Forms for Input

It's no good for us to only be able to pass in information by hand-constructing a URL (and its queries).

What if we could fill out a form instead?

---

# Forms for Input

1. Text
2. Radio Buttons
3. Select Menu (dropdown)

We'll talk about checkboxes and multi-select menus next week or the week after.

---

# Forms for Input

Here's a simple textbox form:

```html
  <form action="/say-hello" method="get">
    What's your name? <input type="text", name="name">
    <input type="submit" value="submit">
  </form>
```

---

# Forms for Input

When we submit, this form sends a `GET` request to `/say-hello`.

```html
  <form action="/say-hello" method="get">
    What's your name? <input type="text", name="name">
    <input type="submit" value="submit">
  </form>
```

---

# Forms for Input

Whatever we enter into our text field will be stored as `params['name']`.

```html
  <form action="/say-hello" method="get">
    What's your name? <input type="text", name="name">
    <input type="submit" value="submit">
  </form>
```
---

# Forms for Input

Or we could have radio buttons:

```html
  <input type="radio" name="animal" value"dog"> DOG</br>
  <input type="radio" name="animal" value"cat"> CAT</br>
  <input type="radio" name="animal" value"squirrel">SQUIRREL</br>
```

This will submit the value of the choice as `params['animal']`.

---

# Forms for Input

We can also have select options:

```html
  <select name="greeting-choice">
    <option value="howdy">Howdy</option>
    <option value="hello">Hello</option>
    <option value="whassup">WHASSSUUUUUPPP</option>
  </select>
```

The value of the `value` attribute gets passed to our form as `params['greeting-choice']`

---

# Layout

---

# Layout

It's kind of a pain to have to type our full HTML document structure in every ERB file. Rather than doing so, let's just use a *layout* file.

---

# Layout

`views/layout.erb`

```html
  <!DOCTYPE html>
  <html>
  <head>
    <title>My App</title>
  </head>
  <body>
    <%= yield %>
  </body>
  </html>
```
---

# Layout

The magic here is `<%= yield %>` -- this takes the contents of whatever view we're rendering and sticks it right in the layout.

As we progress, our layout template will become increasingly sophisticated.

---

# Working with Other Classes

If we want to define and create other classes, we can do so.

We `require_relative` them, just like we did with our driver before.

---

# Deploy to Heroku

We can deploy our web applications to Heroku if we so desire:

1. Create a `config.ru` file
2. `heroku create`
3. `git push heroku master`
4. `heroku open`

[More Information Here](https://devcenter.heroku.com/articles/rack)

---

# Deploy to Heroku

`config.ru`

```
  require_relative './app.rb'
  run Sinatra::Application
```

---

# Looking Forward

> The future is uncertain and you will never know less than you do right now.
-- Sandi Metz

---

# Looking Forward

Tomorrow, we'll add models to our applications.

On Thursday, we'll add tests and get those applications deployed.

You'll spend Thursday and Friday (and this weekend??) rebuilding the library project.

---

# Homework

---

# Homework - A

Recreate [this project]() using Sinatra. I'll post the source code tomorrow so you can compare. You'll have to use what you learned in class today (and up until now), but there won't be any fancy algorithms or logic.

---

# Homework - B

Play around with the various types of form inputs. You don't need to render views, per se; just make sure you know how to use each kind of form input (text, textarea, select, radio button, checkbox) in such a way that the params hash is what you expect

---

# Homework - Bonus

Rebuild [Babysizer](https://babysizer.com/). Don't worry about making it look good; just get the basic functionality. You don't even need to add images unless you want to.

If you want to re-theme it to something else, go ahead and do so. The functionality I actually care about is the double dropdown menu (or equivalent functionality).
