function info(num){
    const infoList = document.getElementById("main-info").children;
    for(var n=0; n<7; n++){
    infoList[n].style.display = "none";
    }
    switch (num) {
        case 0:
            document.getElementsByClassName("info-experience-1")[0].style.display="block"
            break;
        case 1:
            document.getElementsByClassName("info-experience-2")[0].style.display="block"
            break;
        case 2:
            document.getElementsByClassName("info-experience-3")[0].style.display="block"
            break;
        case 3:
            document.getElementsByClassName("info-experience-4")[0].style.display="block"
            break;
        case 4:
            document.getElementsByClassName("info-experience-5")[0].style.display="block"
            break;
        case 5:
            document.getElementsByClassName("info-experience-6")[0].style.display="block"
            break;
        case 6:
            document.getElementsByClassName("info-experience-7")[0].style.display="block"
            break;
        default:
            break;
    }
}

function infoMy(){
    const intro = document.getElementById("intro-my");
    const introArea = document.getElementById("input-intro");
    intro.style.display = "none";
    introArea.style.display = "block";
}

function infoCan(){
    const introArea = document.getElementById("input-intro");
    const intro = document.getElementById("intro-my");
    introArea.style.display = "none";
    intro.style.display = "block";
}

if(document.getElementById("intro-save")!=null){
    document.getElementById("intro-save").addEventListener("click", ()=>{
        if(document.getElementById("intro-text").value.length<100){
            const introArea = document.getElementById("input-intro");
            const intro = document.getElementById("intro-my");
            intro.innerText=document.getElementById("intro-text").value;
            introArea.style.display = "none";
            intro.style.display = "block";
        }else{
            alert("글자 수를 초과했습니다.")
        }
    })
}

if (document.getElementById("info-modal") != null) {
    document.getElementById("intro-text").addEventListener("input", () => {
        const strLength = document.getElementById("intro-text").value.length
        document.getElementById("texta").innerText = 100 - strLength + "자 남음";
        document.getElementById("texta").style.color = "black";

        if (100 - strLength < 0) {
            document.getElementById("texta").style.color = "red";
            document.getElementById("texta").innerText = 100 - strLength + "자 초과 ";
        }
    })
}

Array.from( document.getElementsByClassName("info-2-1")).forEach((target) => target.addEventListener("click", function(){ 
    jsSearch('test', target); 
})
);

function jsSearch(str, target){		
    
    const hobbyl = document.getElementById("what-hobby")
    document.getElementById("info-modal").style.display="block";
    document.getElementById("info-modali").style.display="block";

    hobbyl.innerText=(target.innerText).substring(4);
    hobbyl.style.fontSize="19px";
};    
if(document.getElementById("info-modal")!=null){
    document.getElementById("info-modal").addEventListener("click", () => {
    document.getElementById("info-modal").style.display="none";
    document.getElementById("info-modali").style.display="none";
    })
}
if (document.getElementById("info-cancel") != null) {
    document.getElementById("info-cancel").addEventListener("click", () => {
        document.getElementById("info-modal").style.display = "none";
        document.getElementById("info-modali").style.display = "none";
    })
}
if (document.getElementById("info-confirm") != null) {
    document.getElementById("info-confirm").addEventListener("click", () => {
        document.getElementById("info-modal").style.display = "none";
        document.getElementById("info-modali").style.display = "none";
    })
}

if(document.getElementById("hobby-checked") != null){
    document.getElementById("hobby-checked").addEventListener("click", () => {
        document.getElementById("add-hobby").removeAttribute('checked');
    })
}


    // 슬라이드
var slides = document.querySelector('.item1-3'); //전체 슬라이드 컨테이너
var slideImg = document.querySelectorAll('.who'); //모든 슬라이드들
var currentIdx = 0; //현재 슬라이드 index
var slideCount = slideImg.length; // 슬라이드 개수
var prev = document.querySelector('.prev'); //이전 버튼
var next = document.querySelector('.next'); //다음 버튼
var slideWidth = 202; //한개의 슬라이드 넓이
var slideMargin = 20; //슬라이드간의 margin 값

//전체 슬라이드 컨테이너 넓이 설정
// slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

function moveSlide(num) {
    let slideNum = 0;
    slideNum  = -num * 800;
    slides.style.left = slideNum+ 'px';
    currentIdx = num;
}
if(prev !=null){
    prev.addEventListener('click', function () {
    /*첫 번째 슬라이드로 표시 됐을때는 
    이전 버튼 눌러도 아무런 반응 없게 하기 위해 
      currentIdx !==0일때만 moveSlide 함수 불러옴 */
    if (currentIdx !== 0) moveSlide(currentIdx - 1);
    })
}

;
if (next != null) {
    next.addEventListener('click', function () {
        /* 마지막 슬라이드로 표시 됐을때는 
        다음 버튼 눌러도 아무런 반응 없게 하기 위해
        currentIdx !==slideCount - 1 일때만 
        moveSlide 함수 불러옴 */
        if (currentIdx !== slideCount - 1) {
            moveSlide(currentIdx + 1);
        }
    });
}
if (document.querySelector('.info-cancel') != null) {
    document.getElementById("info-cancel").addEventListener("click", () => {
        document.getElementById("info-modali").style.display = none;
    })
}


