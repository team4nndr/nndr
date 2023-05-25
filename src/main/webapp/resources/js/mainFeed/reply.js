// 댓글 관련 요소
const replyTextareas = document.querySelectorAll('.reply-bubble textarea');
const disableImages = document.querySelectorAll('.reply-send-disable');
const enableImages = document.querySelectorAll('.reply-send-enable');

// 댓글창 textarea 기능
function addTextareaEvent(textarea) {
    textarea.style.height = "24px";

    // 댓글창 최초 클릭 시 창 크기 늘리기
    textarea.addEventListener('focus', e => {
        e.target.style.height = "";
        e.target.style.transitionDuration = "0.5s";
        
        if( e.target.value == "" ) {
            e.target.style.height =  "42px";
        } else {
            e.target.style.height = e.target.scrollHeight + "px";
        }
    });

    // 글자 입력 시 전송 버튼 활성화 
    textarea.addEventListener('input', e => {
        const valueLength = e.target.value.trim().length;
        const disableImage = e.target.nextElementSibling.children[0];
        const enableImage = e.target.nextElementSibling.children[1];

        if( valueLength > 0 ) {
            disableImage.classList.add('hidden');
            enableImage.classList.remove('hidden');
            e.target.nextElementSibling.classList.add('pointer');
            e.target.nextElementSibling.classList.add('enable');
        } else {
            disableImage.classList.remove('hidden');
            enableImage.classList.add('hidden');
            e.target.nextElementSibling.classList.remove('pointer');
            e.target.nextElementSibling.classList.remove('enable');
        }

        // 댓글이 길어지면 댓글 창 크기 자동조정
        e.target.style.height = "";
        e.target.style.transitionDuration = "0.5s";
        e.target.style.height = e.target.scrollHeight + "px";
    });

    // 엔터로 댓글 제출
    textarea.addEventListener('keypress', e => {
        if(e.keyCode == 13 && !e.shiftKey) {
            e.preventDefault();
        }
    });
    textarea.addEventListener('keyup', e => {
        if (e.keyCode == 13 && !e.shiftKey && e.target.matches(":focus")) {
            e.preventDefault();
            e.target.nextElementSibling.click();
        }
    });

    // 멘션 기능 추가
    addMentionEvent(textarea);
}

// 댓글 textaread에 위 함수 적용
for(let i=0; i<replyTextareas.length; i++) {
    addTextareaEvent(replyTextareas[i]);
} 

// 댓글 제출시 글 작성자에게 알림 발송
function sendReplyAlarm(boardNo) { 
    const memberNo = document.querySelector('.reply-container.board' + boardNo)
    .parentElement.querySelector('.feed-head-info > a')
    .getAttribute('href').split('/')[2];

    // 자기 게시글일 경우 알람 발송 안함
    if(memberNo == loginMemberNo) return;

    var obj = {
        "profileImage": profileImage,
        "link": "/personalFeed/" + loginMemberNo,
        "message": loginMemberName + "님이 게시글에 댓글을 달았습니다."
    }

	var alarm = {
		"memberNo": memberNo,
        "alarmContent" : makeAlarm(obj),
        "type": "REPLY"
	}
    
	alarmSock.send(JSON.stringify(alarm));
}

// 댓글 제출 ajax
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
            sendReplyAlarm(boardNo); // 피드 작성자에게 알림 발송
            sendMentionAlarm(boardNo); // 멘션 대상자에게 알림 발송
            textarea.value = "";
        } else {
            alert('댓글 작성 실패');
        }
    })
    .catch(e => console.log(e));
}

// 댓글 삭제 ajax
function deleteReply(boardNo, replyNo) {

    if( confirm("댓글을 삭제하시겠어요?") ) {
        fetch("/reply/delete?replyNo=" + replyNo)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0) {
                printReplyList(boardNo);
            } else {
                alert('댓글 삭제 실패');
            }
        })
        .catch(e => console.log(e));
    }
}

