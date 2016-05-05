<center><h1> Week 08 Notes </h1></center>

## Table of Contents <br />

### DAY 01 && 02:
1. [Suggested Rails Prep](#suggested_rails_prep) 
2. [Rails Overview](#rails_overview)
3. [Creating a Project in Rails](#creating_rails_project)
4. [Rails / Rake Commands](#rake_rails_command)
5. [Rails Forms](#forms_in_rails)

### DAY 03:
1. [TODOs](#todos) 
2. [Partials](#partials)

### Day 04:
1. [Guard](#guard)
2. [Annotate](#annotate)
3. [Gemfile Practices](#gemfile_practices)
4. [GitHub Collaboration](#collaborative_work)

------

<br>
<br>
<br>
<br>
<br>

##<a name="suggested_rails_prep" />Suggested Rails Prep 

[Michael Hartl's Ruby on Rails Tutorial](http://www.rails-tutorial.org/book) _(read Chapters 1 - 5 for a really good rundown on Rails basics)_

<br>
<br>
<br>
<br>
<br>

---

<br>
<br>
<br>
<br>
<br>

## <a name="rails_overview" />Rails Overview
- Uses MVC framework. 
- Invented in 2005 by [David Heinemeier Hansson](https://twitter.com/dhh?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor).
- The Rails framework is a collection of gems and helpers (ActiveRecord, ActiveMailer, etc.).
- Can be a handy framework, as it allows a relatively small team to quickly create a program (different frameworks require larger teams and/or more time to create the same aforementioned program).

##### Note:
<p> There is a lot of "magic" in Rails, which was why we started out with Sinatra. The hidden complexity is nice - but you can't appreciate it or understand what the framework is doing for you if you haven't mastered the fundamentals of an MVC framework. (this also applies to using jQuery before you have a good grasp on how JavaScript works) </p>

<p> For the first few days, it is very likely that you will be less productive with Rails than you were when Sinatra. This won't always be the case. It does take a little time to become familiar with a new framework. Have patience. Keep the faith. It's gonna get awesome. </p>

<br>
<br>
<br>
<br>
<br>

---

<br>
<br>
<br>
<br>
<br>

## <a name="creating_rails_project" />Creating a Project in Rails
on the command line: <br>
1. ``` $ rails new PROJECT_NAME - d postgresql ```<br>
('-d postgresql' _is your database adapter. That bit of code specifies what type of db language the project will use)_

2. cd into your program, then run ``` bundle install ```

3. Check out what you made by entering: ``` ls -l ``` 

4. Generate a model:<br>
```rails generate model tableName column_name:data_type column_name2:date_type ```

5. Generate a controller for your model: <br>
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

<br>
<br>
<br>
<br>
<br>

---

<br>
<br>
<br>
<br>
<br>

## <a name="rake_rails_command" />Rails / Rake Commands (FYI)

#### Rake
- ``` rake db:create ``` _(creates a database from schema and seeds info)_
- ``` rake db:migrate ``` _(updates database schema)_
- ``` rake db:seed ``` _(seeds data into database from seeds.rb)_
- ``` rake db:drop ``` _(drops the current database)_
- ``` rake -T ``` _(view all rake commands in console)_
- ``` rake routes ``` _(view all current route paths and aliases in your Rails project)_

#### Rails

- ``` rails server ``` ** or ** ``` rails s ```  _(**control + c** to exit your server)_
- ``` rails console ``` _(like repl or binding.pry)_
- ``` rails generate model tableName column_name:data_type column_name2:data_type ```
- ``` rails generate controller tableName function names go here with spaces between them ```

<br>
<br>
<br>
<br>
<br>

---

<br>
<br>
<br>
<br>
<br>

## <a name="forms_in_rails" />Forms in Rails 
[List of Form Tag Helpers](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html)

<a href="http://i.imgur.com/kK8b9QA.jpg"><img src="http://i.imgur.com/kK8b9QA.jpg" alt="URL Breakdown" style="width:600px; max-height:400px"></a>
<p> Example of Form Tag in Rails </p>

<p> Form tags are a great reason to consider using the Rails ** alias ** feature, rather than the direct route path. If you need to change your route path (but leave the alias alone) you will not need to update every view page where you referenced that route. </p>
While creating forms in Rails, [you need to use some sort of form helper](http://guides.rubyonrails.org/form_helpers.html). Each time a form element is built, it contains a random, encoded sequence that is also submitted with the form. You can't really spoof this by hand. If you try to create a form without utilizing a form helper, you're going to hit a lot of errors...and it probably won't work.
<br>
<br>
<br>
<br>
<br>

## <a name="todos" /> TODOs (and other ways make notes in your program)
<br> 
In many cases, it is often better to document things in [GitHub Issues](https://guides.github.com/features/issues/) 
or other [project management programs](http://www.techworld.com/picture-gallery/startups/10-best-free-project-management-software-programs-3625922/) (There are sooooo many free platforms out there. Perhaps TOO many...). 
If used correctly, your PM software can be a huge asset when doing collaborative work. 
A good PM platform is also great for solo developers who prefer a more structured workflow.

<p>There are several handy, built-in methods for writing memos in your program. 
Below, you can find information on how to set and retrieve them. 
However, please keep in mind that when working on group projects, 
other people can change and/or delete these "notes."</p>

```
# TODO your notes go here
```
 AND/OR
```
# FIXME your notes go here
```
AND/OR
```
# OPTIMIZE your notes go here
``` 

Command line:
```
rake notes
```

<br>
<br>
<br>
<br>
<br>

------

<br>
<br>
<br>
<br>
<br>


## <a name="partials" />Partials

partial files look a lot like regular view files, however they have an underscore at the beginning of the title.

To render the contents of that partial on a different page, you use an embedded ruby tag, denoting the pathway to the view page. If it is in the same folder as the current view page, all you need to do is:  _(note: you do NOT include the underscore or file type)_
```
<% render "name_of_file" %>
```
If the file containing the partial is not in the same folder, you need to call the pathway to the view page. Example:
```
<% render "/folder/file_name" %>
```

A partial is a fantastic way to render error messages for all your models using the form_for helper:

```
<% if f.object.errors.any? %>
  <ul>
    <% f.object.erros.full_message.each do |error| %>
      <li><%= error %></li>
    <% end %>
  </ul>
<% end %>
```

Save this in your layouts view folder as:
```
_form_errors.html.erb
```

On view page utilizing the partial, use: 
```
<%= render partial: "layouts/form_errors", locals: {f: f} %>
```
<br>
<br>
<br>
<br>
<br>

------

<br>
<br>
<br>
<br>
<br>

## <a name="guard" />Guard 
Using this gem file is 100% optional (but is amazing and definitely worth trying out)
If you add a gem to your gem file, add a comment with a link to the repo, as well as a brief description of what it is (it's just good practice. other devs will love and appreciate you).

[Here is a link to the Guard repo](https://github.com/guard/guard-bundler)

Follow the install and setup directions on the repo. Learning how to parse through gem file documentation can be an invaluable skill (you'll probably be using gems more often than you think).

Once Guard is set up, you want to get [Guard Minitest](https://github.com/guard/guard-minitest)

Another fun testing gem is [Guard Notifier](https://github.com/Codaisseur/terminal-notifier-guard)
It will alert you via the top, right-hand corner of the screen of passing tests that are running/failing that are directly related to the file you are currently working in.

<br>
<br>
<br>
<br>
<br>

---

<br>
<br>
<br>
<br>
<br>

## <a name="annotate" />Annotate

[Annotate](https://github.com/ctran/annotate_models): Gem file adds a comment that annotates several files in your project for you. 
For example — it will add the schema of the model as a comment when running rake db:migrate so that you don't need to keep referring to your schema.

<br>
<br>
<br>
<br>
<br>

---

<br>
<br>
<br>
<br>
<br>

## <a name="gemfile_practices" />Gemfile Practices:
If the gem'ss only purpose is to aid in your workflow, make sure it goes in the development section, or it will appear on your production server and can cause problem or annoyances.

<br>
<br>
<br>
<br>
<br>

---

<br>
<br>
<br>
<br>
<br>

## <a name="collaborative_work" />Collaborative Work
Definitely try considering the implementation of a a project manager platform. 
[Waffle](https://waffle.io/), [Zube](http://www.zube.io), or [Vanilla Github Issues](https://guides.github.com/features/issues/)
1. Get setup on both computers (adding a collaborator, setting up issues, etc.)

2. Pick a computer

3. Pick an issue to work on

4. Createa  new feature branch for that issue

5. Work on it, eventually push to GitHub -- create a Pull Request

6. On the other computer, run `git fetch` (to get all branches and changes since your last push on this computer)

7. `git pull origin branchname` (whatever your branchname is) -- this pulls whatever branch you're pulling so that it is up to date with GitHub (as determined by the result of `git fetch`.

8. Check out that branch

9. `git merge master` -> pull the current master branch into the feature branch -- this lets us keep the feature branch current with master

10. checkout master branch (here you should probably fetch and pull again just in case there are new changes)

11. `git merge branchname`-- from master, merge the feature branch (once you're ready)

12. `git push origin master` (you may wish to fetch and pull again, just in case) 
