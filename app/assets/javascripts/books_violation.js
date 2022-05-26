'use strict'; {
  const btn = document.getElementById("violation");
  const form = document.getElementById("violationForm");
  const closeBtn = document.getElementById("closeForm");

  btn.addEventListener('click', () =>{
    form.style.display = "block";
  });

  closeBtn.addEventListener('click', () =>{
    form.style.display = "none";
    console.log(form)
  });

}