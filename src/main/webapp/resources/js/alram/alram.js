
// ----------------------------------------------------------------------------------------------------------------

// sockjs를 이용한 WebSocket 구현

// 로그인이 되어 있을 경우에만
// /chattingSock 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
let chattingSock;

if(loginMemberNo != ""){
	chattingSock = new SockJS("/chattingSock");
}



// 채팅 입력
const send = document.getElementById("send");

const sendMessage = () => {
	const inputChatting = document.getElementById("inputChatting");
	if (inputChatting.value.trim().length == 0) {
		alert("채팅을 입력해주세요.");
		inputChatting.value = "";
	} else {
		var obj = {
			"senderNo": loginMemberNo,
			"targetNo": selectTargetNo,
			"chattingNo": selectChattingNo,
			"messageContent": inputChatting.value,
		};
		console.log(obj)
		// JSON.stringify() : 자바스크립트 객체를 JSON 문자열로 변환
		chattingSock.send(JSON.stringify(obj));

		inputChatting.value = "";
	}
}

// 엔터 == 제출
// 쉬프트 + 엔터 == 줄바꿈
inputChatting.addEventListener("keyup", e => {
	if(e.key == "Enter"){ 
		if (!e.shiftKey) {
			sendMessage();
		}
	}
})



// WebSocket 객체 chattingSock이 서버로 부터 메세지를 통지 받으면 자동으로 실행될 콜백 함수
chattingSock.onmessage = function(e) {
	// 메소드를 통해 전달받은 객체값을 JSON객체로 변환해서 obj 변수에 저장.
	const msg = JSON.parse(e.data);
	console.log(msg);


	// 현재 채팅방을 보고있는 경우
	if(selectChattingNo == msg.chattingNo){


		const ul = document.querySelector(".display-chatting");
	
		// 메세지 만들어서 출력하기
		//<li>,  <li class="my-chat">
		const li = document.createElement("li");
	
		// 보낸 시간
		const span = document.createElement("span");
		span.classList.add("chatDate");
		span.innerText = msg.sendTime;
	
		// 메세지 내용
		const p = document.createElement("p");
		p.classList.add("chat");
		p.innerHTML = msg.messageContent; // br태그 해석을 위해 innerHTML
	
		// 내가 작성한 메세지인 경우
		if(loginMemberNo == msg.senderNo){ 
			li.classList.add("my-chat");
			
			li.append(span, p);
			
		}else{ // 상대가 작성한 메세지인 경우
			li.classList.add("target-chat");
	
			// 상대 프로필
			// <img src="/resources/images/user.png">
			const img = document.createElement("img");
			img.setAttribute("src", selectTargetProfile);
			
			const div = document.createElement("div");
	
			// 상대 이름
			const b = document.createElement("b");
			b.innerText = selectTargetName; // 전역변수
	
			const br = document.createElement("br");
	
			div.append(b, br, p, span);
			li.append(img,div);
	
		}
	
		ul.append(li)
		display.scrollTop = display.scrollHeight; // 스크롤 제일 밑으로
	}



	selectRoomList();
}




// 문서 로딩 완료 후 수행할 기능
document.addEventListener("DOMContentLoaded", ()=>{
	
	// 채팅방 목록에 클릭 이벤트 추가
	roomListAddEvent(); 

	// 보내기 버튼에 이벤트 추가
	send.addEventListener("click", sendMessage);
});