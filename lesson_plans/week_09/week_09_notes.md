<center><h1>WEEK 09 NOTES</h1></center>

## Table of Contents

#### DAY 01 
1. [User Authentication](#user_authentication)
2. [Sorcery](#sorcery)

#### DAY 02

#### DAY 03
1. [Controller Tests](#controller_tests)

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



<br>
<br>
<br>
<br>

------

<br>
<br>
<br>
<br>

## <a name="controller_tests" /> Controller Tests 
<sub>[[Return to Table of Contents]](https://github.com/star-city-code-school/fenrir/blob/master/lesson_plans/week_09/week_09_notes.md)</sub>

####  Testing Users Controller (When using Sorcery)

The first thing you need to do is teach your program how to use Sorcery in its test environment. 

In your test_helper.rb file, paste:

```
class ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller
end

```



This allows our test the controllers of any models we created with Sorcery. 

create and edit controller tests require params. 
create and edit should also be listed as "post."

#### CREATE

```
test "should successfully create user" do 
  post :create, user: { name: "test", email:"test@test.com", password: "password", password_confirmaton: "password" }
  assert_redirected_to users_path 
end
```

```
test "should not create user" do 
  post :create, user: { name: "test", email:"test@test.com", password: "password", password_confirmaton: "password" }
  assert_template :new
end
```

#### SHOW (W/ Authentication Checks) 
_--for the sake of the assignment, we will assume that a user should not be able to see this page unless logged in_

```
test "should redirect from show to login path" do 
  @user = User.create!(name: "test", email: "test@test.com", password: "password", password_confirmation: "password")
  get :show, id: @user  
  assert_redirected_to login_path
end
```
```
test "should show when logged in" do 
  @user = User.create!(name: "test", email: "test@test.com", password: "password", password_confirmation: "password")
  login_user(user=@user, route=login_path)
  get :show, id: @user
  assert_response :success
end
```

These are only very basic examples of tests. You can test for any number of situations. For example, you can also use assert_differences to keep track of the variable's corresponding table count at successful / unsuccessful creation, destruction, update, etc. 

