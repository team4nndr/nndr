const AT = { pos: -1 };
let mentionData = []; // 실시간 멘션 대상자

// 친구 목록 실시간 생성
function getMentionData() {
    
    const textarea = this.parentElement.parentElement.querySelector('textarea');
    const keyword = textarea.value.substring(textarea.value.lastIndexOf('@') + 1, textarea.value.length).trim();

    fetch("/mention?keyword=" + keyword)
    .then(resp => resp.json())
    .then(list => {
        const mention = makeMentionList(list);
        const bubble = this.parentElement.parentElement;
        mention.style.top = bubble.offsetHeight + 5 + 'px';
        closeMentionContainer(textarea); // 기존꺼 삭제
        textarea.parentElement.after(mention);
    })
    .catch(e => console.log(e));
}

// 멘션 문자열에 HTML 처리
function convertMention(originReply) {
    let replyContent = originReply;
    for(let obj of mentionData) {
        if(obj.name.length == 0) continue;
        while( replyContent.includes('@' + obj.name) ) {
            const mark = document.createElement('a');
            mark.classList.add('mention-mark');
            mark.href = '/personalFeed/' + obj.memberNo;
            mark.setAttribute('no', obj.memberNo);
            mark.innerText = obj.name;
    
            replyContent = replyContent.replace('@' + obj.name, mark.outerHTML);
        }    
    }
    return replyContent;
}

// 멘션 리스트 생성
function makeMentionList(list) {
    const container = document.createElement('ul');
    container.classList.add('mention-container');

    for(let el of list) {
        const li = document.createElement("li");
        li.classList.add("mention");
        li.addEventListener('click', e => {
            const textarea = e.target.parentElement.parentElement.querySelector('textarea');
            const name = e.target.querySelector('.mention-name').innerText;
            const memberNo = e.target.querySelector('.mention-friend').getAttribute('memberNo');
            const orignText = textarea.value;
            textarea.value = orignText.substring(0, orignText.lastIndexOf('@') + 1) + name;
            mentionData.push({ "name": name, "memberNo" : memberNo });
            textarea.focus();
            
            AT.pos = -1;
            closeMentionContainer(textarea); // 선택하고 창 닫기, 이벤트 제거
        });

        if(el.memberNo == loginMemberNo)
            li.classList.add("me");

        const img = document.createElement("img");
        if(el.profileImage != null) {
            img.setAttribute("src", el.profileImage);
        } else {
            img.setAttribute("src", "/resources/images/common/user-default.png");
        }

        const content = document.createElement("div");
        content.classList.add("mention-content");

        const name = document.createElement("p");
        name.classList.add("mention-name");
        name.innerText = el.memberName;

        const friend = document.createElement("p");
        friend.classList.add("mention-friend");
        if(el.memberNo != loginMemberNo) 
            friend.innerText = "친구";
        friend.setAttribute("memberNo", el.memberNo);

        content.append(name, friend);
        li.append(img, content);
        container.append(li);
    }

    return container;
}

// '@' 눌리면 해당 textarea에 멘션 기능 추가
function addMentionEvent(textarea) {
    textarea.addEventListener('keyup', e => {

        if(e.keyCode == 50 && e.shiftKey) { 
            AT.pos = textarea.selectionStart; // 새로운 '@' 위치
            textarea.addEventListener('keyup', getMentionData);
            // console.log("함수 추가됨");
        }

        // ESC 키 누르면 창 닫기
        if(e.keyCode == 27) {
            AT.pos = -1; // 해당 '@'는 일반 문자로 사용함
            closeMentionContainer(textarea);
        
        // '@'지우면 창 닫기
        } else if(e.keyCode == 8) {
            if(textarea.value.lastIndexOf('@') < AT.pos) {
                AT.pos = -1; // '@' 지워짐
                closeMentionContainer(textarea);
            }
        }
    });
}

// 멘션 리스트 닫기
function closeMentionContainer(textarea) {
    const container = document.querySelector('.mention-container');
    if(container != null) {
        container.remove();
    }

    if(AT.pos == -1) { // 새로운 '@' 없음
        textarea.removeEventListener('keyup', getMentionData);
    }
}

// 댓글 제출시 멘션 대상에게 알림 발송
function sendMentionAlarm(boardNo) { 
    // TODO: 알림 클릭 시 멘션된 게시글로 이동(boardNo)
    
    var obj = {
        "profileImage": profileImage,
        "link": "/personalFeed/" + loginMemberNo,
        "message": loginMemberName + "님이 회원님을 언급했습니다."
    }

    mentionData.forEach( mention => {

        // 자기 자신을 태그한 경우 알람 발송 안함
        if(mention.memberNo == loginMemberNo) return;

        var alarm = {
            "memberNo": mention.memberNo,
            "alarmContent" : makeAlarm(obj),
            "type": "MENTION"
        };
        
        alarmSock.send(JSON.stringify(alarm));
    });

    mentionData = [];
}