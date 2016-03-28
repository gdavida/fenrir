# Week 03, Day 01

---

# Agenda

---

# Agenda

1. Check-in
2. Homework Review
4. Some Quick Review
5. Bug Tracker
6. Homework for tonight

---

# Check-In

---

# Homework

---

# Quick Review

---

# Quick Review

1. Make a brand new project, with its own repository
2. featuring a readme, a Rakefile, a Gemfile,
3. a `lib` directory with a single class with
4. 3 or 4 attributes (plus getters and setters),
5. and a corresponding test file
6. which tests getters and setters and nothing else

---

# Quick Review

You should be able to run `rake` and have all your tests (probably 3-5 of them) pass. You should be able to run `bundle install` and have that work successfully. You should be able to push to GitHub. You should be able to make new objects of your class in Pry.

---

# Quick Review

If you have time, start building a driver class.

---

![](http://animaliaz-life.com/data_images/insect/insect6.jpg)

---

# Bug Tracker

![](http://animaliaz-life.com/data_images/insect/insect6.jpg)

---

# Bug Tracker: Problem Statement

![](http://i2.wp.com/www.cubebreaker.com/wp-content/uploads/2014/03/insects-closeup-03.png)

---

# Bug Tracker: Problem Statement

```ruby
class Insect

  attr_accessor :name, :description, :seen_by, :location

  def initialize(name:, seen_by:, location:, description:)
    @name = name
    @seen_by = seen_by
    @location = location
    @description = description
  end

end
```

---

# Bug Tracker: Problem Statement

We can create objects in memory, but they don't stick around between program runs.

---

# Bug Tracker: Problem Statement

To keep them around, we'll need a *persistence layer*, which is (for us) going to be a SQL database.

---

# Bug Tracker: Persistence
![](http://fyi.uwex.edu/news/files/2014/01/Colorado_potato_beetle_leptinotarsa_decemlineata_insect.jpg)

---

# Bug Tracker: Persistence

We'll store our individual insects as rows in a database (this is somewhat analogous to Excel spreadsheets). This way, our information will stick around.

---

# Bug Tracker: Persistence

Classes tied to a database table are called **Models**. This is because our classes are *modeling* real-world information.

---

# Bug Tracker: Persistence

Models are defined using an *Object Relational Mapping* library, which basically lets objects read from and write to a database.

---

# Bug Tracker: Persistence

So how do we set this up?

---

![](http://animaliaz-life.com/data_images/insect/insect4.jpg)

---

# ActiveRecord
![](http://animaliaz-life.com/data_images/insect/insect4.jpg)

---

> We'll use `ActiveRecord::Base` (record base) for models.
-- Meghan Trainor, noted computer scientist

---

![](https://upload.wikimedia.org/wikipedia/commons/7/78/Danaid_eggfly_Female.jpg)

---

# ActiveRecord: The Basics
![](https://upload.wikimedia.org/wikipedia/commons/7/78/Danaid_eggfly_Female.jpg)

---

# ActiveRecord: The Basics

ActiveRecord is an *ORM* for Ruby: it simplifies reading from and writing to databases, and provides some convenient mappings.

---

# ActiveRecord: The Basics

This allows us to make *CRUD* applications, wherein we can:

+ **C**reate records
+ **R**ead records
+ **U**pdate records
+ **D**destroy records

---

# ActiveRecord: The Basics

*CRUD* applications are the primary focus of the next 10 weeks.

---

# ActiveRecord: The Basics

First, some definitions:

+ Database
+ Table
+ Column
+ Row
+ Schema
+ Migration

---

# ActiveRecord: The Basics

A **database** is a specially structured file of information. We'll talk about *relational databases* in this class, but there are other types, too.

---

# ActiveRecord: The Basics

A database is composed of many **tables**; each table has rows and columns, and contains information of a given type.

---

# ActiveRecord: The Basics

In this class, each of our *models* will have its own table (we'll also have *join tables*, but we'll talk about those later).

---

# ActiveRecord: The Basics

The model (class) name should be the singular representation of our data. For example, if I want to keep track of all my insects, my model would be named `Insect`.

---

# ActiveRecord: The Basics

Since database tables hold several records of a type, their name should be all lower-case and plural, e.g. `insects`. If there were multiple words in the class name, we would `snake_case` the table name.

---

# ActiveRecord: The Basics

This is in contrast to models, which are CapitalCamelCased and singular.

---

# ActiveRecord: The Basics

**Columns** are similar to columns in a spreadsheet, in that they're places to put data. Columns correspond to attributes, but go a step further in that they prescribe both a *name* and a *data type*.

---

# ActiveRecord: The Basics

Given the columns in a table, ActiveRecord builds an `initialize` method for you.

---

![](http://lostininternet.com/wp-content/uploads/2014/05/insects-macro-photography-donald-jusa.jpg)

---

# ActiveRecord: Data Types
![](http://lostininternet.com/wp-content/uploads/2014/05/insects-macro-photography-donald-jusa.jpg)

---


# ActiveRecord: Data Types

+ boolean
+ date
+ datetime
+ float
+ integer

---

# ActiveRecord: Data Types

+ primary_key
+ string
+ text
+ time

---

# ActiveRecord: The Basics

We usually define columns when we create a table, but can add them later.

---

# ActiveRecord: The Basics

**Rows** each represent a single record, which in turn corresponds to a single object.

---

# ActiveRecord: The Basics

**Schema** refers to the overall structure of the database. We define schema through *Migrations*.

---

# ActiveRecord: The Basics

**Migrations** are scripts we write in Ruby to tell ActiveRecord how to modify the database. With migrations, we can add, remove, rename, or re-define tables and columns, and have those changes propagate to all of our rows in those tables.

---

# ActiveRecord: The Basics

ActiveRecord assumes the database and its schema as the primary source of truth for a class and its attributes.

---

# ActiveRecord: The Basics

The way this works is that ActiveRecord looks to the database structure for the table associated with a given class, then *dynamically* creates a bunch of methods for us.

---

# ActiveRecord: The Basics

In addition, ActiveRecord provides methods to handle associations and relationships, validation, querying, and our normal CRUD operations.

---

![](https://ediblesanmarcos.files.wordpress.com/2010/11/100_1244.jpg)

---

# ActiveRecord: Setup
![](https://ediblesanmarcos.files.wordpress.com/2010/11/100_1244.jpg)

---

# ActiveRecord: Setup

We'll need to add `ActiveRecord` and a Postgresql database adapter to our project's Gemfile:

---

#ActiveRecord: Setup

```ruby
# Gemfile

# PG database adapter lets us talk with a Postgres database
gem "pg"

# ActiveRecord wraps around the database
gem "activrecord"
```
---

#ActiveRecord: Setup

We need to make our project classes (but not our tests) inherit from `ActiveRecord::Base` so they have access to ActiveRecord methods.

---

# ActiveRecord: Setup

This is our Insect class right now:

```ruby
class Insect

  attr_accessor :name, :description, :seen_by, :location

  def initialize(name:, seen_by:, location:, description:)
    @name = name
    @seen_by = seen_by
    @location = location
    @description = description
  end

end
```

---

# ActiveRecord: Setup

```ruby
class Insect < ActiveRecord::Base
  # class methods here
end
```

---

# ActiveRecord: Setup

When we try this out in Pry, we'll get this error:

```
uninitialized constant ActiveRecord (NameError)
```

This means that Ruby doesn't know where to find `ActiveRecord`.

---

# ActiveRecord: Setup

We can fix that by adding `require "active_record"` at the start of our `insect.rb` file. Now when we try to run `insect.rb` in Pry, it should be successful.

---

![](https://drewbmac.files.wordpress.com/2012/07/amazing-macro-insect-photography-by-dusan-beno-photos-043.jpeg)

---


# ActiveRecord: Setup

When we try to create our first `Insect` record, we'll get this error:

```
ActiveRecord::ConnectionNotEstablished: 
No connection pool for Insect from ...
```

So we'll need to give ActiveRecord a database to talk with.

---
# ActiveRecord: Setup

We'll first create `config/environment.rb` to tell Ruby how to connect to the database and a `config/database.yml` to provide the exact details of that connection.

---

# ActiveRecord: Setup

Thus, your main directory should look like this:

+ **lib**
+ **tests**
+ **config**
  + environment.rb
  + database.yml

---

# ActiveRecord: Setup

```ruby
# config/environment.rb
require "active_record"
require "yaml"

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)
```

---

# ActiveRecord: Setup

Next, we'll add the following line to `tests/test_helper.rb`

```ruby
require_relative '../config/environment.rb'
```

---

# ActiveRecord: Setup

Now, when we run `rake`, we'll get this error:

```
ActiveRecord::NoDatabaseError: FATAL:  
  database "bug_tracker" does not exist
```

So we need some way to create our database.

---

# ActiveRecord: Setup

In the past, you would have to manually create the database using your database console. Now, we just create a `rake` task to do this for us:

`rake db:create`

---

# ActiveRecord: Setup

We'll add the following to our Rakefile:

```
# Rakefile
require 'pg'
require 'active_record'
require 'yaml'

namespace :db do
  desc "Create the db"
  task :create do
    connection_details = YAML::load(File.open('config/database.yml'))
    admin_connection = connection_details.merge(
      {'database'=> 'postgres', 'schema_search_path'=> 'public'}) 
    
    ActiveRecord::Base.establish_connection(admin_connection)
    ActiveRecord::Base.connection.create_database(connection_details.fetch('database'))
  end
end
```

---

# ActiveRecord: Setup

Once we've made this modification to our Rakefile, we can run `rake db:create` on the command line. It should run without error.

---

# ActiveRecord: Setup

When we run `rake` to run our tests, we'll get this error:

```
ActiveRecord::StatementInvalid: PG::UndefinedTable: 
ERROR:  relation "insects" does not exist
```

---

# ActiveRecord: Setup

Thus, we need to create a table for our insects. To do so, we'll need to make use of *migrations*.

---

![](http://www.capitalotc.com/wp-content/uploads/2014/11/insect-family-tree.jpg)

---

# ActiveRecord: Setup

We'll need to do a few things before we are ready to use migrations:

1. Add the `rake db:migrate` command to our Rakefile
2. Learn how to create migrations
3. Create our first migration script
4. Run our first database migration

---

# ActiveRecord: Setup

We'll add the following to our Rakefile (inside our already existing `:db` namespace):

```
namespace :db do
  desc "Migrate the db"
  task :migrate do
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.migrate("db/migrate/")
  end
end
```

---

# ActiveRecord: Setup

Next, we'll make two folders: `db` and `db/migrate`. So your main directory should look like this:

+ **config**
+ **db**
  + **migrate**
+ **lib**
+ **tests**

---
# ActiveRecord: Setup

Inside `db/migrate`, we'll make our first migration:

```ruby
  # db/migrate/0001_create_insects_table.rb
  class CreateInsectsTable < ActiveRecord::Migration
    def change
      create_table :insects do |t|
        t.string :name
        t.string :descripton
        t.string :location
        t.string :where_we_saw_it
      end
    end
  end
```

---

# ActiveRecord Migrations

We'll stick our migrations inside `db/migrate`. Migration file names will start with a number (count up), then an underscore, then the class name (`snake_cased`).

---

# ActiveRecord Migrations

Uh oh! We forgot to add a `seen_by` column! Let's fix that:

```ruby
  #db/migrate/0002_create_seen_by_column_in_insects.rb
  class CreateSeenByColumnInInsects < ActiveRecord::Migration
    def change
      add_column :insects, :seen_by, :string
    end
  end
```

---

# ActiveRecord Migrations

Now we can run `rake db:migrate` to propagate these changes. It should work.

---

# ActiveRecord Migrations

Uh oh! We've got an unnecessary column! Let's fix that too:

```ruby
  # db/migrate/0003_remove_unnecessary_where_we_saw_it_column.rb
  class RemoveUnnecessaryWhereWeSawItColumn < ActiveRecord::Migration
    def change
      remove_column :insects, :where_we_saw_it, :string
    end
  end
```

---

# ActiveRecord Migrations

Now we can run `rake db:migrate` again to see the changes.

---

# ActiveRecord Migrations

Uh oh! We misspelled `description`! Let's fix that too:

```ruby
  #db/migrate/0004_rename_description_to_fix_spelling_error.rb
  class RenameDescriptionToFixSpellingError < ActiveRecord::Migration
    def change
      rename_column :insects, :descripton, :description
    end
  end
```

---

# ActiveRecord Migrations

Once again, we'll run `rake db:migrate` to fix this.

---

# ActiveRecord: Setup

Once we have this set, we can run `rake db:migrate`. It should run without error.

From here, we can run our tests with `rake`; they should pass.

But we still need to do some more work to get our class working in Pry.

---

![](http://www.wallpaperstunnel.com/wp-content/uploads/2016/03/Download-Insects-HD-Wallpapers.jpg)

---
# ActiveRecord: Setup

Here's our new `main.rb` (in the project root):

```ruby
require_relative "config/environment.rb"
require "active_record"
require "pry"
require "yaml"
require_relative "lib/insect.rb"

binding.pry

```

---
# ActiveRecord: Setup

We'll run it and try to create our first Insect object:

```ruby
i = Insect.new(name: "Fuzzy Mantis", seen_by: "Andrew", location: "FUSE",
               description: "A furry mantis")
```

---
# ActiveRecord: Setup

Here's what we got:

```
=> #<Insect:0x007f88e2403978 not initialized>
```

When we try to call the various getters and setters, they work.

---

![](http://sweetsoundeffects.com/wp-content/uploads/2012/03/insectsbugs.jpg)

---

# ActiveRecord: A Brief Detour
![](http://sweetsoundeffects.com/wp-content/uploads/2012/03/insectsbugs.jpg)

---

# ActiveRecord: A Brief Detour

We can create objects in memory just like we have before, that is, by calling `new`. But this doesn't save the object to the database.

---

# ActiveRecord: A Brief Detour

In order to save, we'll have to create an object, then call `save` on it. This should save it to the database.

---

# ActiveRecord: A Brief Detour

To reiterate: there is a difference between creating an object and creating a database record representing that object.

---

# ActiveRecord: Setup

When we try to save our insect we get an error:

```
NoMethodError: undefined method `[]' for nil:NilClass
```

---

![](https://62e528761d0685343e1c-f3d1b99a743ffa4142d9d7f1978d9686.ssl.cf2.rackcdn.com/files/107906/wide_article/width1356x668/image-20160112-6986-9rkeeg.jpg)

---
# ActiveRecord: Setup

This error happens because our pre-existing `initialize` methods and our pre-existing getters and setters are interfering with ActiveRecord.

---
# ActiveRecord: Setup

The solution, then: get rid of them!

```ruby
# lib/insect.rb
class Insect < ActiveRecord::Base

end
```

---

# ActiveRecord: Setup

Of note: ActiveRecord creates an `id` for us; we'll never set the ID directly, as this ID is for ActiveRecord's purposes, rather than ours.

---



![](http://static.thetechjournal.net/wp-content/uploads/2014/04/Insect-Sleeping.jpg)

---

# Active Record :CRUD Functions
![](http://static.thetechjournal.net/wp-content/uploads/2014/04/Insect-Sleeping.jpg)

---

#Active Record: CRUD Functions
![](http://www.pets4homes.co.uk/images/articles/1060/large/10-misconceptions-people-commonly-hold-about-insects-521d0129cd234.jpg)

---

# ActiveRecord: Creating Records

Now there are some things we can do:

+ Create objects
+ Create records

But what about the rest of our CRUD functions?

---
# ActiveRecord: Reading Records

```ruby
Insect.count
Insect.all
Insect.find_by_id(7)
Insect.where(name: "Fuzzy Mantis")
```

---
# ActiveRecord: Updating Records

```ruby
i = Insect.find_by_id(3)
i.update_attributes(name: "Ek's Fuzzy Mantis")
```
---
# ActiveRecord: Destroying Records

```ruby
i = Insect.find_by_id(13)
i.destroy
```

---

![](http://www.pets4homes.co.uk/images/articles/1060/large/10-misconceptions-people-commonly-hold-about-insects-521d0129cd234.jpg)

---
# ActiveRecord: Setup

The last thing we'll do is add a rake task to drop all data in the database (we'll use this if we make a mistake and need to start over):

```ruby
namespace :db do
  desc "drop the db"
    task :drop do
    connection_details = YAML::load(File.open('config/database.yml'))
    admin_connection = connection_details.merge({'database'=> 'postgres', 
                                                    'schema_search_path'=>
                                                    'public'}) 
    ActiveRecord::Base.establish_connection(admin_connection)
    ActiveRecord::Base.connection.drop_database(connection_details.fetch('database'))
  end
end
```

---


![](http://www.hdfinewallpapers.com/HDWallpapers/Big/Insects/Colorful_Beetle_Insect_HD_Wallpapers.jpg)

---

# Homework
![](http://4.bp.blogspot.com/-lxzdZ2x-9l4/UXtCYso7VTI/AAAAAAAAtLc/XoNFSQturmU/s1600/Insects+HD+Wallpapers+(9\).jpg)

---

# Homework

Add a database backing to your class. Go the long way and follow the steps outlined here. From tomorrow onward, we'll have some convenient starter projects to use (how much of a pain would it be if we had to do this every time?).

---

# Homework

Additionally, if we're going to make use of ActiveRecord, we'll need to become more comfortable with the ActiveRecord methods. Clone and set up the BugTracker thus far (don't worry about forking it) and create some records. Then try out the ActiveRecord methods listed in the issue.

---

# Tomorrow and Beyond
![](http://www.coolwallpapers.org/photo/54869/Insects_Wallpapers-3.jpg)

---

# Tomorrow

Tomorrow, we'll do some quick review of ActiveRecord methods and we'll talk about validation and relationships.

---

# Wednesday

On Wednesday, we'll talk about many-to-many relationships and mapping out a path for our driver.

---

# Thursday and Friday

On Thursday and Friday, you'll be building a project.

---

# Next Week

Next week, we'll take our models and give them a web interface.

---

![](http://www.lazerhorse.org/wp-content/uploads/2014/03/Vasiliy-Menshov-macro-insect-photos-3.jpg)

---

![](http://wallpapershub.xyz/images/wallpaper-insects-wallpaper-x.jpg)

---

![](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/European_honey_bee_extracts_nectar.jpg/1280px-European_honey_bee_extracts_nectar.jpg)

