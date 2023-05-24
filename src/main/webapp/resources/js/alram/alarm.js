
// ----------------------------------------------------------------------------------------------------------------

// sockjs를 이용한 WebSocket 구현

// 로그인이 되어 있을 경우에만
// /chattingSock 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성


// if(loginMemberNo != ""){
// 	chattingSock = new SockJS("/chattingSock");
// }

// 채팅 입력


// WebSocket 객체 chattingSock이 서버로 부터 메세지를 통지 받으면 자동으로 실행될 콜백 함수
alramSock.onmessage = function(e) {
	const alram = JSON.parse(e.data);
	// 메소드를 통해 전달받은 객체값을 JSON객체로 변환해서 obj 변수에 저장.
	
	const alarmList = document.getElementById('alarmList');
	alarmList.prepend(alram.alarmContent);

	const perAddFriend = document.getElementById("perAddFriend");
	if(alram.content=="친구 추가"){
		if(perAddFriend!=null){
			perAddFriend.innerText ="친구 추가";
			perAddFriend.classList.remove('friendAdd');
			perAddFriend.classList.remove('friendAccept')
			perAddFriend.classList.remove('friendDel');
			perAddFriend.classList.add('noFriend')
		}
		return;
	}
	if(alram.content=="친구 수락"){
		if(perAddFriend!=null){
			perAddFriend.innerText ="친구 끊기";
			perAddFriend.classList.remove('friendAdd');
			perAddFriend.classList.remove('noFriend')
			perAddFriend.classList.remove('friendAccept');
			perAddFriend.classList.add('friendDel')
		}
		return;
	}
	if(alram.content== "친구 끊기"){ //수락
		if(perAddFriend!=null){
			perAddFriend.innerText ="친구 끊기";
			perAddFriend.classList.remove('friendDel');
			perAddFriend.classList.remove('friendAdd')
			perAddFriend.classList.remove('friendAccept');
			perAddFriend.classList.add('noFriend')
		}
		document.getElementById("nndrImage3").src = "/resources/images/topMenu/페이지 시작화면.gif";
		// alramType(alram.senderMemberNo, alram.senderProfile, "친구가 되었습니다.")
		return;
	}
	if(alram.content=="신청 취소" ){ 
		if(perAddFriend!=null){
			perAddFriend.innerText ="친구 수락";
			perAddFriend.classList.remove('noFriend');
			perAddFriend.classList.remove('friendAdd');
			perAddFriend.classList.remove('friendDel');
			perAddFriend.classList.add('friendAccept')
		}
		document.getElementById("nndrImage3").src = "/resources/images/topMenu/페이지 시작화면.gif";
		// alramType(alram.senderMemberNo, alram.senderProfile, "친구 요청이 들어왔습니다.")
		return;
	}
}

const alram = document.getElementById("perAddFriend")
// 문서 로딩 완료 후 수행할 기능
// document.addEventListener("DOMContentLoaded", ()=>{
	
	// 채팅방 목록에 클릭 이벤트 추가

	// 보내기 버튼에 이벤트 추가


	
// });



// function alramType(no, profile, what){
// 	console.log(no)
// 	let nndrAddAlarm = document.createElement("div");
//     nndrAddAlarm.classList.add("nndrAddAlarm");

//     let nndrAddAlarmProfile = document.createElement("a");
//     nndrAddAlarmProfile.classList.add("nndrAddAlarmProfile");
//     nndrAddAlarmProfile.href = "/personalFeed/"+no;

//     let nndrAddAlarmContent = document.createElement("a");
//     nndrAddAlarmContent.classList.add("nndrAddAlarmContent");
//     nndrAddAlarmContent.href = "/personalFeed/"+no;

//     let topMyProfile = document.createElement("img");
//     topMyProfile.classList.add("topMyProfile");
//     topMyProfile.src = profile;

//     let nndrAlarmContent = document.createElement("p");
//     nndrAlarmContent.classList.add("nndrAlarmContent");
//     nndrAlarmContent.innerHTML = what;

//     const x = document.createElement('div');
//     x.classList.add('nndr-top-alarm-delete');
//     x.innerHTML = '&times;';

//     nndrAddContainer.append(nndrAddAlarm);

//     nndrAddAlarm.prepend(nndrAddAlarmProfile);
//     nndrAddAlarm.append(nndrAddAlarmContent);
//     nndrAddAlarm.append(x);

//     nndrAddAlarmProfile.append(topMyProfile);
//     nndrAddAlarmContent.append(nndrAlarmContent);
// };

// 알람 발송할 떄 사용
function makeAlarm(obj) {
	// 보낸사람 아이디, 보낸사람 프로필사진, 보낸사람 이름
	// console.log(no)
	let nndrAddAlarm = document.createElement("div");
	nndrAddAlarm.classList.add("nndrAddAlarm");

	let nndrAddAlarmProfile = document.createElement("a");
	nndrAddAlarmProfile.classList.add("nndrAddAlarmProfile");
	nndrAddAlarmProfile.href = obj.link;

	let nndrAddAlarmContent = document.createElement("a");
	nndrAddAlarmContent.classList.add("nndrAddAlarmContent");
	nndrAddAlarmContent.href =obj.link;

	let topMyProfile = document.createElement("img");
	topMyProfile.classList.add("topMyProfile");
	topMyProfile.src = obj.profileImage;

	let nndrAlarmContent = document.createElement("p");
	nndrAlarmContent.classList.add("nndrAlarmContent");
	nndrAlarmContent.innerHTML = obj.message;

	const x = document.createElement('div');
	x.classList.add('nndr-top-alarm-delete');
	x.innerHTML = '&times;';

	nndrAddContainer.append(nndrAddAlarm);

	nndrAddAlarm.prepend(nndrAddAlarmProfile);
	nndrAddAlarm.append(nndrAddAlarmContent);
	nndrAddAlarm.append(x);

	nndrAddAlarmProfile.append(topMyProfile);
	nndrAddAlarmContent.append(nndrAlarmContent);

	return nndrAddAlarm.outerHTML;
};

