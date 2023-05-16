const modal = document.querySelector('.modal');
const modalBody = document.querySelector('.modal-body');

const modalContent1 = document.getElementById('modalContent1');
const modalContent2 = document.getElementById('modalContent2');
const modalBottom1 = document.getElementById('modalBottom1');
const modalBottom2 = document.getElementById('modalBottom2');

// 모달창 외부 클릭 시 창 닫힘
modal.addEventListener("click", (e) => {
    // 팝업 내부 클릭 시 동작 안함
    if( e.clientX > modalBody.getBoundingClientRect().left 
        && e.clientX < modalBody.getBoundingClientRect().right
        && e.clientY > modalBody.getBoundingClientRect().top 
        && e.clientY < modalBody.getBoundingClientRect().bottom ) {
            return;
    }

    // 팝업 외부 클릭 시 팝업 닫힘
    modal.style.display = "none";
});

// 전송버튼 클릭 시 DB에 데이터 전송 + 성공 시 두 번째 모달 창으로 이동
const submitBtn = document.getElementById('submitBtn');
submitBtn.addEventListener('click', () => {

    const data = {
        "memberNo" : memberNo,
        "feedbackContent" : document.getElementById('feedbackContent').value
    };
    
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

// 모달창 취소 버튼 기능 넣기
const cancelBtnList = document.getElementsByClassName('cancelBtn');
for(let btn of cancelBtnList) {
    btn.addEventListener('click', () => {
        modal.classList.remove('show');
    });
}