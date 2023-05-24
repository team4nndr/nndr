let alramSock;
if(alramSock != ""){
	alramSock = new SockJS("/alramSock");
}

// WebSocket 객체 chattingSock이 서버로 부터 메세지를 통지 받으면 자동으로 실행될 콜백 함수
alramSock.onmessage = function(e) {
	const alram = JSON.parse(e.data);
	
	// 상단바 알람 출력
	const alarmList = document.getElementById('nndrAddContainer');
	const div = document.createElement('div');
	div.innerHTML = alram.alarmContent;
	div.querySelector('.alarm-delete').addEventListener('click', e => {
		div.remove();
	});
	alarmList.prepend(div);

	// 개인피드 친구추가 버튼 관련 동작
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

// 알람 발송용 함수
function makeAlarm(obj) {
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

	// nndrAddContainer.append(nndrAddAlarm);

	nndrAddAlarm.prepend(nndrAddAlarmProfile);
	nndrAddAlarm.append(nndrAddAlarmContent);
	nndrAddAlarm.classList.add('alarm-delete');
	nndrAddAlarm.append(x);
	
	nndrAddAlarmProfile.append(topMyProfile);
	nndrAddAlarmContent.append(nndrAlarmContent);

	return nndrAddAlarm.outerHTML;
};