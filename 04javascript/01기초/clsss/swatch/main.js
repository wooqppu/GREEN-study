// 브라우저 높이 
let winh = window.innerHeight;
const lis = document.querySelectorAll("#menu li");
const sections = document.querySelectorAll("section");

// 유사배열 nodelist
// lis [li, li, li, li]   lis[0], lis[1], lis[2], lis[3]

// lis[0].addEventListener("click", function() {}) --> 0~3번까지 계속 반복 : forEach 사용

lis[0].classList.add("on");
lis[1].classList.add("on");
lis[2].classList.add("on");
lis[3].classList.add("on");



// li를 클릭하면 스크롤 위치를 해당 섹션이 나타나도록 함
lis.forEach((li, index) => {
    li.addEventListener("click", function(e) {
        // 기존 이벤트 제거 
        e.preventDefault();
        console.log("여기여기" + index * winh);
        // 스크롤 위치 이동
        window.scrollTo({top: index * winh, behavior: "smooth"})

    })
})

// 스크롤 이벤트 
window.addEventListener("scroll", function() {
    // 스크롤 값
    let sct = Math.ceil(this.document.documentElement.scrollTop)+1;
    console.log(sct);

    /* 
    if(sct>=0 && sct<1000) {
         lis[0].classList.add("on");
     }

     if(sct>=1000 && sct<2000) {
         lis[1].classList.add("on");
     }

     if(sct>=2000 && sct<3000) {
         lis[2].classList.add("on");
     }

     if(sct>=3000 && sct<4000) {
         lis[3].classList.add("on");
     } 
    */

    for(let i=0; i<lis.length; i++) {
        if(sct>=i*winh && sct < (i+1)*winh) {
            lis.forEach(li => li.classList.remove("on"))
            lis[i].classList.add("on");
        }
    }
})

sections[0].addEventListener("mousemove", function(e) {
    // 마우스 위치 
    let x = e.pageX;
    let y = e.pageY;

    console.log(x);
    console.log(y);

    document.querySelector(".img11").style.right = 20+(x/30)+"px";
    document.querySelector(".img12").style.right = 20-(x/30)+"px";
    document.querySelector(".img13").style.right = 20-(x/30)+"px";

})

sections[1].addEventListener("mousemove", function(e) {
    // 마우스 위치 
    let x = e.pageX;
    let y = e.pageY;

    console.log(x);
    console.log(y);

    document.querySelector(".img21").style.right = 20+(x/30)+"px";
    document.querySelector(".img22").style.right = 20-(x/30)+"px";

})

sections[2].addEventListener("mousemove", function(e) {
    // 마우스 위치 
    let x = e.pageX;
    let y = e.pageY;

    console.log(x);
    console.log(y);

    document.querySelector(".img31").style.right = 20+(x/30)+"px";
    document.querySelector(".img32").style.right = 20-(x/30)+"px";
    document.querySelector(".img33").style.right = 20-(x/30)+"px";

})

sections[3].addEventListener("mousemove", function(e) {
    // 마우스 위치 
    let x = e.pageX;
    let y = e.pageY;

    console.log(x);
    console.log(y);

    document.querySelector(".img41").style.right = 20+(x/30)+"px";
    document.querySelector(".img42").style.right = 20-(x/30)+"px";

})
