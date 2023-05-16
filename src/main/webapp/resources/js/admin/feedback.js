// 회원의견 처리하기 버튼
const feedbackSubmitBtn = document.getElementById('feedbackSubmit');

// 관리자 의견 입력 ->  회원의견 처리하기 버튼 활성화
const adminComment = document.querySelector('textarea#adminComment');
if(adminComment != null) {
    adminComment.addEventListener('input', () => {
        if( adminComment.value.length > 0 ) {
            feedbackSubmitBtn.disabled = false;
        } else {
            feedbackSubmitBtn.disabled = true;
        }
    }); 
}

// 뒤로가기, 목록으로 버튼 설정
const backBtns = document.querySelectorAll('.back');
for(let btn of backBtns) {
    const cp = window.location.search.split("=")[1];
    btn.addEventListener("click", () => {
        if(cp != undefined) {
            location.href = "/admin/feedback?cp=" + cp;
        }
    });
}