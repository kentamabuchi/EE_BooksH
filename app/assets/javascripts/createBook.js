'use strict'; {
  const form = document.getElementById("form");
  const formText = document.getElementsByClassName("formText");
  const btn = document.getElementById("submitBtn");

    btn.addEventListener('click', function(e) {

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
