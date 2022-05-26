'use strict'; {
    
    const header = document.getElementById("scrollHeader");
    
    window.addEventListener('scroll', function() {
        const headerH = document.getElementById("header").clientHeight;
        const scroll = document.documentElement.scrollTop || document.body.scrollTop;
        if((headerH + 100) <= scroll) {
            header.classList.remove("hiddenHeader");
        } else {
            header.classList.add("hiddenHeader");
        }
    });
}

