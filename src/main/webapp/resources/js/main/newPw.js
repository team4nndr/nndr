// 비밀번호 변경 제출 시
const changePwFrm = document.getElementById("changePwFrm");

const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");

if (changePwFrm != null) { // 비밀번호 변경 페이지인 경우

    changePwFrm.addEventListener("submit", e => {

        //  비밀번호 미작성 시
        if (newPw.value.trim() == "") {
            alert("비밀번호를 입력해주세요");
            e.preventDefault();
            newPw.focus();
            return;
        }
        // 비번 유효성 검사 
        const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;

        if (!regEx.test(newPw.value)) {
            alert("비밀번호가 유효하지 않습니다");
            newPw.style.border = "2px solid red";
            e.preventDefault();
            newPw.focus();
            return;
        }


        // 비번 == 비번 확인
        if (newPw.value != newPwConfirm.value) {
            alert("비밀번호가 일치하지 않습니다");
            newPwConfirm.style.border = "2px solid red";
            e.preventDefault();
            newPwConfirm.focus();
            return;
        }

    });
}

// 의견 전송 완료 후 창 닫으면 설정 > 일반 화면으로 이동
var cancel = document.getElementById('cancel');
if(cancel != null) {
    cancel.addEventListener('click', () => {
        location.href = "/main/forgetPw";
    });
}

// footer의 메인페이지 이동 
var mainPageGo = document.getElementById('mainPageGo');
var loginGo   = document.getElementById('loginGo');

mainPageGo.addEventListener('click', () => {
    location.href = "/";
});

loginGo.addEventListener('click', () => {
    location.href = "/";
});

