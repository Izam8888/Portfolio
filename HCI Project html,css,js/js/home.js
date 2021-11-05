const slideImage = document.querySelectorAll(".slide-image");
const slideContainer = document.querySelector(".slides-container");
const nextBtn = document.querySelector(".next-btn");
const prevBtn = document.querySelector(".prev-btn");
const navigationDots = document.querySelector(".navigation-dots")

let numberOfImages = slideImage.length;
let slideWidth = slideImage[0].clientWidth;
let currentSlide = 0;

function init(){
     slideImage.forEach((img, i) => {
         img.style.left = i * 100 + "%";
     });

     slideImage[0].classList.add("active");

     setInterval(function() {
        if(currentSlide >= numberOfImages - 1){
            goToSlide(0);
            
            return;
        }
        currentSlide++;
        goToSlide(currentSlide);

     }, 5000);

     createNavigationDots();
}

init();

function createNavigationDots(){
    for(let i = 0; i < numberOfImages; i++){
        const dot = document.createElement("div");
        dot.classList.add("single-dot");
        navigationDots.appendChild(dot);

        dot.addEventListener("click", () => {
            goToSlide(i);
        });
    }

    navigationDots.children[0].classList.add("active");
}


// next btn
nextBtn.addEventListener("click", () => {
    if(currentSlide >= numberOfImages - 1){
        goToSlide(0);
        
        return;
    }
    currentSlide++;
    goToSlide(currentSlide);
});

// prev btn
prevBtn.addEventListener("click", () => {
    if(currentSlide <= 0){
        goToSlide(numberOfImages - 1);
        return;
    }
    currentSlide--;
    goToSlide(currentSlide);
});

function goToSlide(slideNumber){
    slideContainer.style.transform = "translateX(-" + slideWidth * slideNumber + "px)";

    currentSlide = slideNumber;

    setActiveClass();
}

function setActiveClass(){
    let currentActive = document.querySelector(".slide-image.active");
    currentActive.classList.remove("active");
    slideImage[currentSlide].classList.add("active");

    // set active class for nav dots
    let currentDot = document.querySelector(".single-dot.active");
    currentDot.classList.remove("active");
    navigationDots.children[currentSlide].classList.add("active");
}

window.onresize = function (){
    slideWidth = slideImage[0].clientWidth;
    slideContainer.style.transform = `translateX(-${slideWidth * currentSlide}px)`;
    console.log(slideWidth);
}

