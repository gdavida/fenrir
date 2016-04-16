# Week 05, Day 02

---

# Weekly Goal

Build a substantial, self-directed MVC application

---

# Daily Goal

1. Work on Many-to-Many Relationships
1. Finish out the **CRUD** routes
2. Prepare to test and deploy
3. Prepare project specifications

---

# Agenda

1. Homework & Check-In
2. Many-to-Many Relationships
2. Finish out our CRUD routes
3. `app/views`
5. Projects!

---

# Homework & Check-In

---

# Many-to-Many Relationships

---

# Many-to-Many Relationships

So far, we've dealt with forms and *one-to-many* relationships.

Since the foreign key in a *One-to-Many* relationship is part of the model's attributes, we just update the foreign key.

---

# Many-to-Many Relationships

In many-to-many relationships, we have to do a bit more work.

---

# Many-to-Many Relationships

The easiest way to handle these relationships is one link at a time.

---

# Many-to-Many Relationships

After the record already exists:

1. Pick a record for one side of the *Many-to-Many* relationship
2. Show all records for the other side
3. For each of the records on the other side, show one of two forms:
  + an "Add" button
  + a "Remove" button

---

# Many-to-Many Relationships

(When we get to rails, we'll have idiomatic ways to make this easier)

---

# Many-to-Many Relationships

If we're creating a new record, we can just use checkboxes. I'll leave this as an exercise for the reader.

---

# More Idiomatic CRUD Routes

---

# Idiomatic CRUD Routes

HTTP provides two verbs for us: `get` and `post`. But [Sinatra allows for more](http://www.sinatrarb.com/intro.html#Routes) than that.

---

# Idiomatic CRUD Routes

+ **New**: `get "/insects/new"`
+ **Create**: `post "/insects"`
+ **Index**: `get "/insects"`
+ **Show**: `get "/insects/:id"`
+ **Edit**: `get "/insects/:id/edit"`
+ **Update**: `patch "/insects/:id/edit"`
+ **Delete**: `delete "/insects/:id"`

---

# Idiomatic CRUD Routes

We have two routes that we don't yet know how to deal with: 

+ **Update**: `patch "/insects/:id/edit"`
+ **Delete**: `delete "/insects/:id"`

[See the full Rails Routing CRUD routes as reference](http://guides.rubyonrails.org/routing.html#crud-verbs-and-actions)

---

# Idiomatic CRUD Routes

Since HTTP and HTML only provide us with the two verbs, we have to use some trickery to create our `patch` and `delete` routes.

Specifically, we'll [fake our HTTP verbs](http://webapps-for-beginners.rubymonstas.org/resources/fake_methods.html).

---

# Idiomatic CRUD Routes: Update

Doing this sort of faking requires us to enable method overrides:

```ruby
  # main.rb
  enable :method_override
```

---

# Idiomatic CRUD Routes

We can override the default form *method* with a hidden `_method` tag (this is the `update` action).

```html
  <input name="_method" type="hidden" value="patch">
```

This says to Sinatra, "Don't use the regular `post` method -- make it `patch` instead!" and does so without confusing our HTML.

---

# Idiomatic CRUD Routes

From here, we can modify our update actions accordingly and they should still work. 

---

# Idiomatic CRUD Routes

When we move into Rails, we can make use of `form_helper` and `form_tag` objects to make our
lives a bit easier.

---

# Idiomatic CRUD Route: Delete

---

# Idiomatic CRUD Routes

The `delete` route carries with it some more potential complications:

```ruby
  delete "/books/:id" do
    @book = Book.find_by_id(params['id'])
    @book.destroy
  end
```

---

# Idiomatic CRUD Routes

If there exist records whose foreign keys point to the object we're destroying, we have to decide what to do with those records.

+ Leave 'em
+ Update 'em
+ Destroy 'em

---

# Idiomatic CRUD Routes

Leaving the objects be is easy, but means that they'll be floating in limbo, at least somewhat, with references to a record that no longer exists. This probably isn't the path we want.

---

# Idiomatic CRUD Routes

Destroying them is also pretty easy:

```ruby
  class Customer < ActiveRecord::Base
    has_many :employees, dependent: :destroy
  end
```

When we delete a `Customer` object, the associated `Employee` objects get destroyed as well.

---

# Idiomatic CRUD Routes

With our Library Manager, maybe what we want is for all books and staff associated with a library to be re-assigned to another library.

---

# Idiomatic CRUD Routes

```ruby
  delete "/libraries/:id" do
    @library = Library.find_by_id(params['id'])
    @new_library = Library.find_by_id(params['new_library_id'])

    @library.books.each do |b|
      b.update_attributes(library: @new_library)
    end

    @library.staff_members.each do |s|
      s.update_attributes(library: @new_library)
    end

    @library.destroy

    redirect to("/libraries")
  end
```

---

# Idiomatic CRUD Routes

That controller action is really long and hard to test. Let's move some of that logic into the model. What we ultimately want is this controller action:

---

# Idiomatic CRUD Routes

```ruby
  # app/controllers/libraries_controller.rb
  delete "/libraries/:id" do
    @library = Library.find_by_id(params['id'])
    @new_library = Library.find_by_id(params['new_library_id'])

    @library.reassign_books_and_staff(@new_library)
    @library.destroy
    redirect to("/libraries")
  end
```

---

# Idiomatic CRUD Routes

```ruby
  def reassign_books_and_staff(libr)
    staff_members.each do |s|
      s.update_attributes(library: libr)
    end

    books.each do |b|
      b.update_attributes(library: libr)
    end
  end
```

---

# Idiomatic CRUD Routes

Then we can add this form to our Library Edit page (it can't be inside of our regular edit form, but can exist on the same page).

---

# Idiomatic CRUD Routes

```html
  <h2>Delete this library?</h2>
  <form action="/libraries/<%= @library.id %>" method="post">
    <input type="hidden" name="_method" value="delete">
    Which library should we reassign books to?
    <select name="library_id">
      <% @libraries.each do |l| %>
        <option value="<%= l.id %>"><%= l.branch_name %></option>
      <% end %>
    </select>
    <input type="submit" value="Delete">
  </form>
```

---

# Idiomatic CRUD Routes

This works perfectly *so long as* there's another library to which we can assign our books. If not, it'll crash (what error will it raise? How do you know?).

---

# Idiomatic CRUD Routes

Thus, we should not modify our logic in three places:

+ The view (hide the form if no other libraries exist)
+ The controller (don't perform the action if `@new_library` is nil
+ The model (don't perform the action if `@new_library` is nil

---

# Idiomatic CRUD Routes

Doing this in three places means we'll be triple-protected

---

# `app/views`

---

# `app/views`

We've moved our models and controllers into our `app` folder. Let's get our views in there as well to round out the MVC trifecta.

---

# `app/views`

`git mv views app/`

---

# `app/views`

Next, we need to tell Sinatra to use the new location:

```ruby
  # main.rb
  set :views, Proc.new { File.join(root, "app/views")}
```
---

# Sidebar: More Configuration

You can configure most of Sinatra's functionality.

[Read more here](http://www.sinatrarb.com/configuration.html#__view_template_directory)

---

# Projects!
