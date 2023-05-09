const backBtnList = document.getElementsByClassName('back');
for(let back of backBtnList) {
    back.addEventListener('click', () => {
        window.history.back();
    });
};