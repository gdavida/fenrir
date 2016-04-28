window.addEventListener("load", function() {
  var navItems = document.getElementsByClassName("nav-item");
  for (var i = 0; i < navItems.length; i++) {
    navItems[i].addEventListener("click", tabEvent);
  };

  var modalTrigger = document.getElementById("modal-trigger");
  modalTrigger.addEventListener("click", triggerModal);

  var modalClose = document.getElementById("modal-close");
  modalClose.addEventListener("click", closeModal);

  var modalShader = document.getElementById("modal-shader");
  modalShader.addEventListener("click", closeModal);

  var passwordField = document.getElementById("password-field");
  passwordField.addEventListener("input", validatePassword);
});

function closeModal() {
  var modalWrapper = document.getElementById("modal-wrapper");
  modalWrapper.classList.add("hidden");
  modalWrapper.classList.remove("visible");
  
  var modalShader = document.getElementById("modal-shader");
  modalShader.classList.add("hidden");
  modalShader.classList.remove("visible");
}

function triggerModal() {
  var modalWrapper = document.getElementById("modal-wrapper");
  modalWrapper.classList.remove("hidden");
  modalWrapper.classList.add("visible");
  
  var modalShader = document.getElementById("modal-shader");
  modalShader.classList.remove("hidden");
  modalShader.classList.add("visible");
}


function tabEvent() {
  
  var typeOfTab = this.innerHTML.toLowerCase();
  
  var navItems = document.getElementsByClassName("nav-item");
  for (var i = 0; i < navItems.length; i++) {
    navItems[i].classList.remove("active");
    navItems[i].classList.add("inactive");
  };
 
  this.classList.remove("inactive");
  this.classList.add("active");

  var containers = document.getElementsByClassName("container");
  for (var i = 0; i < containers.length; i++) {
    containers[i].classList.remove("visible");
    containers[i].classList.add("hidden");
  };

  var wolvesContainer = document.getElementById(typeOfTab + "-container");
  wolvesContainer.classList.add("visible");
}

function validatePassword() {
  var count = this.value.length;

  var pwError = document.getElementById("password-error");
  var btn = document.getElementById("submit-button"); 

  if (count >= 8) {
    pwError.innerHTML = "Valid Password";
    btn.disabled = false;
  } else {
    pwError.innerHTML = "Invalid";
    btn.disabled = true;
  }
}
