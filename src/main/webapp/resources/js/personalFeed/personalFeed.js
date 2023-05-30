/* 개인피드 정보탭 모달관련 */
function info(num){
    const infoList = document.getElementById("main-info").children;
    for(var n=0; n<6; n++){
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

/* 내 소개 */
function infoMy(){
    const intro = document.getElementById("intro-my");
    const introArea = document.getElementById("input-intro");
    intro.style.display = "none";
    introArea.style.display = "block";
    document.getElementById("intro-text").innerText = document.getElementById("intro-my").innerText
}

/* 내 소개 취소 */
function infoCan(){
    const introArea = document.getElementById("input-intro");
    const intro = document.getElementById("intro-my");
    introArea.style.display = "none";
    intro.style.display = "block";
}

/* 내 소개 글자 수 제한 */
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

/* 내 소개 모달 내 글자 수 표시 */
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

var a = "asd";
var b = [];
/* 개인피드 내 정보 수정 */
Array.from( document.getElementsByClassName("info-2-1")).forEach((target) => target.addEventListener("click", function(){ 
    jsSearch(target); 
})
)
function jsSearch(target){		
    const infoText = document.getElementsByClassName("infoText");
    const hobbyl = document.getElementById("what-hobby")
    document.getElementById("info-modal").style.display="block";
    document.getElementById("info-modali").style.display="block";
    document.getElementById("whatHobby").innerText=(target.innerText).substring(4);
    document.getElementById("hobby-input").value = "";
    const infozz = document.getElementsByClassName("infom");
    
    
    a=target.dataset.map;
    for(var i = 0; i<infozz.length; i++){
        for(var j=0; j<infozz[i].childElementCount*2+1; j++){
            if(target.innerText==infozz[i].childNodes[j].innerText){
                b.push(infoText[i].childNodes[j]);
            }
        }
    }
    
};   
// document.getElementsByClassName("infom")[0].children[0]
/* 개인피드 정보  저장*/
if (document.getElementById("info-confirm") != null) {
    document.getElementById("info-confirm").addEventListener('click', () => {
        const i = document.getElementById("hobby-input").value;
        
        inputInfo(i)
        
    })
}


/* 전달된 정보를 스프링으로 전달 */
function inputInfo(i){
    const info = a+"§"+i;
    fetch("/inputInfo?info="+info)  // 지정된 주소로 GET방식 비동기 요청(ajax)
    // 전달하고자 하는 파라미터를 주소 뒤 쿼리스트링으로 추가
    
    .then(response => response.text()) // 요청에 대한 응답 객체(response)를 필요한 형태로 파싱
    
    .then(info => { console.log(info) }) // 첫 번째 then에서 파싱한 데이터를 이용한 동작 작성
    
    .catch (e => { console.log(e)}); // 예외 발생 시 처리할 내용을 작성
    b.forEach(element => {
        console.log(element);
        element.innerText = i;
    });
    b=[];
}





/* 정보 모달창 끄기 */
if(document.getElementById("info-modal")!=null){
    document.getElementById("info-modal").addEventListener("click", () => {
        document.getElementById("info-modal").style.display="none";
        document.getElementById("info-modali").style.display="none";
    })
}
/* 정보 모달창 끄기 */
if (document.getElementById("info-cancel") != null) {
    document.getElementById("info-cancel").addEventListener("click", () => {
        document.getElementById("info-modal").style.display = "none";
        document.getElementById("info-modali").style.display = "none";
    })
}
/* 정보 모달창 끄기 */
if (document.getElementById("info-confirm") != null) {
    document.getElementById("info-confirm").addEventListener("click", () => {
        document.getElementById("info-modal").style.display = "none";
        document.getElementById("info-modali").style.display = "none";
    })
}
/* 정보 모달창 끄기 */
if(document.getElementById("hobby-checked") != null){
    document.getElementById("hobby-checked").addEventListener("click", () => {
        checkForm()
        document.getElementById("add-hobby").removeAttribute('checked');
    })
}
/* 정보 모달창 끄기 */
if(document.getElementById("hobby-no") != null){
    document.getElementById("hobby-no").addEventListener("click", () => {
        document.getElementById("add-hobby").removeAttribute('checked');
    })
}
/* 취미 수정 */
function checkForm() {
    var hobbyArray = new Array();
    document.getElementsByName("hobbychecked").forEach(element => {
        if (element.checked) {
            hobbyArray.push(element.id);
        }
    });
    fetch("/inputhobby?hobbyArray="+hobbyArray)  // 지정된 주소로 GET방식 비동기 요청(ajax)
    // 전달하고자 하는 파라미터를 주소 뒤 쿼리스트링으로 추가
    
    .then(response => response.text()) // 요청에 대한 응답 객체(response)를 필요한 형태로 파싱
    
    .then(() => { 
        const l = hobbyArray.length;
        
        if(l==0){
            document.getElementById("zzs").style.display = "none";
            if (document.getElementById("myhho")!=null) {
                document.getElementById("myhho").innerText ="";
            }
        }else{
            document.getElementById("zzs").style.display = "block";
            document.getElementById("myhho").innerText ="";
            for(var i =0; i<l; i++){
                document.getElementById("myhho").innerText += hobbyArray.shift();
                document.getElementById("myhho").innerHTML += "　";
            }
        }

    }) // 첫 번째 then에서 파싱한 데이터를 이용한 동작 작성
    
    .catch (e => { console.log(e)}); // 예외 발생 시 처리할 내용을 작성
    
    //other code
}



    // 슬라이드
var slides = document.querySelector('.item1-3'); //전체 슬라이드 컨테이너
var slideImg = document.querySelectorAll('.who'); //모든 슬라이드들
var currentIdx = 0; //현재 슬라이드 index
var slideCount = slideImg.length; // 슬라이드 개수
var prev = document.querySelector('.prev'); //이전 버튼
var next = document.querySelector('.next'); //다음 버튼
var slideWidth = 222; //한개의 슬라이드 넓이
var slideMargin = 20; //슬라이드간의 margin 값

//전체 슬라이드 컨테이너 넓이 설정
// slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

function moveSlide(num) {
    
    let slideNum = 0;
    slideNum  = -num * 235;
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
        console.log(currentIdx)
        console.log(slideCount)
        /* 마지막 슬라이드로 표시 됐을때는 
        다음 버튼 눌러도 아무런 반응 없게 하기 위해
        currentIdx !==slideCount - 1 일때만 
        moveSlide 함수 불러옴 */
        if (currentIdx+5 < slideCount) {
            moveSlide(currentIdx + 1);
        }
    });
}
/* 모달창 끄기 */
if (document.querySelector('.info-cancel') != null) {
    document.getElementById("info-cancel").addEventListener("click", () => {
        document.getElementById("info-modali").style.display = none;
    })
}

