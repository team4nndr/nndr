

// 열기 버튼
const openBtn = document.getElementById('openBtn');

// 닫기 버튼
const closeBtn = document.getElementById('closeBtn');

// modal 창
const modal = document.getElementById('modal');

// nav 요소
// const nav = document.querySelector('nav');

// 새 계정만들기 버튼을 누르면 display = flex로 보이기
openBtn.addEventListener("click", () => {
    modal.style.display = "flex";
});

// 닫기 버튼을 누르면 nav의 display가 none으로 변경
remove.addEventListener("click", function () {
    modal.style.display = "none";
});
