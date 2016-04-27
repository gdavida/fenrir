window.addEventListener("load", setUpPage);

function setUpPage() {
  var e = document.getElementById("header-1");
  e.addEventListener("click", sayHi);
  
  elements = document.getElementsByClassName("list-item");
  for (var i = 0; i < elements.length; i++) {
    elements[i].addEventListener("mouseover", makePurple);
  }
}

function sayHi () {
  alert(this.innerHTML);
  this.style.color = "red";
  
}

function makePurple() {
  this.style.color = "purple";
}