// 댓글 등록/수정/삭제 시 화면에 실시간 반영 ajax
function printReplyList(boardNo) {
    fetch("/reply?boardNo=" + boardNo)
    .then(resp => resp.json())
    .then(list => {

        const container = document.querySelector('.reply-container.board' + boardNo);
        container.innerHTML = "";

        for(let re of list) {
            const newRe = document.createElement('div');
            newRe.classList.add('reply');
            if(re.parentReplyNo != 0 && re.parentReplyNo != null) {
                newRe.classList.add('re-reply');
            }

            // 1. 프로필사진
            const img = document.createElement('img');
            img.classList.add('reply-profile-image');
            if( re.profileImage != null ){
                img.setAttribute("src", re.profileImage);
                img.addEventListener('click', () => location.href = "/personalFeed/" + re.memberNo);
                img.classList.add('pointer');
            } else { // 없을 경우 기본이미지
                img.setAttribute("src", "/resources/images/common/user-default.png");
            }

            // 2. 댓글 본문 + 추가기능
            const rebody = document.createElement('div');
            rebody.classList.add('reply-body');

            // 2-1. 댓글본문 (이름, 내용)
            const bubble = document.createElement('div');
            bubble.classList.add('reply-bubble');

            const name = document.createElement('p');
            name.classList.add('reply-name');
            name.innerText = re.memberName;

            const content = document.createElement('p');
            content.classList.add('reply-content');
            content.innerHTML = re.replyContent;

            bubble.append(name, content);

            // 2-2. 추가기능(좋아요, 답글, 수정, 삭제, 작성일)
            const footer = document.createElement('div');
            footer.classList.add('reply-footer');

            // const like = document.createElement('a');
            // like.classList.add('like-btn');
            // like.innerText = '좋아요';

            const rere = document.createElement('div');
            rere.classList.add('re-reply');
            rere.addEventListener('click', e => showReplyForm(re.boardNo, re.replyNo, e.target));
            rere.innerText = '답글';

            const mod = document.createElement('div');
            mod.classList.add('reply-mod');
            mod.addEventListener('click', e => showUpdateForm(re.boardNo, re.replyNo, e.target));
            mod.innerText = '수정';

            const del = document.createElement('div');
            del.classList.add('reply-del');
            del.addEventListener('click', () => deleteReply(re.boardNo, re.replyNo));
            del.innerText = '삭제';
            
            const date = document.createElement('div');
            date.classList.add('date');
            date.innerText = re.updateDate == null ? re.replyDate : re.updateDate + '에 수정됨';

            if(re.memberNo == loginMemberNo) {
                footer.append(rere, mod, del, date);
            } else {
                footer.append(rere, date);
            }

            rebody.append(bubble, footer);
            newRe.append(img, rebody);
            container.append(newRe);
        }
    })
    .catch(e => console.log(e));
}

// 대댓글작성란 추가
function showReplyForm(boardNo, replyNo, btn) {

    // 동일한 댓글에 대댓글 작성칸이 이미 있으면 추가 안함
    const el = btn.parentElement.parentElement.parentElement.nextElementSibling;
    if( el != null && el.classList.contains('reply-write') ) {
        el.querySelector('.reply-textarea').focus();
        return;
    }

    const reForm = document.createElement('section');
    reForm.classList.add('reply-write');
    reForm.classList.add('reply-container');
    reForm.classList.add('re-reply');

    
    const form = document.createElement('div');
    form.classList.add('reply');
    form.classList.add('re-reply');

    const img = document.createElement('img');
    if(profileImage != null) {
        img.setAttribute('src', profileImage);
    } else {
        img.setAttribute('src', "/resources/images/common/user-default.png");
    }
    img.classList.add('reply-profile-image');

    const div1 = document.createElement('div');
    div1.classList.add('reply-body');

    const div2 = document.createElement('div');
    div2.classList.add('reply-bubble');

    const textarea = document.createElement('textarea');
    textarea.classList.add('reply-textarea');
    textarea.setAttribute('no', boardNo);
    textarea.setAttribute('placeholder', '댓글을 입력하세요...');
    textarea.setAttribute('maxlength', '1000');
    addTextareaEvent(textarea);

    const submitBtn = document.createElement('div');
    submitBtn.classList.add('submit-btn');
    submitBtn.addEventListener('click', e => submitReply(boardNo, replyNo, e.target));
    
    const img1 = document.createElement('img');
    img1.setAttribute('src', '/resources/images/mainFeed/send.png');
    img1.classList.add('reply-send-disable');
    
    const img2 = document.createElement('img');
    img2.setAttribute('src', '/resources/images/mainFeed/send-blue.png');
    img2.classList.add('reply-send-enable');
    img2.classList.add('hidden');

    submitBtn.append(img1, img2);
    div2.append(textarea, submitBtn);
    div1.append(div2);
    form.append(img, div1);
    reForm.append(form);
    btn.parentElement.parentElement.parentElement.after(reForm);

    textarea.focus();
}

