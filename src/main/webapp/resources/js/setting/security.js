/* Modal */
const modal = document.querySelector('.modal');
const modalBody = document.querySelector('.modal-body');

const accountDisableBtn = document.getElementById('accountDisableBtn');
const disableContinueBtn = document.getElementById('disableContinueBtn');

const modalContent1 = document.getElementById('modalContent1');
const modalContent2 = document.getElementById('modalContent2');
const modalBottom1 = document.getElementById('modalBottom1');
const modalBottom2 = document.getElementById('modalBottom2');

// 모달창 띄우기
accountDisableBtn.addEventListener('click', () => {
    modal.classList.add('show');
    modalContent1.classList.add('show');
    modalBottom1.classList.add('show');

    modalContent2.classList.remove('show');
    modalBottom2.classList.remove('show');
});


// 두 번째 모달 창으로 이동
disableContinueBtn.addEventListener('click', () => {
    modalContent1.classList.remove('show');
    modalBottom1.classList.remove('show');

    modalContent2.classList.add('show');
    modalBottom2.classList.add('show');
});

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
    modal.classList.remove('show');
});

// 모달창 취소 버튼 기능 넣기
const cancelBtnList = document.getElementsByClassName('cancelBtn');
for(let btn of cancelBtnList) {
    btn.addEventListener('click', () => {
        modal.classList.remove('show');
    });
}

// 드롭다운
// const label = document.getElementById('label');
// const checkbox = document.getElementById('checkbox');
// const items = document.getElementsByClassName('item');

// for(let item of items) {
//     item.addEventListener('click', e => {
//         label.innerText = e.target.innerText;
//         checkbox.checked = false;
//     });
// };