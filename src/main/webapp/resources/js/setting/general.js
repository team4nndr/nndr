// 수정 마우스오버 시 연필 모양 이미지 출력
const pencilImageList = document.querySelectorAll('.mod > img');
for(let img of pencilImageList) {
    img.style.display = 'none';
    img.nextElementSibling.addEventListener('mouseover', () => {
        img.style.display = 'inline-block';
    });
    img.nextElementSibling.addEventListener('mouseout', () => {
        img.style.display = 'none';
    });
}

const modTextList = document.getElementsByClassName('mod-text');
const saveTextList = document.getElementsByClassName('save-text');
const infoPrintList = document.querySelectorAll('.row > .info-print');
const infoInputList = document.querySelectorAll('.row > .info-input');

// 수정 클릭 시 해당 요소 input으로 변경
for(let i=0; i<modTextList.length; i++) {
    modTextList[i].addEventListener('click', () => {
        modTextList[i].style.display = 'none';
        saveTextList[i].style.display = 'inline-block';
        infoPrintList[i].style.display = 'none';
        infoInputList[i].style.display = 'inline-block';
    });
}

// 저장 클릭 시 해당 input요소 숨기고 제출
for(let i=0; i<saveTextList.length; i++) {
    saveTextList[i].style.display = 'none';
    saveTextList[i].addEventListener('click', () => {
        modTextList[i].style.display = 'inline-block';
        saveTextList[i].style.display = 'none';

        infoPrintList[i].style.display = 'inline-block';
        infoInputList[i].style.display = 'none';
    });
}

/********* 비밀번호 수정 *********/
const passwd = document.querySelector('.row.mod.passwd');
const currentPw = document.getElementById('currentPw');
const newPw = document.getElementById('newPw');
const newPwConfirm = document.getElementById('newPwConfirm');
const pwSubmitBtn = document.querySelector('.passwd > .submit');
const pwCloseBtn = document.querySelector('.passwd > .close');

pwSubmitBtn.addEventListener('click', e => {

    // 현재 비밀번호 미작성 시
    if(currentPw.value.trim() == "") {
        alert("현재 비밀번호를 입력해주세요.");
        e.preventDefault();
        currentPw.focus();
        return;
    }

    // 비밀번호 유효성 검사
    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;
    if(!regEx.test(newPw.value)) {
        alert("비밀번호가 유효하지 않습니다.");
        e.preventDefault();
        newPw.focus();
        return;
    }

    // 비밀번호 == 비밀번호 확인
    if(newPw.value != newPwConfirm.value) {
        alert("비밀번호가 일치하지 않습니다.");
        e.preventDefault();
        newPwConfirm.focus();
        return;
    }

    // 현재 비밀번호 체크
    fetch("/setting/checkPasswd", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : currentPw.value
    })
    .then(resp => resp.text())
    .then(result => {
        if(result == "false") {
            alert(result + " 현재 비밀번호가 일치하지 않습니다.");
        } else {

            // 비밀번호 수정
            fetch("/setting/change/passwd", {
                method : "POST",
                headers : {"Content-Type" : "application/json"},
                body : newPw.value
            })
            .then(resp => resp.text())
            .then(result => {
                if(result > 0) { // 화면 최신화
                    passwd.classList.add('hidden');
                    passwd.previousElementSibling.classList.remove('hidden');
                    alert("정상적으로 수정되었습니다.");
                }else{
                    alert("수정 실패");
                }
            })
            .catch(e => console.log(e));

            // 수정 완료 후 수정 화면 닫기 + input 내용 삭제
            document.querySelector('.row.mod.passwd').classList.add('hidden');
            document.querySelector('.row.passwd').classList.remove('hidden');
            currentPw.value = newPw.value = newPwConfirm.value = "";
        }
    })
    .catch(e => console.log(e));
});

// 닫기버튼 클릭 시 input 내용 삭제
pwCloseBtn.addEventListener('click', e => {
    document.querySelector('.row.mod.passwd').classList.add('hidden');
    document.querySelector('.row.passwd').classList.remove('hidden');
    currentPw.value = newPw.value = newPwConfirm.value = "";
});



