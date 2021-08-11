'use strict'; {
        
        const openIcon = document.getElementById("open");
        const closeIcon = document.getElementById("close");
        
        openIcon.addEventListener("click", function() {
          document.querySelector(".books__menuBar").style.marginLeft = "0";
          openIcon.classList.toggle("books__menuBar__active");
          closeIcon.classList.toggle("books__menuBar__active");
        });
        
        closeIcon.addEventListener("click", function() {
          document.querySelector(".books__menuBar").style.marginLeft = "-340px";
          openIcon.classList.toggle("books__menuBar__active");
          closeIcon.classList.toggle("books__menuBar__active");
        });

        
      }