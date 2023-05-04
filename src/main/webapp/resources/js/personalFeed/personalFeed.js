const strLength = document.getElementById("intro-text");
const texta = document.getElementById("texta");


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

const infoInput = document.getElementById("info-input");
const intro = document.getElementById("intro-my");
const introArea = document.getElementById("input-intro");
function infoMy(){
    intro.style.display = "none";
    introArea.style.display = "block";
}

function infoCan(){
    introArea.style.display = "none";
    intro.style.display = "block";
}

document.getElementById("intro-save").addEventListener("click", ()=>{
    if(strLength.value.length<100){
        intro.innerText=document.getElementById("intro-text").value;
        introArea.style.display = "none";
        intro.style.display = "block";
    }else{
        alert("글자 수를 초과했습니다.")
    }
})

document.getElementById("intro-text").addEventListener("input", ()=>{
    const strLength = document.getElementById("intro-text").value.length
    texta.innerText = 100 - strLength + "자 남음";
    texta.style.color = "black";

    if(100-strLength <0 ){
        texta.style.color = "red";
        texta.innerText = 100 - strLength + "자 초과 ";
    }
})


const infom = document.getElementsByClassName("info-2-1");
const hobbyl = document.getElementById("what-hobby")
Array.from(infom).forEach((target) => target.addEventListener("click", function(){ 
			jsSearch('test', target); 
		})
	);

function jsSearch(str, target){		
    
    document.getElementById("info-modal").style.display="block";
    document.getElementById("info-modali").style.display="block";

    hobbyl.innerText=(target.innerText).substring(4);
    hobbyl.style.fontSize="19px";


    // alert((target.innerText).substring(4));
};    

// document.getElementById("info-modal").addEventListener("click", () => {
//     document.getElementById("info-modal").style.display="none";
//     document.getElementById("info-modali").style.display="none";
// })
// document.getElementById("info-cancel").addEventListener("click", () => {
//     document.getElementById("info-modal").style.display="none";
//     document.getElementById("info-modali").style.display="none";
// })
// document.getElementById("info-confirm").addEventListener("click", () => {
//     document.getElementById("info-modal").style.display="none";
//     document.getElementById("info-modali").style.display="none";
// })


// function info(){
    //     document.getElementById("info-job").innerText = "red";
// }
// const imset = document.getElementById("imgset")
// document.getElementById("imBtn").addEventListener("click" () => {
    
    

    document.getElementById("hobby-checked").addEventListener("click", () => {
        document.getElementById("add-hobby").removeAttribute('checked');
    })


    // 슬라이드
const slides = document.querySelector('.item1-3'); //전체 슬라이드 컨테이너
const slideImg = document.querySelectorAll('.who'); //모든 슬라이드들
let currentIdx = 0; //현재 슬라이드 index
const slideCount = slideImg.length; // 슬라이드 개수
const prev = document.querySelector('.prev'); //이전 버튼
const next = document.querySelector('.next'); //다음 버튼
const slideWidth = 202; //한개의 슬라이드 넓이
const slideMargin = 20; //슬라이드간의 margin 값

//전체 슬라이드 컨테이너 넓이 설정
// slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

function moveSlide(num) {
    let slideNum = 0;
    slideNum  = -num * 800;
    slides.style.left = slideNum+ 'px';
    currentIdx = num;
}

prev.addEventListener('click', function () {
  /*첫 번째 슬라이드로 표시 됐을때는 
  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
  currentIdx !==0일때만 moveSlide 함수 불러옴 */

  if (currentIdx !== 0) moveSlide(currentIdx - 1);
})

;

next.addEventListener('click', function () {
    /* 마지막 슬라이드로 표시 됐을때는 
    다음 버튼 눌러도 아무런 반응 없게 하기 위해
    currentIdx !==slideCount - 1 일때만 
    moveSlide 함수 불러옴 */
    if (currentIdx !== slideCount - 1) {
        moveSlide(currentIdx + 1);
    }
});

document.getElementById("info-cancel").addEventListener("click", () => {
    document.getElementById("info-modali").style.display = none;


})


























/*next.addEventListener("click", () => {
    // 요소 만들기 document.createElement("태그명")
    // 요소에 속성, 값 추가 : 요소.classList.add("속성명", "값");
    // 요소에 속성, 값 추가 : 요소.classList.remove("속성명", "값");
    // 요소에 속성, 값 추가 : 요소.setAttrubute("속성명", "값");
    // 요소에 속성 제거 : 요소.removeAttrubute("속성명");


    // 부모 요소.append(자식 요소) :
    // 부모 요소의 마지막 자식으로 자식 요소를 추가(덧붙이기)
    
    // 부모 요소.prepend(자식 요소) :
    // 부모 요소의 첫 번째 자식으로 자식 요소를 추가

    // A.after(B) : A의 다음 요소로 B를 추가
    
    // A.before(B) : A의 이전 요소로 B를 추가
    
    // div 요소 만들기
    const div = document.createElement("div");
    div.classList.add("row");
    // input 요소 만들기
    const input = document.createElement("input")
    input.classList.add("in")
    input.setAttribute("type", "number"); // input에 속성 부여

    //span 요소 만들기
    const span = document.createElement("span");
    span.classList.add("remove-row");
    span.innerHTML="&times;";
    // 만들어진 span 요소에 이벤트리스너 추가
    span.addEventListener("click", e => {
        // 클릭된 요소의 부모 요소를 삭제 == row 삭제
        e.target.parentElement.remove();
    });

    //--------------------------------------------------------
    //div의 자식으로 input 추가
    // div.append(input);
    div.prepend(input);

    //div의 마지막 자식으로 span 추가
    div.append(span);

    // ----------------------------------------------------

    // .container의 마지막 자식으로 div 추가
    document.querySelector(".container").append(div)


});*/
