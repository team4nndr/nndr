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

// 비활성 버튼
const disableBtn = document.getElementById('disableBtn'); 
if( disableBtn != null ) {
    disableBtn.addEventListener('click', e => {
        if(!confirm("해당 계정을 비활성화 하시겠습니까?")) return;

        fetch(memberNo + "/disable")
        .then(resp => resp.text())
        .then(disableDate => {
            document.querySelector('.account .date').innerText
                = "(비활성화 일시 : " + disableDate + ")";
        })
        .catch(e => console.log(e));

        alert('비활성화 처리 되었습니다.');
    });
}

// 비활성 해제 버튼
const enableBtn = document.getElementById('enableBtn'); 
if( enableBtn != null ) {
    enableBtn.addEventListener('click', e => {
        fetch("/enable?memberNo=" + memberNo)
        .then(resp => resp.text())
        .then(returnCode => {
            memberCode = returnCode;
        })
        .catch(e => console.log(e));
    });
}

// 계정 복구 버튼
const recoverBtn = document.getElementById('recoverBtn');
if( recoverBtn != null ) {
    recoverBtn.addEventListener('click', e => {
        if(memberCode != "D" || !confirm("정말로 삭제하시겠습니까?")) return;

        fetch(memberNo + "/recover?memberCode=" + memberCode)
        .then(resp => resp.text())
        .then(returnCode => {
            memberCode = returnCode;
            if(memberCode == "D") { // 삭제된 계정일 때
                enableBtn.innerText = "유저 비활성";
                enableBtn.disabled = true;

                recoverBtn.classList.remove('alert');
                recoverBtn.innerText = "계정 복구";
                alert("삭제 처리 되었습니다.");
            } else {
                recoverBtn.classList.add('alert');
                recoverBtn.innerText = "계정 삭제";
                alert("계정이 복구되었습니다.");
            }
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
const backBtns = document.querySelectorAll('#content .back');
for(let btn of backBtns) {
    const cp = window.location.search.split("=")[1];
    btn.addEventListener("click", () => {
        location.href = "/admin/feedback?cp=" + cp;
    });
}
