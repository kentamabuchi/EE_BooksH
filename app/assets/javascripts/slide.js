'use strict'; {
  const prevBtn = document.getElementById("prevBtn");
  const nextBtn = document.getElementById("nextBtn");
  let slideItems = document.querySelectorAll(".slideItem");
  let indexBtn = document.querySelectorAll(".contentsRecommend__indexBtn");
  

  let slideIndex5 = [].slice.call( slideItems ).indexOf(document.querySelector(".contents__leftOver"));
  let slideIndex1 = [].slice.call( slideItems ).indexOf(document.querySelector(".contents__left"));
  let slideIndex2 = [].slice.call( slideItems ).indexOf(document.querySelector(".contents__center"));
  let slideIndex3 = [].slice.call( slideItems ).indexOf(document.querySelector(".contents__right"));
  let slideIndex4 = [].slice.call( slideItems ).indexOf(document.querySelector(".contents__rightOver"));
  
  let indexLength = slideItems.length


  prevBtn.addEventListener("click", function() {
    
    
    
    slideItems[slideIndex1].classList.add("leftSlide");
    slideItems[slideIndex2].classList.add("leftSlide");
    slideItems[slideIndex3].classList.add("leftSlide");
    
    
    switch (indexLength) {
      case 5:
        slideItems[slideIndex5].classList.add("leftSlide");
        
        
        slideIndex5 -= 1;
        if(slideIndex5 < 0) {
          slideIndex5 = 4;
        }
    
    
        slideIndex1 -= 1;
        if(slideIndex1 < 0) {
          slideIndex1 = 4;
        }
    
        slideIndex2 -= 1;
        if(slideIndex2 < 0) {
          slideIndex2 = 4;
        }
    
        slideIndex3 -= 1;
        if (slideIndex3 < 0) {
          slideIndex3 = 4;
        }
        
        slideIndex4 -= 1;
        if (slideIndex4 < 0) {
          slideIndex4 = 4;
        }

        slideItems[slideIndex2].addEventListener("transitionend", function(){
          
          slideItems[slideIndex5].classList.remove("contents__rightOver");
          slideItems[slideIndex5].classList.add("contents__leftOver");
          
          slideItems[slideIndex1].classList.remove("leftSlide", "contents__leftOver");
          slideItems[slideIndex1].classList.add("contents__left");
          
          slideItems[slideIndex2].classList.remove("leftSlide", "contents__left");
          slideItems[slideIndex2].classList.add("contents__center");
          
          slideItems[slideIndex3].classList.remove("leftSlide", "contents__center");
          slideItems[slideIndex3].classList.add("contents__right");
          
          slideItems[slideIndex4].classList.remove("leftSlide", "contents__right");
          slideItems[slideIndex4].classList.add("contents__rightOver");
          
        });
        break;
        
      case 4:
        console.log(slideIndex4)
        slideItems[slideIndex4].classList.remove("contents__rightOver");
        slideItems[slideIndex4].classList.add("contents__leftOver", "leftSlide");

    
        slideIndex1 -= 1;
        if(slideIndex1 < 0) {
          slideIndex1 = 3;
        }
    
        slideIndex2 -= 1;
        if(slideIndex2 < 0) {
          slideIndex2 = 3;
        }
    
        slideIndex3 -= 1;
        if (slideIndex3 < 0) {
          slideIndex3 = 3;
        }
        
        slideIndex4 -= 1;
        if (slideIndex4 < 0) {
          slideIndex4 = 3;
        }

        slideItems[slideIndex2].addEventListener("transitionend", function(){
          
          slideItems[slideIndex1].classList.remove("leftSlide", "contents__leftOver");
          slideItems[slideIndex1].classList.add("contents__left");
          
          slideItems[slideIndex2].classList.remove("leftSlide", "contents__left");
          slideItems[slideIndex2].classList.add("contents__center");
          
          slideItems[slideIndex3].classList.remove("leftSlide","contents__center");
          slideItems[slideIndex3].classList.add("contents__right");
          
          slideItems[slideIndex4].classList.remove("leftSlide", "contents__right");
          slideItems[slideIndex4].classList.add("contents__rightOver");
          
        });
        break;
        
      case 3:
        slideItems[slideIndex3].classList.remove("contents__right");
        slideItems[slideIndex3].classList.add("contents__leftOver");

    
        slideIndex1 -= 1;
        if(slideIndex1 < 0) {
          slideIndex1 = 2;
        }
    
        slideIndex2 -= 1;
        if(slideIndex2 < 0) {
          slideIndex2 = 2;
        }
    
        slideIndex3 -= 1;
        if (slideIndex3 < 0) {
          slideIndex3 = 2;
        }
        

        slideItems[slideIndex2].addEventListener("transitionend", function(){
          
          slideItems[slideIndex1].classList.remove("leftSlide", "contents__leftOver");
          slideItems[slideIndex1].classList.add("contents__left");
          
          slideItems[slideIndex2].classList.remove("leftSlide", "contents__left");
          slideItems[slideIndex2].classList.add("contents__center");
          
          slideItems[slideIndex3].classList.remove("leftSlide", "contents__center");
          slideItems[slideIndex3].classList.add("contents__right");
          
        });
    }
    

  });

  nextBtn.addEventListener("click", function() {

    slideItems[slideIndex3].classList.add("rightSlide");
    slideItems[slideIndex2].classList.add("rightSlide");
    slideItems[slideIndex1].classList.add("rightSlide");
    
    
    switch (indexLength) {
      case 5:
        
        slideItems[slideIndex4].classList.add("rightSlide");
        
        slideIndex5 += 1;
        if(slideIndex5 > 4) {
          slideIndex5 = 0;
        }
    
        slideIndex1 += 1;
        if(slideIndex1 > 4) {
          slideIndex1 = 0;
        }
    
        slideIndex2 += 1;
        if(slideIndex2 > 4) {
          slideIndex2 = 0;
        }
    
        slideIndex3 += 1;
        if (slideIndex3 > 4) {
          slideIndex3 = 0;
        }
    
        slideIndex4 += 1;
        if (slideIndex4 > 4) {
          slideIndex4 = 0;
        }


        slideItems[slideIndex2].addEventListener("transitionend", function(){
          
          slideItems[slideIndex4].classList.remove("contents__leftOver");
          slideItems[slideIndex4].classList.add("contents__rightOver");
          
          slideItems[slideIndex3].classList.remove("rightSlide", "contents__rightOver");
          slideItems[slideIndex3].classList.add("contents__right");
          
          slideItems[slideIndex2].classList.remove("rightSlide", "contents__right");
          slideItems[slideIndex2].classList.add("contents__center");
          
          slideItems[slideIndex1].classList.remove("rightSlide", "contents__center");
          slideItems[slideIndex1].classList.add("contents__left");
          
          slideItems[slideIndex5].classList.remove("rightSlide", "contents__left");
          slideItems[slideIndex5].classList.add("contents__leftOver");
        });
        break;
      
      case 4:
        slideItems[slideIndex4].classList.add("rightSlide");
        
        slideIndex1 += 1;
        if(slideIndex1 > 3) {
          slideIndex1 = 0;
        }
    
        slideIndex2 += 1;
        if(slideIndex2 > 3) {
          slideIndex2 = 0;
        }
    
        slideIndex3 += 1;
        if (slideIndex3 > 3) {
          slideIndex3 = 0;
        }
    
        slideIndex4 += 1;
        if (slideIndex4 > 3) {
          slideIndex4 = 0;
        }


        slideItems[slideIndex2].addEventListener("transitionend", function(){
          
          slideItems[slideIndex4].classList.remove("rightSlide", "contents__left");
          slideItems[slideIndex4].classList.add("contents__rightOver");
          
          slideItems[slideIndex3].classList.remove("rightSlide", "contents__rightOver");
          slideItems[slideIndex3].classList.add("contents__right");
          
          slideItems[slideIndex2].classList.remove("rightSlide", "contents__right");
          slideItems[slideIndex2].classList.add("contents__center");
          
          slideItems[slideIndex1].classList.remove("rightSlide", "contents__center");
          slideItems[slideIndex1].classList.add("contents__left");
        });
        break;
      
      case 3:
        slideIndex1 += 1;
        if(slideIndex1 > 2) {
          slideIndex1 = 0;
        }
    
        slideIndex2 += 1;
        if(slideIndex2 > 2) {
          slideIndex2 = 0;
        }
    
        slideIndex3 += 1;
        if (slideIndex3 > 2) {
          slideIndex3 = 0;
        }
    

        slideItems[slideIndex2].addEventListener("transitionend", function(){
          
          slideItems[slideIndex3].classList.remove("rightSlide", "contents__left");
          slideItems[slideIndex3].classList.add("contents__right");
          
          slideItems[slideIndex2].classList.remove("rightSlide", "contents__right");
          slideItems[slideIndex2].classList.add("contents__center");
          
          slideItems[slideIndex1].classList.remove("rightSlide", "contents__center");
          slideItems[slideIndex1].classList.add("contents__left");
        });
        break;

    }

    

  });
  
  for( let i = 0; i < indexBtn.length; i++ ) {
    indexBtn[i].addEventListener("click", function() {
      
      switch (indexLength) {
        console.log(i);
        case 5:
          // slideItems[slideIndex5].classList.remove("contents__leftOver");
          // slideItems[slideIndex1].classList.remove("contents__left");
          // slideItems[slideIndex2].classList.remove("contents__center");
          // slideItems[slideIndex3].classList.remove("contents__right");
          // slideItems[slideIndex4].classList.remove("contents__rightOver");
          
          // slideItems[i].classList.add("contents__center")
          // slideItems[i].classList.add("contents__center")
          
          break;
        
        default:
          // code
      }
    });
  }

}
