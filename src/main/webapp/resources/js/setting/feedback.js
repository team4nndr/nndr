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

// 두 번째 모달 창으로 이동
const submitBtn = document.getElementById('submitBtn');
submitBtn.addEventListener('click', () => {
    modalContent1.style.display = 'none';
    modalBottom1.style.display = 'none';
    modalContent2.style.display = 'flex';
    modalBottom2.style.display = 'block';
});

// 모달창 취소 버튼 기능 넣기
const cancelBtnList = document.getElementsByClassName('cancelBtn');
for(let btn of cancelBtnList) {
    btn.addEventListener('click', () => {
        modal.classList.remove('show');
    });
}