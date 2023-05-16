// // 뒤로가기
// const backBtnList = document.getElementsByClassName('back');
// for(let back of backBtnList) {
//     back.addEventListener('click', () => {
//         window.history.back();
//     });
// };

// 연락처 대쉬(-) 추가
const telData = document.getElementById('telData');
if( telData != null ) {
    telData.innerText = telData.innerText.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

// 버튼 출력 초기화
const bottom = document.getElementById('bottom');
if(bottom != null) {
    for(let btn of bottom.children) {
        if(!btn.classList.contains(memberCode)) {
            btn.classList.add('hidden');
        }
    }
}

// 계정 상태에 따른 버튼 출력 변경
function btnChange() {
    const btns = bottom.children;

    for(let btn of btns) {
        if(!btn.classList.contains(memberCode)) {
            btn.classList.add('hidden'); 
        } else {
            btn.classList.remove('hidden');
        }
    }
}

// 계정 상태 태그 초기화
const labels = document.getElementsByClassName('account-label');
if(labels != null) {
    for(let label of labels) {
        if(!label.classList.contains(memberCode)) {
            label.classList.add('hidden');
        }
    }
}

// 계정 상태에 따른 태그 출력 변경
function labelChange() {
    for(let label of labels) {
        if(!label.classList.contains(memberCode)) {
            label.classList.add('hidden'); 
        } else {
            label.classList.remove('hidden');
        }
    }
}

// 계정 비활성 버튼(disable-btn)
const disableBtns = document.getElementsByClassName('disable-btn');
for(let btn of disableBtns) {
    btn.addEventListener('click', e => {
        if(!confirm("해당 계정을 비활성화 하시겠습니까?")) return;

        fetch(memberNo + "/disable")
        .then(resp => resp.text())
        .then(disableDate => {
            if(disableDate != null) {
                memberCode = 'B'; // 계정 상태 동기화
                document.querySelector('.account > .date.B').innerText
                    = "(비활성화 일시 : " + disableDate + ")";
                btnChange(); // 출력 버튼 변경
                labelChange(); // 계정 상태 태그 변경
                alert('비활성화 처리 되었습니다.');
            } else {
                alert('비활성화 처리 실패');
            }
        })
        .catch(e => console.log(e));
    });
}

// if( disableBtn != null ) {
//     disableBtn.addEventListener('click', e => {
//         if(!confirm("해당 계정을 비활성화 하시겠습니까?")) return;

//         fetch(memberNo + "/disable")
//         .then(resp => resp.text())
//         .then(disableDate => {
//             document.querySelector('.account .date').innerText
//                 = "(비활성화 일시 : " + disableDate + ")";
//         })
//         .catch(e => console.log(e));

//         alert('비활성화 처리 되었습니다.');
//     });
// }

// 비활성 해제 / 복구 버튼
const enableBtns = document.getElementsByClassName('enable-btn');
for(let btn of enableBtns) {
    btn.addEventListener('click', e => {
        if(memberCode == 'B' && !confirm("해당 계정을 활성화 하시겠습니까?")) return;
        if(memberCode == 'D' && !confirm("해당 계정을 복구하시겠습니까?")) return;

        fetch(memberNo + "/enable")
        .then(resp => resp.text())
        .then(result => {
            if(result > 0)  {
                memberCode = 'N'; // 계정 상태 동기화
                for(let date of document.querySelectorAll('.account > .date')) {
                    date.innerText = "";
                }
                btnChange(); // 출력 버튼 변경
                labelChange(); // 계정 상태 태그 변경
                alert('계정이 정상적으로 복구되었습니다.');
            } else {
                alert('계정 복구 실패');
            }
        })
        .catch(e => console.log(e));
    });
}

// const enableBtn = document.getElementById('enableBtn'); 
// if( enableBtn != null ) {
//     enableBtn.addEventListener('click', e => {
//         fetch("/enable?memberNo=" + memberNo)
//         .then(resp => resp.text())
//         .then(returnCode => {
//             memberCode = returnCode;
//         })
//         .catch(e => console.log(e));
//     });
// }

// 계정 삭제 버튼
const deleteBtns = document.getElementsByClassName('delete-btn');
for(let btn of deleteBtns) {
    btn.addEventListener('click', e => {
        if(!confirm("정말로 삭제하시겠습니까?")) return;

        fetch(memberNo + "/delete")
        .then(resp => resp.text())
        .then(deleteDate => {
            if(deleteDate != null) {
                memberCode = 'D'; // 계정 상태 동기화
                document.querySelector('.account > .date.D').innerText
                    = "(삭제 일시 : " + deleteDate + ")";
                btnChange(); // 출력 버튼 변경
                labelChange(); // 계정 상태 태그 변경
                alert('계정이 삭제되었습니다.');
            } else {
                alert('계정 삭제 실패');
            }
        })
        .catch(e => console.log(e));
    });
}

// 뒤로가기, 목록으로 버튼 설정
const backBtns = document.querySelectorAll('.back');
for(let btn of backBtns) {
    const cp = window.location.search.split("=")[1];
    btn.addEventListener("click", () => {
        if(cp != undefined) {
            location.href = "/admin/user?cp=" + cp;
        }
    });
}
