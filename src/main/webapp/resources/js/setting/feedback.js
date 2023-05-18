const modal = document.querySelector('.modal');
const modalBody = document.querySelector('.modal-body');

const modalContent1 = document.getElementById('modalContent1');
const modalContent2 = document.getElementById('modalContent2');
const modalBottom1 = document.getElementById('modalBottom1');
const modalBottom2 = document.getElementById('modalBottom2');

// ESC 버튼 눌리면 메인 화면으로 이동
window.addEventListener("keyup", e => {
    if(e.keyCode == 27) { // ESC==27
        modal.style.display = "none"; // 팝업 닫힘
        location.href = "/setting/general"; // 설정 > 일반 화면으로 이동
    }
});

// 전송버튼 클릭 시 DB에 데이터 전송 + 성공 시 두 번째 모달 창으로 이동
const submitBtn = document.getElementById('submitBtn');
submitBtn.addEventListener('click', () => {

    const data = {};
    data.memberNo = memberNo;
    data.feedbackContent = document.getElementById('feedbackContent').value;
    
    fetch("feedback", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            // 의견 제출 성공 시 두번째 모달창 출력
            modalContent1.style.display = 'none';
            modalBottom1.style.display = 'none';
            modalContent2.style.display = 'flex';
            modalBottom2.style.display = 'block';
        }else{
            alert("의견 제출 실패");
        }
    })
    .catch(e => console.log(e));
});

// 아무것도 입력하지 않으면 전송버튼 비활성화
const feedbackContent = document.getElementById('feedbackContent');
if(feedbackContent != null) {
    feedbackContent.addEventListener('input', () => {
        if( feedbackContent.value.trim().length == 0 ) {
            submitBtn.disabled = true;
        } else {
            submitBtn.disabled = false;
        }
    });
}


// 모달창 취소 버튼 기능 넣기
const cancelBtns = document.getElementsByClassName('cancelBtn');
for(let btn of cancelBtns) {
    btn.addEventListener('click', () => {
        modal.classList.remove('show');
        location.href = "/setting/general"; // 설정 > 일반 화면으로 이동
    });
}

// 의견 전송 완료 후 창 닫으면 설정 > 일반 화면으로 이동
const cancelBtn2 = document.getElementById('cancelBtn2');
if(cancelBtn2 != null) {
    cancelBtn2.addEventListener('click', () => {
        location.href = "/setting/general";
    });
}
