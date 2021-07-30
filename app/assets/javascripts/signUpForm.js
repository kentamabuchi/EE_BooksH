'use strict'; {
  const form = document.getElementById("new_user");
  const formText = document.getElementsByClassName("formText");
  const signUpFormBtn = document.getElementById("signUpBtn");
  const passwordForm = document.getElementById("password");
  const rePasswordForm = document.getElementById("rePassword");

  signUpFormBtn.addEventListener('click', function(e) {

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

    if( passwordForm.value !== "" && passwordForm.value.length < 6 ) {
      passwordForm.classList.add("formError");
      passwordForm.nextElementSibling.textContent = "6文字以上で入力してください";
      submitStatus = "false";
    }else if( passwordForm.value.length > 6 ) {
      passwordForm.classList.remove("formError");
      passwordForm.nextElementSibling.textContent = "";
      submitStatus = "true";
    }

    if( rePasswordForm.value !== "" && passwordForm.value !== rePasswordForm.value ) {
      rePasswordForm.classList.add("formError")
      rePasswordForm.nextElementSibling.textContent = "パスワードが一致していません";
      submitStatus = "false";
    }else if( rePasswordForm.value !== "" && passwordForm.value == rePasswordForm.value ) {
      rePasswordForm.classList.remove("formError");
      rePasswordForm.nextElementSibling.textContent = "";
      submitStatus = "true";
    }


    if ( submitStatus !== "false" ) {
      form.submit();
    }


    console.log(submitStatus);

  });



}
