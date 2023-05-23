// 비밀번호 변경 제출 시
const changePwFrm = document.getElementById("changePwFrm");

const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");

if (changePwFrm != null) { // 비밀번호 변경 페이지인 경우

    changePwFrm.addEventListener("submit", e => {

        // 현재 비밀번호 미작성 시
        if (currentPw.value.trim() == "") {
            alert("현재 비밀번호를 입력해주세요");
            e.preventDefault();
            currentPw.focus();
            return;
        }
        // 비번 유효성 검사 
        const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;

        if (!regEx.test(newPw.value)) {
            alert("비밀번호가 유효하지 않습니다");
            e.preventDefault();
            newPw.focus();
            return;
        }


        // 비번 == 비번 확인
        if (newPw.value != newPwConfirm.value) {
            alert("비밀번호가 일치하지 않습니다");
            e.preventDefault();
            newPwConfirm.focus();
            return;
        }

    });
}