'use strict'; {
  const deleteBtn = document.getElementsByClassName("deleteBtn");
  const deleteForm = document.getElementsByClassName("ABIndex__deleteForm");
  const cancelBtn = document.getElementsByClassName("ABIndex__deleteForm__cancelBtn");
  for( let i = 0; i < deleteBtn.length; i++){
    deleteBtn[`${i}`].addEventListener("click", function() {
      deleteForm[`${i}`].classList.remove("ABIndex__formHidden");

    });
    cancelBtn[`${i}`].addEventListener("click", function() {
      deleteForm[`${i}`].classList.add("ABIndex__formHidden");
    });
  }

}