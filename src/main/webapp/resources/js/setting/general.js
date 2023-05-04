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
document.querySelector('.passwd > .submit').addEventListener('click', e => {
    // ajax로 구현
    alert("정상적으로 수정되었습니다.");
}); 

/********* 성별 수정 *********/
document.querySelector('.gender > .submit').addEventListener('click', e => {
    // ajax로 구현
    alert("정상적으로 수정되었습니다.");
});

/********* 주소 수정 *********/
document.querySelector('.address > .submit').addEventListener('click', e => {
    // ajax로 구현
    alert("정상적으로 수정되었습니다.");
});

/********* 연락처 수정 *********/
document.querySelector('.tel > .submit').addEventListener('click', e => {
    // ajax로 구현
    alert("정상적으로 수정되었습니다.");
});

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

// 수정 취소 & 수정내용 전송 시 input 비우기 & 수정 화면 닫기
const modEndButtons = document.querySelectorAll('.mod-button:not(.mod)');
for(let btn of modEndButtons) {
    btn.addEventListener('click', e => {
        const parent = e.target.parentElement;
        parent.previousElementSibling.classList.remove('hidden');
        parent.classList.add('hidden');

        // 해당 수정 창에 있는 input 비우기
        const inputs = parent.getElementsByClassName('mod-input');
        for(let input of inputs) {
            input.value = "";
        }
    });
}