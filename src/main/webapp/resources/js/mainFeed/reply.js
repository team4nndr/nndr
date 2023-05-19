const replyTextareas = document.querySelectorAll('.reply-bubble textarea');
const disableImages = document.querySelectorAll('.reply-send-disable');
const enableImages = document.querySelectorAll('.reply-send-enable');

for(let i=0; i<replyTextareas.length; i++) {
    replyTextareas[i].style.height = "24px";

    // 댓글창 최초 클릭 시 창 크기 늘리기
    replyTextareas[i].addEventListener('focus', e => {
        if( e.target.value == "" ) {
            e.target.style.transitionDuration = "0.5s";
            e.target.style.height = "40px";
        }
    });

    replyTextareas[i].addEventListener('input', e => {
        // 글자 입력 시 전송 버튼 활성화 
        const valueLength = replyTextareas[i].value.trim().length;
        if( valueLength > 0 ) {
            disableImages[i].classList.add('hidden');
            enableImages[i].classList.remove('hidden');
            e.target.parentElement.classList.add('pointer');
        } else {
            disableImages[i].classList.remove('hidden');
            enableImages[i].classList.add('hidden');
            e.target.parentElement.classList.remove('pointer');
        }

        // 댓글이 길어지면 댓글 창 크기 자동조정
        e.target.style.height = "";
        if( e.target.scrollHeight < 40) {
            e.target.style.height = "24px";
        } else {
            e.target.style.height = e.target.scrollHeight + "px";
        }
    });
}

// 댓글 작성 시 실시간 추가
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
            content.innerText = re.replyContent;

            bubble.append(name, content);

            // 2-2. 추가기능(좋아요, 답글달기, 작성일)
            const footer = document.createElement('div');
            footer.classList.add('reply-footer');

            // const like = document.createElement('a');
            // like.classList.add('like-btn');
            // like.innerText = '좋아요';

            const rere = document.createElement('a');
            rere.classList.add('re-reply');
            rere.innerText = '답글 달기';
            
            const date = document.createElement('a');
            date.classList.add('date');
            date.innerText = re.replyDate;

            footer.append(/*like, */rere, date);

            rebody.append(bubble, footer);
            newRe.append(img, rebody);
            container.append(newRe);
        }
    })
    .catch(e => console.log(e));
}

// 댓글 제출
function submitReply(boardNo, parentReplyNo) {
    
    const textarea = document.querySelector('.reply-textarea[no="' + boardNo + '"]');
    const replyContent = textarea.value;
    
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
            textarea.value = "";
        } else {
            alert('댓글 작성 실패');
        }
    })
    .catch(e => console.log(e));
}

// 엔터로 댓글 제출
const textareas = document.querySelectorAll('.reply-textarea');
for(let textarea of textareas) {

    textarea.addEventListener('keyup', e => {
        if (e.keyCode == 13)
            if ( !e.shiftKey ) {
                e.preventDefault();
                submitReply(e.target.getAttribute("no"));
            }
    });
}

// 대댓글작성란 추가
function replyWrite(parentReplyNo, memberNo, memberName) {

}