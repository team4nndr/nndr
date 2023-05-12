
// document.getElementById("info-modal").style.display="block";
// document.getElementById("info-modali").style.display="block";

/* 모달창 확인 */
const think = document.getElementById("think");

think.addEventListener("click",()=>{

    document.getElementById("myContent").style.display="block";
    document.getElementById("myContent-modal").style.display="block";

});

document.getElementById("myContent").addEventListener("click", () => {
    document.getElementById("myContent").style.display="none";
    document.getElementById("myContent-modal").style.display="none";
});


/* 모달창 열어서 취소버튼을 눌렀을 때도 원래로 */

const cancelBtn = document.getElementById("cancelBtn");

cancelBtn.addEventListener("click", ()=>{
    document.getElementById("myContent").style.display="none";
    document.getElementById("myContent-modal").style.display="none";

});

// 사진 버튼 눌렀을 때 모달창 사진 탭으로 이동
document.getElementById("imgBtn").addEventListener("click",() => {
    document.getElementById("myContent").style.display="block";
    document.getElementById("myContent-modal").style.display="block";
    // 포커스 추가

});








