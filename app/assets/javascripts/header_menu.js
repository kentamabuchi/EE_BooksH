'use strict'; {
    
    const header = document.getElementById("scrollHeader");
    let path = location.pathname

    
    window.addEventListener('scroll', function() {
        const headerH = document.getElementById("header").clientHeight;
        const scroll = document.documentElement.scrollTop || document.body.scrollTop;
        if((headerH - 50) <= scroll && path.includes("admin")) {
            header.classList.remove("hiddenHeader");
        }else if((headerH + 100) <= scroll){
            header.classList.remove("hiddenHeader");
        } else {
            header.classList.add("hiddenHeader");
        }
    });
}