/********* 성별 수정 *********/
const gender = document.querySelector('.row.mod.gender');
gender.querySelector('.submit').addEventListener('click', e => {
    let checkedGender = document.querySelector('[name="gender"]:checked').value;

    fetch("/setting/change/info?k=gender&v=" + checkedGender)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0) { // 화면 최신화
            gender.classList.add('hidden');
            gender.previousElementSibling.classList.remove('hidden');
            if(checkedGender == "없음") checkedGender = "선택하지 않음";
            gender.previousElementSibling.querySelector('.info-print').innerText = checkedGender;
            alert("정상적으로 수정되었습니다.");
        }else{
            alert("수정 실패");
        }
    })
    .catch(e => console.log(e));
});

// 닫기 버튼 클릭 시 성별 선택 초기화
gender.querySelector('.close').addEventListener('click', e => {
    if(infoGender == '남') {
        document.getElementById("genderMale").checked = true;
    } else if(infoGender == '여') {
        document.getElementById("genderFemale").checked = true;
    } else {
        document.getElementById("genderNone").checked = true;
    }
});



/********* 주소 수정 *********/
const address = document.querySelector('.row.mod.address');
address.querySelector('.submit').addEventListener('click', e => {
    let newAddress = address.querySelector('.mod-input').value;
    
    fetch("/setting/change/info?k=addr&v=" + newAddress)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0) { // 화면 최신화
            address.classList.add('hidden');
            address.previousElementSibling.classList.remove('hidden');
            address.previousElementSibling.querySelector('.info-print').innerText = newAddress;
            alert("정상적으로 수정되었습니다.");
        }else{
            alert("수정 실패");
        }
    })
    .catch(e => console.log(e));
});

// 닫기 버튼 클릭 시 주소 input 내용 초기화
address.querySelector('.close').addEventListener('click', e => {
    address.querySelector('.mod-input').value = infoResidence;
});


/********* 연락처 수정 *********/
const tel = document.querySelector('.row.mod.tel');
const telInput = tel.querySelector('.mod-input');
const telMessage = tel.querySelector('.mod-message');
tel.querySelector('.submit').addEventListener('click', e => {

    fetch("/setting/change/info?k=tel&v=" + telInput.value)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0) { // 화면 최신화
            tel.classList.add('hidden');
            tel.previousElementSibling.classList.remove('hidden');
            const newTel = telFormmater(telInput.value);
            tel.previousElementSibling.querySelector('.info-print').innerText = newTel;
            alert("정상적으로 수정되었습니다.");
        }else{
            alert("수정 실패");
        }
    })
    .catch(e => console.log(e));
});

// 닫기 버튼 클릭 시 연락처 input 내용 초기화
tel.querySelector('.close').addEventListener('click', e => {
    telInput.value = memberTel;
    telMessage.innerText = "";
});

// 연락처 입력 유효성 검사
telInput.addEventListener("input", () => {
    // 정규 표현식으로 유효성 검사
    const regEx = /^0(1[01679]|2|[3-6][1-5]|70)[1-9]\d{3,4}\d{4}$/;
    if(regEx.test(telInput.value)) { // 유효
        telMessage.innerText = "유효한 입력입니다.";
        telMessage.style.color = "green";
    } else { // 무효
        telMessage.innerText = "유효하지 않은 입력입니다.";
        telMessage.style.color = "red";
    }
});

// 연락처 대쉬(-) 추가
function telFormmater(tel) {
    return tel.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}
telData.innerText = telFormmater(telData.innerText); // 화면 최초 렌더링 시 실행
// const telData = document.getElementById('telData');
// telData.innerText = telData.innerText.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);



/********* 정보 수정 공통코드 *********/
// 수정버튼 클릭 시 수정 화면 출력
const modButtons = document.querySelectorAll('.mod-button.mod');
for(let btn of modButtons) {
    btn.addEventListener('click', e => {
        const parent = e.target.parentElement;
        parent.classList.add('hidden');
        parent.nextElementSibling.classList.remove('hidden');
    });
}

// 수정 취소 시 수정 화면 닫기
const modCancelButtons = document.querySelectorAll('.mod-button:not(.mod).close');
for(let btn of modCancelButtons) {
    btn.addEventListener('click', e => {
        const parent = e.target.parentElement;
        parent.previousElementSibling.classList.remove('hidden');
        parent.classList.add('hidden');
    });
}

// // 성별 수정 화면에서 현재 성별 선택해서 출력
// // const infoGender 미리 선언 : "남", "여", "없음"
// if(infoGender == '남') {
//     document.getElementById("genderMale").checked = true;
// } else if(infoGender == '여') {
//     document.getElementById("genderFemale").checked = true;
// } else {
//     document.getElementById("genderNone").checked = true;
// }