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

// 모달창 취소 버튼 기능 넣기
const cancelBtnList = document.getElementsByClassName('cancelBtn');
for(let btn of cancelBtnList) {
    btn.addEventListener('click', () => {
        modal.classList.remove('show');
    });
}

// 드롭다운
const dropdown = document.querySelector('.dropdown');
const dropdownBtn = dropdown.querySelector('.button');
const dropdownListWrap = dropdown.querySelector('.list-wrap');
const dropdownLists = dropdownListWrap.querySelectorAll('li');

// 초기 버튼 설정
if(dropdown != null) {
    for(let li of dropdownLists) {
        if(!li.querySelector('img:first-child').classList.contains('hidden')){
            const span = li.querySelector('span').innerText;
            dropdownBtn.querySelector('span').innerText = span;

            const img = li.querySelector('.img').getAttribute("src");
            dropdownBtn.querySelector('.img').setAttribute("src", img);
        }
    }
}

// 드롭다운 버튼 클릭 시 메뉴 전시
dropdownBtn.addEventListener('click', e => {
    e.target.classList.toggle('clicked');
    dropdownListWrap.classList.toggle('hidden');
});

// 드롭다운 외부 클릭 시 메뉴 닫기
document.querySelector("body").addEventListener("click", e => {
    if(e.target.className != e.target.querySelector(".dropdown").className) {
        dropdownListWrap.classList.add('hidden');
        dropdownBtn.classList.remove('clicked');
    }
})

// 드롭다운 메뉴 선택
for(let li of dropdownLists) {
    li.addEventListener('click', e => {

        fetch("/setting/change/set?key=SET_FEED_AUTH&value=" + li.getAttribute("value"))
        .then(resp => resp.text())
        .then(result => {
            if(result > 0) {
                const span = li.querySelector('span').innerText;
                dropdownBtn.querySelector('span').innerText = span;

                const img = li.querySelector('.img').getAttribute("src");
                dropdownBtn.querySelector('.img').setAttribute("src", img);
                
                for(let i=0; i<dropdownLists.length; i++) {
                    dropdownLists[i].querySelector('img:first-child').classList.add('hidden');
                }

                li.querySelector('img:first-child').classList.remove('hidden');
                dropdownListWrap.classList.add('hidden');
                dropdownBtn.classList.remove('clicked');
            } else {
                alert('설정 변경 실패');
            }
        })
    });
}

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