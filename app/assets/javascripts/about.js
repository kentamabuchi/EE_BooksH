'use strict'; {

  const slideItems = document.querySelectorAll('.about__topic__listItem');

  const slide = function( entries, observer ) {
    let num = 1;

    for (let i = 0; i < entries.length; i++) {

      if(!entries[i].isIntersecting) {
        return;
      }

      console.log(entries[i]);

      if( entries[i].target.classList.contains('animation__slideLeft')) {

        entries[i].target.classList.add(`animationSlideLeft${num}`);
        observer.unobserve(entries[i].target);
      } else {
        entries[i].target.classList.add(`animationSlideRight${num}`);
        observer.unobserve(entries[i].target);
      }

      num++
      if(num > 3) {
        num = 1;
      }
    }

  };


  const optionsSlide = {
    threshold: 1
  };

  const optionsPopUp = {
    threshold: 3
  };

  const obsSlide = new IntersectionObserver(slide, optionsSlide);
    slideItems.forEach(item => {
    obsSlide.observe(item);
  });

}

