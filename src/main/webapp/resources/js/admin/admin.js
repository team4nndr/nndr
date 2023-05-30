// 검색조건 설정
const searchInput = document.querySelector('.search_box > input');

// 필터링 드롭다운 메뉴 관련 요소
const checkbox  = document.getElementById('checkbox');
const checkboxLabelText = document.querySelector('#checkboxLabel > span');
const listboxBtns = document.querySelectorAll('#listbox .list');
const hiddenInput = document.querySelector('#checkboxLabel > input');

const iconUp = hiddenInput.nextElementSibling;
const iconDown = iconUp.nextElementSibling;

// 드롭다운 메뉴 숨겨놓기
for(btn of listboxBtns) {
    btn.addEventListener('click', e => {
        hiddenInput.value = e.target.innerText;
        checkboxLabelText.innerText = e.target.innerText;
        checkbox.checked = false;

        iconUp.classList.remove("hidden");
        iconDown.classList.add("hidden");
    });
}

// 필터링 드롭다운 메뉴 클릭 시 메뉴 출력/숨김 토글
checkbox.addEventListener('click', e => {
    
    if(checkbox.checked) {
        iconDown.classList.remove("hidden");
        iconUp.classList.add("hidden");
    } else {
        iconUp.classList.remove("hidden");
        iconDown.classList.add("hidden");
    }
});

// 이전 검색 기록 남겨놓기
(()=>{
    const params = new URL(location.href).searchParams;

    const query = params.get("query");
    const op = params.get("op");

    if(query != null || op != null) { // 검색을 했을 때
        searchInput.value = query; // 검색어를 화면에 출력
        
        for(let btn of listboxBtns) {
            if(btn.innerText == op) {
                btn.selected = true;
                checkboxLabelText.innerText = op;
                hiddenInput.value = op;
            }
        }
    }
})();

// 검색어 입력 없이 제출된 경우 현재 게시판 1페이지로 이동
document.querySelector('.search_wrap').addEventListener('submit', e => {
    if(searchInput.value.trim().length == 0 && hiddenInput.length == 0) {
        e.preventDefault();

        location.href = location.pathname; 
    }
});