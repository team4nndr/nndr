
// 친구신청 버튼 변경 
const sendFriendReq = () => {
    const senderMemberNo = document.getElementById("memberInfo").dataset.sender;
    const senderProfile = document.getElementById("memberInfo").dataset.profile;
    const senderName = document.getElementById("memberInfo").dataset.sendername;
    const memberNo = document.getElementById("memberInfo").dataset.reciver;
    const content = document.getElementById("perAddFriend").innerText;
    console.log(content)
    var req = {
        "memberNo": memberNo,
        "content" : content,
        "type" : "PASS"
    }
    
    alarmSock.send(JSON.stringify(req));
}

// 친구신청 알람 발송
function sendFriendAlarm(memberNo) {
    
    var obj = {
        "profileImage": profileImage,
        "link": "/personalFeed/" + loginMemberNo,
        "message" : loginMemberName+"님이 친구 신청을 하셨습니다."
    }
    
	var alarm = {
		"memberNo": memberNo,
        "alarmContent" : makeAlarm(obj),
        "type" : "FRIEND_REQ"
    }

	// JSON.stringify() : 자바스크립트 객체를 JSON 문자열로 변환
    console.log(alarm);
	alarmSock.send(JSON.stringify(alarm));
}

// 친구 됨 알람 발송
function sendFriendAcceptAlarm(memberNo) {
    var obj = {
        "profileImage": profileImage,
        "link": "/personalFeed/" + loginMemberNo,
        "message" : senderName+"님과 친구가 되었습니다."
    }

	var alarm = {
		"memberNo": memberNo,
        "alarmContent" : makeAlarm(obj),
        "type" : "FRIEND_ACCEPT"
    }

	// JSON.stringify() : 자바스크립트 객체를 JSON 문자열로 변환
    // console.log(alarm);
	alarmSock.send(JSON.stringify(alarm));
}


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
			perAddFriend.classList.remove('friendAccept')
			perAddFriend.classList.remove('friendDel');
            perAddFriend.classList.add('noFriend')
            return;
        }
        if(perAddFriend.classList.contains('friendDel')){
            const personalDelFriend = new Array(perAddFriend.dataset.seno, perAddFriend.dataset.reno);
            fetch("/personalDelFriend?personalDelFriend="+personalDelFriend)  
            .then(response => response.text()) 
            .then(() => {
            }) 
            .catch (e => { console.log(e)}); 
            perAddFriend.innerText ="친구 추가";
            perAddFriend.classList.remove('friendDel');
			perAddFriend.classList.remove('friendAdd')
			perAddFriend.classList.remove('friendAccept');
            perAddFriend.classList.add('noFriend')
            return;
        }
        if(perAddFriend.classList.contains('friendAccept')){ //수락
            const personalAcceptFriend = new Array(perAddFriend.dataset.seno, perAddFriend.dataset.reno);
            fetch("/personalAcceptFriend?personalAcceptFriend="+personalAcceptFriend)  
            .then(response => response.text()) 
            .then(() => {
            }) 
            .catch (e => { console.log(e)}); 
            perAddFriend.innerText ="친구 끊기";
            perAddFriend.classList.remove('friendAdd');
			perAddFriend.classList.remove('noFriend')
			perAddFriend.classList.remove('friendAccept');
            perAddFriend.classList.add('friendDel');

            // 친구신청 알람 발송
            const memberNo = document.getElementById("perAddFriend").dataset.reno;
            sendFriendAcceptAlarm(memberNo);
            return;
        }
        if(perAddFriend.classList.contains('noFriend')){ 
            const personalAddFriend = new Array(perAddFriend.dataset.seno, perAddFriend.dataset.reno);
            fetch("/personalAddFriend?personalAddFriend="+personalAddFriend)  
            .then(response => response.text()) 
            .then(() => {
            }) 
            .catch (e => { console.log(e)}); 
            perAddFriend.innerText ="신청 취소";
            perAddFriend.classList.remove('noFriend');
            perAddFriend.classList.add('friendAdd')

             // 친구신청 알람 발송
            const memberNo = document.getElementById("perAddFriend").dataset.reno;
            sendFriendAlarm(memberNo);
            return;
        }
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
        document.getElementById("profile-asd").style.left = "0";
        pcurrentIdx=0;
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
        if (pcurrentIdx < pslideCount-3) {
            pmoveSlide(pcurrentIdx + 1);
        }
    });
}


   // 슬라이드

if (document.getElementById("choback") != null) {
    document.getElementById("choback").addEventListener('click', () => {
        document.getElementById("back-modal").style.display="block";
        document.getElementById("back-modali").style.display="block";
    })
}