// 댓글 수정 칸 띄우기
function showUpdateForm(boardNo, replyNo, btn) {

    // 원본 댓글 숨기기
    const origin = btn.parentElement.parentElement.parentElement;
    origin.classList.add('hidden');
    
    // 멘션 데이터 보존
    const div = document.createElement('div');
    div.innerHTML = origin.querySelector('.reply-content').innerHTML;
    const markList = div.querySelectorAll('.mention-mark');
    for(let mark of markList) {
        const mention = mark.innerText;
        const no = mark.getAttribute('no');
        mentionData.push( { "name": mention, "no": no });
        div.innerHTML = div.innerHTML.replace(mark.outerHTML, '@'+mention);
    }
    origin.querySelector('.reply-content').innerText = div.innerHTML;
    
    const reForm = document.createElement('section');
    reForm.classList.add('reply-write');
    reForm.classList.add('reply-container');
    reForm.classList.add('reply-update');
    if(origin.classList.contains('re-reply')) reForm.classList.add('re-reply');
    
    const form = document.createElement('div');
    form.classList.add('reply');
    if(origin.classList.contains('re-reply')) form.classList.add('re-reply');
    
    const img = document.createElement('img');
    if(profileImage != null) {
        img.setAttribute('src', profileImage);
    } else {
        img.setAttribute('src', "/resources/images/common/user-default.png");
    }
    img.classList.add('reply-profile-image');
    
    const body = document.createElement('div');
    body.classList.add('reply-body');
    
    const bubble = document.createElement('div');
    bubble.classList.add('reply-bubble');
    
    const textarea = document.createElement('textarea');
    textarea.classList.add('reply-textarea');
    textarea.setAttribute('no', boardNo);
    textarea.setAttribute('placeholder', '댓글을 입력하세요...');
    textarea.setAttribute('maxlength', '1000');
    textarea.value = origin.querySelector('.reply-content').innerText;
    addTextareaEvent(textarea); // 엔터로 제출
    
    // ESC 키로 수정 취소
    textarea.addEventListener('keyup', e => {
        if(e.keyCode == 27) {
            // printReplyList(boardNo);
            origin.classList.remove('hidden');
            origin.nextElementSibling.remove();
        }
    });

    const submitBtn = document.createElement('div');
    submitBtn.classList.add('submit-btn');
    submitBtn.addEventListener('click', e => updateReply(boardNo, replyNo, e.target));
    
    const cancelBtn = document.createElement('div');
    cancelBtn.classList.add('cancel-btn');
    cancelBtn.setAttribute('onclick', 'printReplyList('+boardNo+')');
    cancelBtn.innerText = '취소';

    const updateInfo = document.createElement('p');
    updateInfo.classList.add('update-info');
    updateInfo.append(cancelBtn);
    const updateInfoAppend = updateInfo.innerHTML;
    updateInfo.innerHTML = updateInfoAppend + '하려면 ESC 키를 누르세요.';

    const img1 = document.createElement('img');
    img1.setAttribute('src', '/resources/images/mainFeed/send.png');
    img1.classList.add('reply-send-disable');
    
    const img2 = document.createElement('img');
    img2.setAttribute('src', '/resources/images/mainFeed/send-blue.png');
    img2.classList.add('reply-send-enable');
    img2.classList.add('hidden');
    
    submitBtn.append(img1, img2);
    bubble.append(textarea, submitBtn);
    body.append(bubble, updateInfo);
    form.append(img, body);
    reForm.append(form);
    origin.after(reForm);
    
    textarea.focus();
}

// 게시글 하단 댓글 달기 버튼 클릭 시 댓글 창으로 바로 이동
function replyFocus(boardNo) {
    document.querySelector('.reply-textarea[no="' + boardNo + '"]').focus();
}

// 댓글 수정 ajax
function updateReply(boardNo, replyNo, btn) {
    
    if( btn != null && !btn.classList.contains('enable') ) return;
    
    const textarea = document.querySelector('.reply-textarea[no="' + boardNo + '"]');
    let replyContent = convertMention(textarea.value); // 멘션 문자열에 HTML 처리
    
    const data = {
        "replyNo" : replyNo,
        "replyContent" : replyContent
    };
    
    fetch("/reply/update", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(resp => resp.text())
    .then(result => {
        if(result > 0) {
            printReplyList(boardNo);
            sendReplyAlarm(boardNo); // 피드 작성자에게 알림 발송
            sendMentionAlarm(boardNo); // 멘션 대상자에게 알림 발송
            textarea.value = "";
        } else {
            alert('댓글 수정 실패');
        }
    })
    .catch(e => console.log(e));
}