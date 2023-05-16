// 뒤로가기
const backBtnList = document.getElementsByClassName('back');
for(let back of backBtnList) {
    back.addEventListener('click', () => {
        window.history.back();
    });
};

// 연락처 대쉬(-) 추가
const telData = document.getElementById('telData');
if( telData != null ) {
    telData.innerText = telData.innerText.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

// 버튼 출력 초기화
const btns = document.getElementById('bottom').children;
for(let btn of btns) {
    if(!btn.classList.contains(memberCode)) {
        btn.classList.add('hidden');
    }
}

// 계정 상태에 따른 버튼 출력 변경
function btnChange(memberCode) {
    for(let btn of btns) {
        if(!btn.classList.contains(memberCode)) {
            btn.classList.add('hidden');
        } else {
            btn.classList.remove('hidden');
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
            document.querySelector('.account .date').innerText
                = "(비활성화 일시 : " + disableDate + ")";
            memberCode = 'B'; // 계정 상태 동기화
            btnChange(memberCode); // 출력 버튼 변경

            if(disableDate != null) 
                alert('비활성화 처리 되었습니다.');
            else
                alert('비활성화 처리 실패');
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
            document.querySelector('.account .date').innerText = "";
            memberCode = 'N'; // 계정 상태 동기화
            btnChange(memberCode); // 출력 버튼 변경

            if(result > 0) 
                alert('계정이 정상적으로 복구되었습니다.');
            else
                alert('계정 복구 실패');
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
            document.querySelector('.account .date').innerText
                = "(삭제 일시 : " + deleteDate + ")";
            memberCode = 'D'; // 계정 상태 동기화
            btnChange(memberCode); // 출력 버튼 변경

            if(deleteDate != null) 
                alert('계정이 삭제되었습니다.');
            else
                alert('계정 삭제 실패');
        })
        .catch(e => console.log(e));
    });
}

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////feedback_detail/////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

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
const backBtns = document.querySelectorAll('#feedbackContent .back');
for(let btn of backBtns) {
    const cp = window.location.search.split("=")[1];
    btn.addEventListener("click", () => {
        if(cp != undefined) {
            location.href = "/admin/feedback?cp=" + cp;
        }
    });
}
