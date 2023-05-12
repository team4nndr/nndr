const backBtnList = document.getElementsByClassName('back');
for(let back of backBtnList) {
    back.addEventListener('click', () => {
        window.history.back();
    });
};

// 연락처 대쉬(-) 추가
const telData = document.getElementById('telData');
telData.innerText = telData.innerText.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);