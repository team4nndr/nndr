const replyTextareas = document.querySelectorAll('.reply-bubble textarea');
const disableImages = document.querySelectorAll('.reply-send-disable');
const enableImages = document.querySelectorAll('.reply-send-enable');


function addTextareaEvent(textarea) {
    textarea.style.height = "24px";

    // 댓글창 최초 클릭 시 창 크기 늘리기
    textarea.addEventListener('focus', e => {
        if( e.target.value == "" ) {
            e.target.style.transitionDuration = "0.5s";
            e.target.style.height = "40px";
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
            e.target.parentElement.classList.add('pointer');
        } else {
            disableImage.classList.remove('hidden');
            enableImage.classList.add('hidden');
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

    // 엔터로 댓글 제출
    textarea.addEventListener('keypress', e => {
        if(e.keyCode == 13) {
            e.preventDefault();
        }
    });
    textarea.addEventListener('keyup', e => {
        if (e.keyCode == 13 && !e.shiftKey) {
            e.preventDefault();
            submitReply(e.target.getAttribute("no"));
        }
    });
}

// 댓글 textaread에 위 함수 적용
for(let i=0; i<replyTextareas.length; i++) {
    addTextareaEvent(replyTextareas[i]);
}

// 댓글 제출 to DB
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


// 댓글 삭제
function deleteReply(boardNo, replyNo) {

    if( confirm("댓글을 삭제하시겠어요?") ) {
        fetch("/reply/delete?replyNo=" + replyNo)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0) {
                printReplyList(boardNo);
                confirmDelete.classList.add('hidden')
            } else {
                alert('댓글 삭제 실패');
            }
        })
        .catch(e => console.log(e));
    }
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

            // 2-2. 추가기능(좋아요, 답글, 수정, 삭제, 작성일)
            const footer = document.createElement('div');
            footer.classList.add('reply-footer');

            // const like = document.createElement('a');
            // like.classList.add('like-btn');
            // like.innerText = '좋아요';

            const rere = document.createElement('a');
            rere.classList.add('re-reply');
            const profileImg = re.profileImage == null ? -1 : re.profileImage
            rere.addEventListener('click', () => showReplyForm(re.boardNo, re.replyNo, profileImg, rere));
            rere.innerText = '답글';

            const mod = document.createElement('a');
            mod.classList.add('reply-mod');
            mod.innerText = '수정';

            const del = document.createElement('a');
            del.classList.add('reply-del');
            del.addEventListener('click', () => deleteReply(re.boardNo, re.replyNo));
            del.innerText = '삭제';
            
            const date = document.createElement('a');
            date.classList.add('date');
            date.innerText = re.replyDate;

            footer.append(/*like, */rere, mod, del, date);

            rebody.append(bubble, footer);
            newRe.append(img, rebody);
            container.append(newRe);
        }
    })
    .catch(e => console.log(e));
}

// 대댓글작성란 추가
function showReplyForm(boardNo, replyNo, profileImage, btn) {

    // 동일한 댓글에 대댓글 작성칸이 이미 있으면 추가 안함
    const el = btn.parentElement.parentElement.parentElement.nextElementSibling;
    if( el.classList.contains('reply-write') ) {
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
    if(profileImage != 0) {
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
    // textarea.setAttribute('no', reply.boardNo);
    textarea.classList.add('reply-textarea');
    textarea.setAttribute('no', boardNo);
    textarea.setAttribute('placeholder', '댓글을 입력하세요...');
    textarea.setAttribute('maxlength', '1000');
    addTextareaEvent(textarea);

    const a = document.createElement('a');
    a.setAttribute('onclick', 'submitReply(' + boardNo + ', ' + replyNo + ')');

    const img1 = document.createElement('img');
    img1.setAttribute('src', '/resources/images/mainFeed/send.png');
    img1.classList.add('reply-send-disable');

    const img2 = document.createElement('img');
    img2.setAttribute('src', '/resources/images/mainFeed/send-blue.png');
    img2.classList.add('reply-send-enable');
    img2.classList.add('hidden');

    a.append(img1, img2);
    div2.append(textarea, a);
    div1.append(div2);
    form.append(img, div1);
    reForm.append(form);
    btn.parentElement.parentElement.parentElement.after(reForm);

    textarea.focus();
}

// 게시글 하단 댓글 달기 버튼 클릭 시 댓글 창으로 바로 이동
function replyFocus(boardNo) {
    document.querySelector('.reply-textarea[no="' + boardNo + '"]').focus();
}