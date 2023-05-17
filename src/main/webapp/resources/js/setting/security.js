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


// // 모달창 외부 클릭 시 창 닫힘
// modal.addEventListener("click", (e) => {
//     // 팝업 내부 클릭 시 동작 안함
//     if( e.clientX > modalBody.getBoundingClientRect().left 
//         && e.clientX < modalBody.getBoundingClientRect().right
//         && e.clientY > modalBody.getBoundingClientRect().top 
//         && e.clientY < modalBody.getBoundingClientRect().bottom ) {
//             return;
//     }
//     // 팝업 외부 클릭 시 팝업 닫힘
//     modal.classList.remove('show');
// });

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

// 계정 비활성화
if(disableContinueBtn != null) {
    disableContinueBtn.addEventListener('click', e => {

        fetch("disable")
        .then(resp => resp.text())
        .then(result => {
            if(result > 0) {
                // 두 번째 모달 창으로 이동
                modalContent1.classList.remove('show');
                modalBottom1.classList.remove('show');
                modalContent2.classList.add('show');
                modalBottom2.classList.add('show');
            } else {
                alert('비활성화 처리 실패');
            }
        })
        .catch(e => console.log(e));
    });
}

// 계정 비활성화 후 메인화면으로 이동
const finalBtn = document.getElementById('finalBtn');
finalBtn.addEventListener('click', () => {
    location.href = "/";
})

// 친구요청 토글 + checkbox와 연동
// const setFriendReqCheckbox = document.getElementById('setFriendReqCheckbox');
// const setFriendReqToggle = document.getElementById('setFriendReqToggle');
// setFriendReqToggle.addEventListener('click', () => {
//     setFriendReqCheckbox.toggleAttribute("checked");
// });
// const setFriendReq = document.getElementById('setFriendReq');
// setFriendReq.addEventListener("click", e => {
//     setFriendReq.classList.toggle("checked");
    
//     const key = e.target.getAttribute("key");
//     let value = setFriendReq.classList.contains('checked') ? 'Y' : 'N';

//     fetch("changeSetting?key=" + key + "&value=" + value)
//     .then(resp => resp.text())
//     .then(result => {
//         if(result == 0) {
//             alert('설정 변경 실패');
//         }
//     })
//     .catch(e => console.log(e));
// });