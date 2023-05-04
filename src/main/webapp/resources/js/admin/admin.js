const backBtnList = document.getElementsByClassName('back');
for(let back of backBtnList) {
    back.addEventListener('click', () => {
        window.history.back();
    });
};

const prevPage = document.querySelector('.prev-page').addEventListener('click', (e) => {
    // 이전 페이지로 이동
    // 현재 1 페이지일 경우 비활성화
});
const nextPage = document.querySelector('.next-page').addEventListener('click', (e) => {
    // 다음 페이지로 이동
    // 현재 마지막 페이지일 경우 비활성화
});