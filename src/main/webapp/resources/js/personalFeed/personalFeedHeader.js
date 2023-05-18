if (document.getElementById("perAddFriend") != null) {
    const perAddFriend = document.getElementById("perAddFriend");
    perAddFriend.addEventListener("click", e => {
        
        if(perAddFriend.classList.contains('friendAdd')){
            const personalCanFriend = new Array(perAddFriend.dataset.seno, perAddFriend.dataset.reno);
            fetch("/personalCanFriend?personalCanFriend="+personalCanFriend)  
            .then(response => response.text()) 
            .then(() => {
            }) 
            .catch (e => { console.log(e)}); 
            perAddFriend.innerText ="친구 추가";
            perAddFriend.classList.remove('friendAdd');
            return;
        }
        const personalAddFriend = new Array(perAddFriend.dataset.seno, perAddFriend.dataset.reno);
        fetch("/personalAddFriend?personalAddFriend="+personalAddFriend)  
        .then(response => response.text()) 
        .then(() => {
        }) 
        .catch (e => { console.log(e)}); 
        perAddFriend.innerText ="친구 신청 중";
        perAddFriend.classList.add('friendAdd')
        return;
        
    })
}
if (document.getElementById("profileChg") != null) {
    document.getElementById("profileChg").addEventListener('click', () => {
        document.getElementById("profile-modal").style.display="block";
        document.getElementById("profile-modali").style.display="block";
    })
}

if (document.getElementById("notP") != null) {
    document.getElementById("notP").addEventListener('click', () => {
        alert("너 주인 아니잖아");
    })
}

// if (document.getElementById("notB") != null) {
//     document.getElementById("notB").addEventListener('click', () => {
//         alert("너 주인 아니잖아");
//     })
// }

if (document.getElementById("profile-modal") != null) {
    document.getElementById("profile-modal").addEventListener("click", () => {
        document.getElementById("profile-modal").style.display="none";
        document.getElementById("profile-modali").style.display="none";
    })
}
if (document.getElementById("profile-cancel") != null) {
    document.getElementById("profile-cancel").addEventListener("click", () => {
        document.getElementById("profile-modal").style.display="none";
        document.getElementById("profile-modali").style.display="none";
    })
}
if (document.getElementById("profile-confirm") != null) {
    document.getElementById("profile-confirm").addEventListener("click", () => {
        document.getElementById("profile-modal").style.display="none";
        document.getElementById("profile-modali").style.display="none";
    })
}


   // 슬라이드
   var pslides = document.getElementById('profile-asd'); //전체 슬라이드 컨테이너
   var pslideImg = document.getElementsByClassName('profi'); //모든 슬라이드들
   var pcurrentIdx = 0; //현재 슬라이드 index
   var pslideCount = pslideImg.length; // 슬라이드 개수
   var pprev = document.querySelector('.pofileprev'); //이전 버튼
   var pnext = document.querySelector('.pofilenext'); //다음 버튼
   var pslideWidth = 202; //한개의 슬라이드 넓이
   var pslideMargin = 20; //슬라이드간의 margin 값

   //전체 슬라이드 컨테이너 넓이 설정
   // slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

function pmoveSlide(pnum) {
    console.log(pcurrentIdx)
    console.log(pslideCount)
    console.log(pnum)
    let pslideNum = 0;
     pslideNum  = -pnum * 285;
    pslides.style.left = pslideNum+ 'px';
    pcurrentIdx = pnum;
}
if(pprev !=null){
    pprev.addEventListener('click', function () {
    /*첫 번째 슬라이드로 표시 됐을때는 
    이전 버튼 눌러도 아무런 반응 없게 하기 위해 
    currentIdx !==0일때만 moveSlide 함수 불러옴 */
    if (pcurrentIdx > 0) {
        pmoveSlide(pcurrentIdx - 1)
    }
    })
}

;
if (pnext != null) {
    pnext.addEventListener('click', function () {
        /* 마지막 슬라이드로 표시 됐을때는 
        다음 버튼 눌러도 아무런 반응 없게 하기 위해
        currentIdx !==slideCount - 1 일때만 
        moveSlide 함수 불러옴 */
        if (pcurrentIdx < pslideCount-2) {
            pmoveSlide(pcurrentIdx + 1);
        }
    });
}