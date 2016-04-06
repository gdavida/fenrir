# Week 04, Day 03

---

# Weekly Goal

Build our first MVC web application

---

# Daily Goal

+ Add models into our web application
+ Build the RESTful (cardinal) routes
+ Deploy applications to Heroku

---

# Agenda

---

# Agenda

1. Homework and Check-In
2. MVC
1. Bringing in models
2. RESTful (cardinal) routes
4. Guest Speaker - Drew Ulmer
5. Homework

---

# Homework and Check-In

---

# MVC Structure

---

# Models in Sinatra

In order to bring [ActiveRecord models into our Sinatra applications](https://github.com/janko-m/sinatra-activerecord), we need to do some work:

---

# Models in Sinatra

1. Update our Gems
2. Update our Rakefile
3. Update our `config/` folder

---

# Models in Sinatra

```ruby
# Gemfile
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'pg'
```

---

# Models in Sinatra

```ruby
# Rakefile
 require "sinatra/activerecord/rake"
 require "rake/testtask"
 require_relative "./main.rb"
 
 namespace :db do
   task :load_config do
     require_relative "./main.rb"
   end
 end
```

---

# Models in Sinatra

This replaces the db scripts we wrote by hand. It doesn't replace the default rake test runner task.

---

# Models in Sinatra

We'll get rid of everything in our `config/` folder except `database.yml`, which we need to slightly modify.

```
 development:
   adapter: 'postgresql'
   database: 'bug-tracker-sinatra'
   encoding: 'utf8'
   pool: 5
```

---

# Models in Sinatra

```ruby
# main.rb
require "sinatra/activerecord"
# ...
```

---

# Models in Sinatra

Now we can bring our models, tests, and migrations over.

---

# RESTful Structure

---

# RESTful Routes / Cardinal Routes

+ new
+ create
+ show
+ index
+ edit
+ update
+ delete

---

# RESTful Routes

+ new: `get '/insects/new'
+ show: `get '/insects/:id'`
+ index: `get '/insects'
+ edit: `get '/insects/:id/edit'`

---

# RESTful Routes

+ create: `post '/insects'`
+ update: `post '/insects/:id`
+ destroy: (we'll worry about this one later)

---

# Homework

---

# Homework - A

**Look! A Dog!**
