
// ----------------------------------------------------------------------------------------------------------------

// sockjs를 이용한 WebSocket 구현

// 로그인이 되어 있을 경우에만
// /chattingSock 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
let alramSock= new SockJS("/alramSock");;

// if(loginMemberNo != ""){
// 	chattingSock = new SockJS("/chattingSock");
// }
const alram = document.getElementById("perAddFriend")
// 채팅 입력
const sendAlram=()=>{
	const senderMemberNo = document.getElementById("memberInfo").dataset.sender;
	const senderProfile = document.getElementById("memberInfo").dataset.profile;
	const senderHref = document.getElementById("memberInfo").dataset.href;
	const reciverMemberNo = document.getElementById("memberInfo").dataset.reciver;
	if(senderProfile === undefined){
		senderProfile="/resources/images/common/user-deafult.png";

	}
	const friendButton = document.getElementById("perAddFriend").innerText;
	var obj = {
		"senderMemberNo": senderMemberNo,
		"senderProfile": senderProfile,
		"senderHref": senderHref,
		"reciverMemberNo": reciverMemberNo,
		"friendButton": friendButton,
	}
	console.log(obj)
	// JSON.stringify() : 자바스크립트 객체를 JSON 문자열로 변환
	alramSock.send(JSON.stringify(obj));
		
	
}




// WebSocket 객체 chattingSock이 서버로 부터 메세지를 통지 받으면 자동으로 실행될 콜백 함수
alramSock.onmessage = function(e) {
	// 메소드를 통해 전달받은 객체값을 JSON객체로 변환해서 obj 변수에 저장.
	const alram = JSON.parse(e.data);
	const perAddFriend = document.getElementById("perAddFriend");
	if(alram.friendButton=="친구 추가"){
		if(perAddFriend!=null){
			perAddFriend.innerText ="친구 추가";
			perAddFriend.classList.remove('friendAdd');
			perAddFriend.classList.remove('friendAccept')
			perAddFriend.classList.remove('friendDel');
			perAddFriend.classList.add('noFriend')
		}
		return;
	}
	if(alram.friendButton== "친구 끊기"){ //수락
		if(perAddFriend!=null){
			perAddFriend.innerText ="친구 끊기";
			perAddFriend.classList.remove('friendAccept');
			perAddFriend.classList.add('friendDel')
		}
		document.getElementById("nndrImage3").src = "/resources/images/topMenu/페이지 시작화면.gif";
		alramType(alram.senderMemberNo, alram.senderProfile, "친구가 되었습니다.")
		return;
	}
	if(alram.friendButton=="신청 취소" ){ 
		if(perAddFriend!=null){
			perAddFriend.innerText ="친구 수락";
			perAddFriend.classList.remove('noFriend');
			perAddFriend.classList.add('friendAccept')
		}
		document.getElementById("nndrImage3").src = "/resources/images/topMenu/페이지 시작화면.gif";
		alramType(alram.senderMemberNo, alram.senderProfile, "친구 요청이 들어왔습니다.")
		return;
	}
	alert("123")
}

// 문서 로딩 완료 후 수행할 기능
document.addEventListener("DOMContentLoaded", ()=>{
	
	// 채팅방 목록에 클릭 이벤트 추가

	// 보내기 버튼에 이벤트 추가
	alram.addEventListener("click", sendAlram)

	
});


function alramType(no, profile, what){
	console.log(no)
	let nndrAddAlarm = document.createElement("div");
    nndrAddAlarm.classList.add("nndrAddAlarm");

    let nndrAddAlarmProfile = document.createElement("a");
    nndrAddAlarmProfile.classList.add("nndrAddAlarmProfile");
    nndrAddAlarmProfile.href = "/personalFeed/"+no;

    let nndrAddAlarmContent = document.createElement("a");
    nndrAddAlarmContent.classList.add("nndrAddAlarmContent");
    nndrAddAlarmContent.href = "/personalFeed/"+no;

    let topMyProfile = document.createElement("img");
    topMyProfile.classList.add("topMyProfile");
    topMyProfile.src = profile;
 


    let nndrAlarmContent = document.createElement("p");
    nndrAlarmContent.classList.add("nndrAlarmContent");
    nndrAlarmContent.innerHTML = what;

    const x = document.createElement('div');
    x.classList.add('nndr-top-alarm-delete');
    x.innerHTML = '&times;';

    nndrAddContainer.append(nndrAddAlarm);

    nndrAddAlarm.prepend(nndrAddAlarmProfile);
    nndrAddAlarm.append(nndrAddAlarmContent);
    nndrAddAlarm.append(x);

    nndrAddAlarmProfile.append(topMyProfile);
    nndrAddAlarmContent.append(nndrAlarmContent);
};