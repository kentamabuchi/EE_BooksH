`use strict`; {
  const icon = document.getElementById("userSign");

  let count = 0;
  const countUp = () =>{
    count++;
  }
  let intervalId;


  const start = function(btnId){
    btnId.addEventListener("mousedown", function() {
      console.log('click');
      intervalId = setTimeout(() =>{
          // btnId.classList.add("hidden");
          // activeIcon.classList.remove("hidden");
          let link = document.getElementById("loginLink");
          let oldHref = link.getAttribute("href");
          let newHref = oldHref.replace("users", "admins");
          link.setAttribute("href", newHref);
          document.getElementById("item").style.backgroundColor = "green";
        }, 5000);
      // intervalId = setInterval(() =>{
      //   countUp();
      //   if(count > 5){　
      //     icon.classList.add("hidden");
      //     clearInterval(intervalId);
      //   }}, 1000);
      });
  }


  const stop = function(btnId){
    btnId.addEventListener("mouseup", function() {
      console.log('hanareta');
      clearTimeout(intervalId);
    });
  }

  const changeBtn = start(icon);
  const stopActive = stop(icon);
  // const change = start(link, icon);
  // const stop = end(link);

}