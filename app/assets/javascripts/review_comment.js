'use strict';
{
var commentForms = document.getElementsByClassName("reviewShow__commentFormIcon");
var forms = document.getElementsByClassName("reviewShow__commentForm");


for (var i = 0; i < commentForms.length; i++) {
commentForms[i].addEventListener("click", function() {
    forms[0].classList.toggle("reviewShow__apper");
}, false);

}

}
