
##MVC REVIEW

**Example:**
  server gets a command from a route. This is known as an ERB tag in Sinatra.<br>
  **ACTIONS:** Get, post, patch, delete (patch and delete are not specifically supported by web browsers)

**GET** - purpose is to get information from the server<br>
**POST** - Sending information to the server (should probably save it)<br>
**PATCH** - Updating information stored in the server<br>
**DELETE** - deleting information from the server. <br>

<img src="http://i.imgur.com/lDuTJfL.png" alt="URL Breakdown" style="width:600px; max-height:400px">
<p> URL breakdown </p>



##MVC Workflow 
 **E - ROUTING - CONTROLLER - MODEL - VIEW **<br><br>
**NOTE:**<br>
 _if the @ is removed from a controller variable (@example), the variable can’t be used on the corresponding view page (without going through a lot of extra work)_


<img src="http://i.imgur.com/e7yYyau.png" alt="Sinatra MVC Workflow" style="width:600px; max-height:600px">
<p> Sinatra MVC Workflow </p>


<p>_Keep in mind that not all MVC workflows are the same. For comparision, here is a MVC workflow for Rails (we will learn more about this framework in later weeks)_</p>

<img src="http://i.imgur.com/CtQhdhX.png" alt="Sinatra MVC Workflow" style="width:600px; max-height:600px">
<p> Rails MVC Workflow </p>


##DOM 101 (JavaScript Magic)
Depending on your setup, you might need to reference your JS file in the head of your HTML page (or layout file)<br>
  `<script src='path/to/js/file.js'></script>`

<p>On a rudimentary level, JS can manipulate HTML elements. One of the easiest ways to do this is by referencing the class or the id of the HTML element(s) in question. </p>

<p>You can also select by element type, or select relative to a parent, child or neighbor( relative selection is easier in jQuery and definitely worth looking into once you are confident with JavaScript basics).</p>

**ID:** <br>
  `var VARIABLE = document.getElementById('NAMEOFID');` <br>
  _- used to select one thing_<br><br>
**CLASS:**<br>
  `var VARIABLE = document.getElementsByClassName('NAMEOFCLASS');`<br>
   _- array/collection_<br><br>
**ELEMENT TYPE:** <br>
 `var VARIABLE = document.getElementsByTagName('p');` <br>
  **OR** `document.querySelector('div');`

#Yesterday's JavaScript Homework
<p> [Homework Assignment Solutions](https://github.com/star-city-code-school/w07-d01-js-exercises/pull/1) <br>
The above link is but one of many ways you can get the answer. If your code works, but doesn't look like mine--don't worry, you still probably did it correctly. </p>
