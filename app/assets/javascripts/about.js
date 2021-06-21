
    const slideRightItems = document.querySelectorAll('.obs__slideRight');
    const slideLeftItems = document.querySelectorAll('.obs__slideLeft');
    const popupItems = document.querySelectorAll('.obs__popup');

    let r = 1;
    const slideRight = function (entries, observer) {
        console.log(entries);
        for(let i = 0; i < entries.length; i++) {
            
            console.log(i);
            
            if(!entries[i].isIntersecting) {
                return;
            }
            
            entries[i].target.classList.add(`appearR${r}`);
            observer.unobserve(entries[i].target);
            
            r++;
            if(r >3){
                r = 1;
            }
            
        }

    };
    
    
    let l = 3;
    const slideLeft = function (entries, observer) {
        console.log(entries);
        for(let i = 0; i < entries.length; i++) {
            
            console.log(i);
            
            if(!entries[i].isIntersecting) {
                return;
            }
            
            entries[i].target.classList.add(`appearL${l}`);
            observer.unobserve(entries[i].target);
            
            l--;
            if(l < 1){
                l = 3;
            }
            
        }

    };
    
    
    const popup = function (entries, observer) {
        console.log(entries);
        for(let i = 0; i < entries.length; i++) {
            
            console.log(i);
            
            if(!entries[i].isIntersecting) {
                return;
            }
            
            entries[i].target.classList.add(`popup`);
            observer.unobserve(entries[i].target);
            
            
        }

    };
    
    const optionsSlide = {
        threshold: 1
    };
    const optionsPopup = {
        threshold: .3
    };
    
    const observerSlideRight = new IntersectionObserver(slideRight, optionsSlide);
   
    slideRightItems.forEach(item => {
       observerSlideRight.observe(item);
       
    });
    
    const observerSlideLeft = new IntersectionObserver(slideLeft, optionsSlide);
   
    slideLeftItems.forEach(item => {
       observerSlideLeft.observe(item);
    });
    
    const observerPopup = new IntersectionObserver(popup, optionsPopup);
   
    popupItems.forEach(item => {
       observerPopup.observe(item);
    });



