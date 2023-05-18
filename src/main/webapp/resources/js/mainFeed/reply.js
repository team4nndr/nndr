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
            e.target.nextElementSibling.setAttribute("href", "#");
            // e.target.parentElement.style.cursor = "none";
        } else {
            disableImages[i].classList.remove('hidden');
            enableImages[i].classList.add('hidden');
            e.preventDefault();
            e.target.parentElement.removeAttribute("href");
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


