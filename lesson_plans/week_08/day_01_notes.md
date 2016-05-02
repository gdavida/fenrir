# WEEK 08 DAY 01 

## Suggested Rails Prep 

[Michael Hartl's Ruby on Rails Tutorial](rails-tutorial.org/book) _(read Chapters 1 - 5 for a really good rundown on Rails basics)_

---

## Rails Overview
- Uses MVC framework. 
- Invented in 2005 by [David Heinemeier Hansson](https://twitter.com/dhh?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor).
- The Rails framework is a collection of gems and helpers (ActiveRecord, ActiveMailer, etc.).
- Can be a handy framework, as it allows a relatively small team to quickly create a program (different frameworks require larger teams and/or more time to create the same aforementioned program).

##### Note:
<p> There is a lot of "magic" in Rails, which was why we started out with Sinatra. The hidden complexity is nice - but you can't appreciate it or understand what the framework is doing for you if you haven't mastered the fundamentals of an MVC framework. (this also applies to using jQuery before you have a good grasp on how JavaScript works) </p>

<p> For the first few days, it is very likely that you will be less productive with Rails than you were when Sinatra. This won't always be the case. It does take a little time to become familiar with a new framework. Have patience. Keep the faith. It's gonna get awesome. </p>

---

## Creating a Project in Rails
on the command line: <br>
- ``` $ rails new PROJECT_NAME - d postgresql ``` <br>
- ('-d postgresql' _is your database adapter. That bit of code specifies what type of db language the project will use)_

- cd into your program, then run ``` bundle install ```

- Check out what you made by entering: ``` ls -l ``` 

- Generate a model:<br>
```rails generate model tableName column_name:data_type column_name2:date_type ```

- Generate a controller for your model: <br>
``` rails generate controller tableName ``` <br>
_( you can create controller functions, view pages and routes from the command line, but for practice and better understanding of Rails, try to do those by hand for the first few tiny projects)_

##### Note:
If you don't specify a page to render in the controller, Rails will assume you are trying to render a view page that has the same name as the controller function.

### Sinatra vs. Rails breakdown
(Click on the picture to view a larger version of the image)

#### Sinatra
<a href="http://i.imgur.com/efW9YKQ.png"><img src="http://i.imgur.com/efW9YKQ.png" alt="URL Breakdown" style="width:600px; max-height:400px"></a>
<p> Routes/Controller/Views Indicator in Sinatra </p>

#### Rails

##### Controllers
<a href="http://i.imgur.com/XOpiuCf.png"><img src="http://i.imgur.com/XOpiuCf.png" alt="URL Breakdown" style="width:600px; max-height:400px"></a>
<p> Room Controller (Rails) </p>

<a href="http://i.imgur.com/wbP1a8x.png"><img src="http://i.imgur.com/wbP1a8x.png" alt="URL Breakdown" style="width:600px; max-height:400px"></a>
<p> Room View (Rails) </p>

##### Views 
<a href="http://i.imgur.com/GYAcUOl.png"><img src="http://i.imgur.com/GYAcUOl.png" alt="URL Breakdown" style="width:600px; max-height:400px"></a>
<p> Building View (Rails) </p>

<a href="http://i.imgur.com/GYAcUOl.png"><img src="http://i.imgur.com/GYAcUOl.png" alt="URL Breakdown" style="width:600px; max-height:400px"></a>
<p> Building View (Rails) </p>

##### Routes
<a href="http://i.imgur.com/jsITcmT.png"><img src="http://i.imgur.com/jsITcmT.png" alt="URL Breakdown" style="width:600px; max-height:400px"></a>
<p> Routes for Building & Room (Rails) </p>

---

## Rails / Rake Commands (FYI)

#### Rake
- ``` rake db:create ``` _(creates a database from schema and seeds info)_
- ``` rake db:migrate ``` _(updates database schema)_
- ``` rake db:seed ``` _(seeds data into database from seeds.rb)_
- ``` rake db:drop ``` _(drops the current database)_
- ``` rake -T ``` _(view all rake commands in console)_
- ``` rake routes ``` _(view all current route paths and aliases in your Rails project)_

#### Rails

- ``` rails server ```  or  ``` rails s ```  _(control + c to exit your server)_
- ``` rails console ``` _(like repl or binding.pry)_
- ``` rails generate model tableName column_name:data_type column_name2:data_type ```
- ``` rails generate controller tableName function names go here with spaces between them ```

## Forms in Rails 
[List of Form Tag Helpers](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html)

<a href="http://i.imgur.com/kK8b9QA.jpg"><img src="http://i.imgur.com/kK8b9QA.jpg" alt="URL Breakdown" style="width:600px; max-height:400px"></a>
<p> Example of Form_Tag in Rails </p>

<p> Form tags are a great reason to consider using the Rails ** alias ** feature, rather than the direct route path. If you need to change your route path (but leave the alias alone) you will not need to update every view page where you referenced that route. </p>
While creating forms in Rails, [you need to use some sort of form helper](http://guides.rubyonrails.org/form_helpers.html). Each time a form element is built, it contains a random, encoded sequence that is also submitted with the form. You can't really spoof this by hand. If you try to create a form without utilizing a form helper, you're going to hit a lot of errors...and it probably won't work.