if (document.getElementById("back-modal") != null) {
    document.getElementById("back-modal").addEventListener("click", () => {
        document.getElementById("back-modal").style.display="none";
        document.getElementById("back-modali").style.display="none";
        document.getElementById("profile-asd").style.left = "0";
        bcurrentIdx=0;
})
}
   var bslides = document.getElementById('back-asd'); //전체 슬라이드 컨테이너
   var bslideImg = document.getElementsByClassName('backi'); //모든 슬라이드들
   var bcurrentIdx = 0; //현재 슬라이드 index
   var bslideCount = bslideImg.length; // 슬라이드 개수
   var bprev = document.querySelector('.backprev'); //이전 버튼
   var bnext = document.querySelector('.backnext'); //다음 버튼
   var bslideWidth = 202; //한개의 슬라이드 넓이
   var bslideMargin = 20; //슬라이드간의 margin 값

function bmoveSlide(bnum) {
    console.log(bcurrentIdx)
    console.log(bslideCount)
    console.log(bnum)
    let bslideNum = 0;
    bslideNum  = -bnum * 285;
    bslides.style.left = bslideNum+ 'px';
    bcurrentIdx = bnum;
}
if(bprev !=null){
    bprev.addEventListener('click', function () {
        if (bcurrentIdx > 0) {
            bmoveSlide(bcurrentIdx - 1);
        }
    })
}

;
if (bnext != null) {
    bnext.addEventListener('click', function () {
        if (bcurrentIdx < bslideCount-3) {
            bmoveSlide(bcurrentIdx + 1);

        }
    });
}

// 배경화면 수정
Array.from( document.getElementsByClassName("backi")).forEach((target) => target.addEventListener("click", function(){ 
    console.log(target.dataset.boardno)
    console.log(target)
    cvCho(target); 
    
    })
)

function cvCho(target){		
    const memberNo = target.dataset.memberno;
    const imgPath = target.dataset.imgpath
    const imgRename = target.dataset.imgrename


    console.log(cvCho)
    fetch("/cvCho?memberNo=" + memberNo + "&imgPath=" + imgPath + "&imgRename=" + imgRename) 
    .then(response => response.text()) 
    .then(() => {
    }) 
    .catch (e => { console.log(e)});
    document.getElementById("backLogo").src = imgPath+imgRename;
    document.getElementById("cv-set").style.display = "none";
    document.getElementById("back-modal").style.display="none";
    document.getElementById("back-modali").style.display="none";

};   

if(document.getElementById("delback") != null){
    document.getElementById("delback").addEventListener("click", () => {
        const memberNo = document.getElementById("delback").dataset.no; 
        fetch("/delback?memberNo="+memberNo)  
        .then(response => response.text()) 
        .then(() => {}) 
        .catch (e => { console.log(e)}); 
        document.getElementById("backLogo").src = "/resources/images/topMenu/페이지 시작화면.gif";
        document.getElementById("cv-set").style.display = "none";
        return;
    })
}

if(document.getElementById("backPlus") != null){
    
    document.getElementById("backPlus").addEventListener("click", () => {
        if(document.getElementById("cv-set").style.display == "none") {
            document.getElementById("cv-set").style.display = "block";
            document.getElementById("all").style.display = "block";
            return
        }
        if(document.getElementById("cv-set").style.display == "") {
            document.getElementById("cv-set").style.display = "block";
            document.getElementById("all").style.display = "block";
            
            return
        }
    })
}
if(document.getElementById("all") != null){
    document.getElementById("all").addEventListener("click", () =>{
        document.getElementById("cv-set").style.display = "none";
        document.getElementById("all").style.display = "none";
    })
}
//프로필 변경
// 배경화면 수정
Array.from( document.getElementsByClassName("profi")).forEach((target) => target.addEventListener("click", function(){ 
    console.log(target.dataset.boardno)
    console.log(target)
    pcvCho(target); 
    })
)

function pcvCho(target){		
    // const cvCho = new Map([["boardNo", target.dataset.memberno],["imgPath", target.dataset.imgpath],["imgRename", target.dataset.imgrename]]);
    const memberNo = target.dataset.memberno;
    const imgPath = target.dataset.imgpath
    const imgRename = target.dataset.imgrename

    // 프로필사진 변경 시 전역변수 동기화
    profileImage = imgPath + imgRename;


console.log(pcvCho)
    fetch("/pcvCho?memberNo=" + memberNo + "&imgPath=" + imgPath + "&imgRename=" + imgRename) 
    .then(response => response.text()) 
    .then(() => {
    }) 
    .catch (e => { console.log(e)});
    document.getElementById("profile-modal").style.display="none";
    document.getElementById("profile-modali").style.display="none";

    
    document.getElementById("nndrImage4").src = imgPath+imgRename;
    document.getElementById("homeLogo").src = imgPath+imgRename;
    document.getElementById("cv-set").style.display = "none";
};   

if(document.getElementById("perAddFriend") != null){
    document.getElementById("perAddFriend").addEventListener("click", sendFriendReq)
}






