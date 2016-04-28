#WEEK 07 DAY 03 NOTES

##Quick Overview for Sinatra Project Framework
**Database** - Postgres (stores records)


**seeds.rb** - Stores database data. Can be set up ahead of time to pre-load data into db at bin/setup. runs based on schema or pre-existing seeds.rb file. 
                There are gems for your frameworks that often will create/update seeds files or create dummy records for you. This can be invaluable, as writing large seed files by hand can become quite time consuming.


[rroblak (For Rails)](https://github.com/rroblak/seed_dump)<br>
["Ffaker" (Ruby Gem)](https://rubygems.org/gems/ffaker)

**schema.rb** - tracks the db schema <br>
**Migrations** - define tables (record) / columns (attr)<br>
**Models** - Class with Table 


---


## JavaScript ( More DOM Manipulation Magic)

**Troubleshooting command:** `debugger` <br>
This is just like Ruby's binding.pry -- use it to "pause" your JavaScript operations. It is an invaluable tool for troubleshooting, testing code in the console before methods have finished, or stopping in the middle of functionality that would have otherwise been impossible to check (all code not in functions or event listeners complies and runs at the beginning of the page load).



### JavaScript: eventListeners
[List of events available in JavaScript](https://developer.mozilla.org/en-US/docs/Web/Events)

####Examples of commonly used eventListeners



| Name        | Event Type      | How it Triggers                                                                                           | EXAMPLE                                                                         |
|------------ |:---------------  |:---------------------------------------------------------------------------------------------------------  |:-------------------------------------------------------------------------------- |
| click       | MouseEvent      | A pointing device button has been pressed and released on an element.                                     | ```element.addEventListener("click", function(){    CODE GOES HERE  });```      |
| mouseover   | MouseEvent      | A pointing device is moved onto the element that has the listener attached or onto one of its children.   | ```element.addEventListener("mouseover", function(){    CODE GOES HERE  });```  |
| mouseleave  | MouseEvent      | A pointing device is moved off the element that has the listener attached.                                | ```element.addEventListener("mouseleave", function(){ CODE GOES HERE  });```    |
| keydown     | KeyboardEvent   | A key is pressed down.                                                                                    | ```element.addEventListener("keydown", function(){ CODE GOES HERE  });```       |
| keyup       | KeyboardEvent   | A key is released.                                                                                        | ```element.addEventListener("keyup", function(){      CODE GOES HERE  });```    |
| load        | UIEvent         | A resource and its dependent resources have finished loading.                                             | ```element.addEventListener("load", function(){ CODE GOES HERE  });```          |

---

**Things to Remember:** <br>
If you put the Javascript script node in the header of your HTML file, all the Javascript sitting outside of functions or eventListeners will compile before your HTML even loads.
This can cause problems if you are declaring variables with a value of HTML Ids, Classes, Tags, etc.
To make sure the JavaScript file compiles AFTER the HTML loads in, you need to add an event listener for the page load


  ```
  window.addEventListener("load", function() {
    "ALL YOUR JAVASCRIPT GOES HERE"
  });
  ```
**Fun Fact:** <br>
  Need to clear **all** the child elements inside a parent node? <br>
  call ``` PARENT_CONTAINER_EXAMPLE.innerHTML = ""; ``` <br>
  It is arguably one of the fastest, most efficient ways to clean up specified sections of your HTML page. <br>
  **HOWEVER**, this is an **"all or nothing"** move -- don't use it if you want to selectively eliminate child nodes.

## Tic Tac Toe 
  Here is an example of a fully functional 
['tic tac toe' game](https://github.com/maedae/w07-d03-tic-tac-toe)<br>
Again, as is common with programming, this is but one of the many, many ways to solve this problem. Even this code could benefit from further refactoring.