/* 취미 선택 표시 */
if (document.getElementById("hobby-no") != null) {
    document.getElementById("hobby-no").addEventListener("click", () => {
        const mh = document.getElementById("myhho").innerText.trim().split('　');
        const dhho = document.getElementById("dhho").innerText.trim().split('　');
        

        for(var j=0; j<dhho.length; j++){
            document.getElementById(dhho[j]).checked = false;
        }
        for(var i =0; i<mh.length; i++){
            document.getElementById(mh[i]).checked = true;

        }
    })
}
/* 취미 선택 */
Array.from( document.getElementsByClassName("add-friend2")).forEach((target) => target.addEventListener("click", function(){ 
    friendPlus(target); 
})
)
/* 취미 스프링으로 전달 */
function friendPlus(target) {
    const personalAddFriend = new Array(target.dataset.seno, target.dataset.reno);
    console.log(personalAddFriend)
    fetch("/personalAddFriend?personalAddFriend="+personalAddFriend)  
    .then(response => response.text()) 
    .then(() => {
    }) 
    .catch (e => { console.log(e)}); 

    target.parentNode.parentNode.parentNode.remove()
    slideCount -=1
}

// 게시글 제출 ajax
function submitReply(boardNo, parentReplyNo, btn) {

    if( btn != null && !btn.classList.contains('enable') ) return;

    const textarea = document.querySelector('.reply-textarea[no="' + boardNo + '"]');
    const replyContent = convertMention(textarea.value); // 멘션 문자열에 HTML 처리

    const data = {
        "boardNo" : boardNo,
        "replyContent" : replyContent,
        "parentReplyNo" : parentReplyNo
    };

    fetch("/reply/submit", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(resp => resp.text())
    .then(result => {
        if(result > 0) {
            printReplyList(boardNo);
            sendReplyAlram(boardNo); // 알림 발송
            textarea.value = "";
        } else {
            alert('댓글 작성 실패');
        }
    })
    .catch(e => console.log(e));
}


// 더보기 옵션

// function detectBottom() {
//     var scrollTop = $(window).scrollTop();
//     var innerHeight = $(window).innerHeight();
//     var scrollHeight = $('body').prop('scrollHeight');
//     if (scrollTop + innerHeight >= scrollHeight) {
//         console.log("asd")
//         return true;
//     } else {
//         console.log("dsa")
//         return false;
//     }
// }
// Array.from( document.getElementsByClassName("nndr-top")).forEach((target) => target.addEventListener("click", function(){ 
//     jsSearch(target); 
// })
// )
// function jsSearch(target){		
//     const infoText = document.getElementsByClassName("infoText");
//     const hobbyl = document.getElementById("what-hobby")
//     document.getElementById("info-modal").style.display="block";
//     document.getElementById("info-modali").style.display="block";
//     document.getElementById("whatHobby").innerText=(target.innerText).substring(4);
//     document.getElementById("hobby-input").value = "";
//     const infozz = document.getElementsByClassName("infom");
    
    
//     a=target.dataset.map;
//     for(var i = 0; i<infozz.length; i++){
//         for(var j=0; j<infozz[i].childElementCount*2+1; j++){
//             if(target.innerText==infozz[i].childNodes[j].innerText){
//                 b.push(infoText[i].childNodes[j]);
//             }
//         }
//     }
    
// };   