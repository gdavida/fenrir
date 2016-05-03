# Week 8, Day 02

---

# Weekly Goal

Get comfortable enough with Rails that we can complete our first project

---

# Daily Goal

Add in models and forms.

---

# Agenda

1. Homework & Review
2. Rails models
3. `form_for`
4. Model tests
5. Homework

"Rails Master Class" at 11a. Yoga at 1p

---

# Homework & Review

---

# Rails Models

---

# Rails Models

Just like we did with the controller, we can generate models.

`rails generate model Insect`

---

# Rails Models

It gets even better:

`rails generate model Insect name:string`

This will pre-populate some of the columns in our migration.

---

# Rails Models

Later, we can add columns by generating more migrations:

`rails generate migration AddDescriptionToInsectsTable`

From here, it's just like what we remember from Sinatra.

---

# Rails Models

In addition to an `id`, Rails also provides a `created_at` and `updated_at` column for you automatically.

---

# Rails Models

Otherwise, you can expect models to work just like they did in your Sinatra applications.

---

# Model Tests

---

# Model Tests

Now that we can write to the database, we can do some better tests.

[See this article for Rails testing](http://guides.rubyonrails.org/testing.html)

---

# Model Tests

Our tests can now read from and write to the database. We have a separate test database so things don't get too confused.

We can also define some pre-made records using fixtures.

---

# Controllers and Strong Params

Because so much more gets passed in through the params hash, Rails requires us to whitelist incoming parameters using strong params.

```ruby
  # in your controller
  def insect_params
    params.require(:insect).permit(:name, :description)
  end
```

This says that when we try to create or update, we only allow the permitted parameters to be passed in to the model.

---

# Controllers and Strong Params

Our `insect_params` method sanitizes, in a way, the params hash.

```ruby
  # also in your controller
  def new
    @insect = Insect.new(insect_params)
  end
```

We have to provide strong params for our models.

---

# `resources` and routing

---

# `resources` and routing

If we want all 7 of the cardinal routes to be defined (we still need to define appropriate controller actions and views), we can define them one at a time, or we can do this:

```ruby
  # in config/routes.rb
  resources :insects
```

It's reasonable for us to use `resources` when we can.

---

# `resources` and routing

Later, we can restrict or grant access to certain actions by way of *authorization* gems (or hand-coding it ourselves).

---

# `form_for`

---

# `form_for`

We use `form_tag` for generic forms not tied to a model (or to an individual record).

We'll use `form_for` when we're dealing with our models directly.

---

# Flashes

---

# Flashes

*Flash* messages provide a way for us to pass information to the next view.

You can [learn more here](http://guides.rubyonrails.org/action_controller_overview.html#the-flash).

---

# Homework

---

# Homework - A


