let alarmSock;
if(alarmSock != ""){
	alarmSock = new SockJS("/alarmSock");
}




// WebSocket 객체가 서버로 부터 메세지를 통지 받으면 자동으로 실행될 콜백 함수
alarmSock.onmessage = function(e) {
	const alarm = JSON.parse(e.data);
	
	// 개인피드 친구추가 버튼 관련 동작
	const perAddFriend = document.getElementById("perAddFriend");
	console.log(alarm.content);
	if(alarm.content=="친구 추가"){
		if(perAddFriend!=null){
			perAddFriend.innerText ="친구 추가";
			perAddFriend.classList.remove('friendAdd');
			perAddFriend.classList.remove('friendAccept')
			perAddFriend.classList.remove('friendDel');
			perAddFriend.classList.add('noFriend')
			
		}
		return;
	}
	if(alarm.content=="친구 수락"){
		if(perAddFriend!=null){
			perAddFriend.innerText ="친구 끊기";
			perAddFriend.classList.remove('friendAdd');
			perAddFriend.classList.remove('noFriend')
			perAddFriend.classList.remove('friendAccept');
			perAddFriend.classList.add('friendDel')
		}
		
		return;
	}
	if(alarm.content== "친구 끊기"){ //수락
		if(perAddFriend!=null){
			perAddFriend.innerText ="친구 끊기";
			perAddFriend.classList.remove('friendAdd')
			perAddFriend.classList.remove('friendAccept');
			perAddFriend.classList.remove('noFriend')
			perAddFriend.classList.add('friendDel');
		}
		return;
	}
	if(alarm.content=="신청 취소" ){ 
		if(perAddFriend!=null){
			perAddFriend.innerText ="친구 수락";
			perAddFriend.classList.remove('noFriend');
			perAddFriend.classList.remove('friendAdd');
			perAddFriend.classList.remove('friendDel');
			perAddFriend.classList.add('friendAccept')
		}
		return;
	}
	
	// 상단바 알람 출력
	const alarmList = document.getElementById('nndrAddContainer');
	const div = document.createElement('div');
	div.innerHTML = alarm.alarmContent;
	alarmList.prepend(div.firstChild);
		document.querySelector('.nndr-top-alarm-delete').addEventListener('click', e => e.target.parentElement.remove());
	const mark = document.getElementById("alarmMark");
	
	mark.style.display = 'block';

	}

function makeAlarm(obj) {
	let nndrAddAlarm = document.createElement("div");
	nndrAddAlarm.classList.add("nndrAddAlarm");
	
	let nndrAddAlarmLink = document.createElement("a");
	nndrAddAlarmLink.href = obj.link;
	
	let topMyProfile = document.createElement("img");
	topMyProfile.classList.add("topMyProfile");
	topMyProfile.src = obj.profileImage.trim().length == 0 ? "/resources/images/common/user-default.png" : obj.profileImage;

	let nndrAlarmContent = document.createElement("p");
	nndrAlarmContent.classList.add("nndrAlarmContent");
	nndrAlarmContent.innerHTML = obj.message;

	const x = document.createElement('div');
	x.classList.add('nndr-top-alarm-delete');
	x.innerHTML = '&times;';

	nndrAddAlarmLink.append(topMyProfile);
	nndrAddAlarmLink.append(nndrAlarmContent);

	nndrAddAlarm.append(nndrAddAlarmLink);
	nndrAddAlarm.append(x);

	return nndrAddAlarm.outerHTML;
};

document.getElementById("delAllAlarm").addEventListener("click", () => {
	fetch("/delAllAlarm")  
    .then(response => response.text()) 
    .then(() => {
    }) 
    .catch (e => { console.log(e)}); 

})
