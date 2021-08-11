'use strict'; {
  const prevBtn = document.getElementById("prevBtn");
  const nextBtn = document.getElementById("nextBtn");
  let slideItems = document.querySelectorAll(".slideItem");

  let contentsLeftOver = document.querySelector(".contents__leftOver");
  let contentsLeft = document.querySelector(".contents__left");
  let contentsCenter = document.querySelector(".contents__center");
  let contentsRight = document.querySelector(".contents__right");
  let contentsRightOver = document.querySelector(".contents__rightOver");

  let leftOverIndex = [].slice.call( slideItems ).indexOf(contentsLeftOver);
  let leftIndex = [].slice.call( slideItems ).indexOf(contentsLeft);
  let centerIndex = [].slice.call( slideItems ).indexOf(contentsCenter);
  let rightIndex = [].slice.call( slideItems ).indexOf(contentsRight);
  let rightOverIndex = [].slice.call( slideItems ).indexOf(contentsRightOver);


  prevBtn.addEventListener("click", function() {


    // let centerPosition = slideItems[centerIndex].getBoundingClientRect();
    // let centerPositionX = window.pageXOffset + centerPosition.left;
    // console.log(centerPositionX);

    // let rightPosition = slideItems[rightIndex].getBoundingClientRect();
    // let rightPositionX = window.pageXOffset + rightPosition.left;
    // console.log(rightPositionX);

    slideItems[leftOverIndex].classList.add("leftSlide");
    slideItems[leftIndex].classList.add("leftSlide");
    slideItems[centerIndex].classList.add("leftSlide");
    slideItems[rightIndex].classList.add("leftSlide");

    leftOverIndex -= 1;
    if(leftOverIndex < 0) {
      leftOverIndex = 4;
    }

    leftIndex -= 1;
    if(leftIndex < 0) {
      leftIndex = 4;
    }

    centerIndex -= 1;
    if(centerIndex < 0) {
      centerIndex = 4;
    }

    rightIndex -= 1;
    if (rightIndex < 0) {
      rightIndex = 4;
    }

    rightOverIndex -= 1;
    if (rightOverIndex < 0) {
      rightOverIndex = 4;
    }

    slideItems[centerIndex].addEventListener("transitionrun", function(){
      slideItems[centerIndex].classList.remove("display");
      slideItems[centerIndex].classList.add("display--center");
      slideItems[rightIndex].classList.remove("display--center");
      slideItems[rightOverIndex].classList.remove("display");
      slideItems[rightIndex].classList.add("display");
      slideItems[leftIndex].classList.add("display");
    });

    slideItems[rightOverIndex].addEventListener("transitionend", function(){
      slideItems[rightOverIndex].classList.remove("leftSlide");
      slideItems[rightOverIndex].classList.remove("contents__right");
      slideItems[rightOverIndex].classList.add("contents__rightOver");
    });

    slideItems[leftIndex].addEventListener("transitionend", function(){
      slideItems[leftIndex].classList.remove("leftSlide");
      slideItems[leftIndex].classList.remove("contents__leftOver");
      slideItems[leftIndex].classList.add("contents__left");
      slideItems[leftOverIndex].classList.remove("contents__rightOver");
      slideItems[leftOverIndex].classList.add("contents__leftOver");
    });

    slideItems[centerIndex].addEventListener("transitionend", function(){
      slideItems[centerIndex].classList.remove("leftSlide");
      slideItems[centerIndex].classList.remove("contents__left");
      slideItems[centerIndex].classList.add("contents__center");
    });

    slideItems[rightIndex].addEventListener("transitionend", function(){
      slideItems[rightIndex].classList.remove("leftSlide");
      slideItems[rightIndex].classList.remove("contents__center");
      slideItems[rightIndex].classList.add("contents__right");
    });




  });

  nextBtn.addEventListener("click", function() {

    slideItems[rightOverIndex].classList.add("rightSlide");
    slideItems[rightIndex].classList.add("rightSlide");
    slideItems[centerIndex].classList.add("rightSlide");
    slideItems[leftIndex].classList.add("rightSlide");

    leftOverIndex += 1;
    if(leftOverIndex > 4) {
      leftOverIndex = 0;
    }

    leftIndex += 1;
    if(leftIndex > 4) {
      leftIndex = 0;
    }

    centerIndex += 1;
    if(centerIndex > 4) {
      centerIndex = 0;
    }

    rightIndex += 1;
    if (rightIndex > 4) {
      rightIndex = 0;
    }

    rightOverIndex += 1;
    if (rightOverIndex > 4) {
      rightOverIndex = 0;
    }

    slideItems[centerIndex].addEventListener("transitionrun", function(){
      slideItems[rightIndex].classList.add("display");
      slideItems[centerIndex].classList.remove("display");
      slideItems[centerIndex].classList.add("display--center");
      slideItems[leftIndex].classList.remove("display--center");
      slideItems[leftIndex].classList.add("display");
      slideItems[leftOverIndex].classList.remove("display");
    });

    slideItems[rightIndex].addEventListener("transitionend", function(){
      slideItems[rightIndex].classList.remove("rightSlide");
      slideItems[rightIndex].classList.remove("contents__rightOver");
      slideItems[rightIndex].classList.add("contents__right");
      slideItems[rightOverIndex].classList.remove("contents__leftOver");
      slideItems[rightOverIndex].classList.add("contents__rightOver");
    });

    slideItems[centerIndex].addEventListener("transitionend", function(){
      slideItems[centerIndex].classList.remove("rightSlide");
      slideItems[centerIndex].classList.remove("contents__right");
      slideItems[centerIndex].classList.add("contents__center");
    });

    slideItems[leftIndex].addEventListener("transitionend", function(){
      slideItems[leftIndex].classList.remove("rightSlide");
      slideItems[leftIndex].classList.remove("contents__center");
      slideItems[leftIndex].classList.add("contents__left");
    });

    slideItems[leftOverIndex].addEventListener("transitionend", function(){
      slideItems[leftOverIndex].classList.remove("rightSlide");
      slideItems[leftOverIndex].classList.remove("contents__left");
      slideItems[leftOverIndex].classList.add("contents__leftOver");
    });

  });

}
