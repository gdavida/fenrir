// Put some scripts here?

function makeRed() {
  var headers = document.getElementsByClassName("header");
  for (var i = 0; i < headers.length; i++) {
    addClass(headers[i], "red");
  }
}

function returnToBlack() {
  var headers = document.getElementsByClassName("header");
  for (var i = 0; i < headers.length; i++) {
    headers[i].classList.remove("red");
  }
}

function makePurple(el) {
  addClass(el, "purple");
}

function addClass(element, className) {
  element.classList.add(className);
}
