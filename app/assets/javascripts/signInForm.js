'use strict'; {
  const form = document.getElementById("login_user");
  const email = document.getElementById("loginEmail");
  const pass = document.getElementById("loginPass");
  const formText = document.getElementsByClassName("formText");
  const signInFormBtn = document.getElementById("signInBtn");

  if( email.value !== "" && pass.value == "" ) {
    email.nextElementSibling.textContent = "メールアドレスかパスワードが間違っています";
    email.classList.add("formError");
    pass.classList.add("formError");
  }

  signInFormBtn.addEventListener('click', function(e) {

    e.preventDefault();

    let submitStatus = "false";
    for( let i = 0; i < formText.length; i++) {
      if( formText[i].value == "" ){
        formText[i].classList.add("formError");
        formText[i].nextElementSibling.textContent = "入力されていません";
        submitStatus = "false";
      }else if( formText[i].value !== "" ){
        formText[i].classList.remove("formError");
        formText[i].nextElementSibling.textContent = "";
        submitStatus = "true";
      }
    }

    if ( submitStatus !== "false" ) {
      form.submit();
    }


    console.log(submitStatus);

  });



}
