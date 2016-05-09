<center><h1>WEEK 08 NOTES</h1></center>

## Table of Contents

#### DAY 01 
1. [User Authentication](#user_authentication)
2. [Sorcery](#sorcery)

------
<br>
<br>
<br>
<br>
## <a name="user_authentication" /> User Authentication
<sub>[[Return to Table of Contents]](https://github.com/star-city-code-school/fenrir/blob/master/lesson_plans/week_09/week_09_notes.md)</sub>
<br>
<br>

  Things a program needs for user authentication
  - username
  - password 
  - user model 
  - user model with CRUD operations

NEVER EVER EVER USE GET when logging someone in.

To keep a person safely logged in, you'll probably want to store the user id in session data.
When storing the login password in the database, it is standard practice to make sure that the passwords are encrypted. That way, if database security is ever compromised, 
someone only has the "crypted password. The original password is never actually used again. Each time a user tries to sign in, it encrypts the given password and compares it against the crypted password in the database. 

<br>
<br>
<br>
<br>

------

<br>
<br>
<br>
<br>

## <a name="sorcery" />Sorcery (User Authentication Gem)
<sub>[[Return to Table of Contents]](https://github.com/star-city-code-school/fenrir/blob/master/lesson_plans/week_09/week_09_notes.md)</sub>
<br>
<br>

The first thing you'll want to do is add the library to your program. [Get Sorcery Here](https://github.com/NoamB/sorcery)

Add this line to your gemfile: 
```
gem "sorcery"
```

Then, run `bundle install` 

After creating a database, run:

```
rails generate sorcery:install
```

This will create a User model with a few data columns, as well as a few tests. 

However, it won't create controllers, views, or routes. While this might initially be a little frustrating, 
you'll eventually be quite thankful for the ability to customize the look, feel, and behaviors of your user authentication and creation pages. 

Russian blogger, Ilya Bodrov, offers a very in-depth tutorial on how to set up user authentication and creation with Sorcery. Check it out if you find yourself feeling overwhelmed. 

[Sorcery Tutorial](http://www.sitepoint.com/magical-authentication-sorcery/)
