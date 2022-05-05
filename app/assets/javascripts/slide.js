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
  
  let itemsLength = slideItems.length


  prevBtn.addEventListener("click", function() {
    
    console.log(slideIndex5);
    console.log(slideIndex1);
    console.log(slideIndex2);
    console.log(slideIndex3);
    console.log(slideIndex4);
    console.log("");
    console.log(slideItems.length);
    console.log("");
    
    slideItems[slideIndex1].classList.add("leftSlide");
    slideItems[slideIndex2].classList.add("leftSlide");
    slideItems[slideIndex3].classList.add("leftSlide");
    
    
    switch (itemsLength) {
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
        
        console.log(slideIndex5);
        console.log(slideIndex1);
        console.log(slideIndex2);
        console.log(slideIndex3);
        console.log(slideIndex4);
        console.log("");
        console.log(slideItems.length);
        console.log("");
        
        

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
        break;
    }
    

  });

  nextBtn.addEventListener("click", function() {

    slideItems[slideIndex3].classList.add("rightSlide");
    slideItems[slideIndex2].classList.add("rightSlide");
    slideItems[slideIndex1].classList.add("rightSlide");
    
    
    switch (itemsLength) {
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
  
  
  for( let i = 0; i < itemsLength; i++ ) {
    indexBtn[i].addEventListener("click", function() {

       slideIndex5 = i - 2;
       slideIndex1 = i - 1;
       slideIndex2 = i;
       slideIndex3 = i + 1;
       slideIndex4 = i + 2;
      
      let index5 = [].slice.call( slideItems ).indexOf(document.querySelector(".contents__leftOver"));
      let index1 = [].slice.call( slideItems ).indexOf(document.querySelector(".contents__left"));
      let index2 = [].slice.call( slideItems ).indexOf(document.querySelector(".contents__center"));
      let index3 = [].slice.call( slideItems ).indexOf(document.querySelector(".contents__right"));
      let index4 = [].slice.call( slideItems ).indexOf(document.querySelector(".contents__rightOver"));
      
      switch (itemsLength) {
        case 5:

          if (slideIndex5 === -1) {
            slideIndex5 = 4;
          }else if (slideIndex5 === -2) {
            slideIndex5 = 3;
          }  
          
          
          if (slideIndex1 < 0) {
            slideIndex1 = 4;
          }
          
          if (slideIndex3 > 4) {
            slideIndex3 = 0;
          }
          
          if (slideIndex4 === 5) {
            slideIndex4 = 0;
          }else if (slideIndex4 === 6) {
            slideIndex4 = 1;
          } 
          
          slideItems[index5].classList.remove("contents__leftOver");
          slideItems[index1].classList.remove("contents__left");
          slideItems[index2].classList.remove("contents__center");
          slideItems[index3].classList.remove("contents__right");
          slideItems[index4].classList.remove("contents__rightOver");
          slideItems[slideIndex5].classList.add("contents__leftOver");
          slideItems[slideIndex1].classList.add("contents__left");
          slideItems[slideIndex2].classList.add("contents__center");
          slideItems[slideIndex3].classList.add("contents__right");
          slideItems[slideIndex4].classList.add("contents__rightOver");

          break;
        case 4:
          
          if (slideIndex1 < 0) {
            slideIndex1 = 3;
          }
          
          if (slideIndex3 > 3) {
            slideIndex3 = 0;
          }
          
          if (slideIndex4 === 4) {
            slideIndex4 = 0;
          }else if (slideIndex4 === 5) {
            slideIndex4 = 1;
          }
          
          slideItems[index1].classList.remove("contents__left");
          slideItems[index2].classList.remove("contents__center");
          slideItems[index3].classList.remove("contents__right");
          slideItems[index4].classList.remove("contents__rightOver");
          slideItems[slideIndex1].classList.add("contents__left");
          slideItems[i].classList.add("contents__center");
          slideItems[slideIndex3].classList.add("contents__right");
          slideItems[slideIndex4].classList.add("contents__rightOver");
          
          break;
        case 3:
          
          if (slideIndex1 < 0) {
            slideIndex1 = 2;
          }
          
          if (slideIndex3 > 2) {
            slideIndex3 = 0;
          }

          slideItems[index1].classList.remove("contents__left");
          slideItems[index2].classList.remove("contents__center");
          slideItems[index3].classList.remove("contents__right");
          slideItems[slideIndex1].classList.add("contents__left");
          slideItems[i].classList.add("contents__center");
          slideItems[slideIndex3].classList.add("contents__right");

          break;
        
        default:
          // code
      }
    });
  }

}
