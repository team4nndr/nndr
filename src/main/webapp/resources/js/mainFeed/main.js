
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




document.getElementById("info-cancel").addEventListener("click", () => {
    document.getElementById("info-modal").style.display="none";
    document.getElementById("info-modali").style.display="none";
})
document.getElementById("info-confirm").addEventListener("click", () => {
    document.getElementById("info-modal").style.display="none";
    document.getElementById("info-modali").style.display="none";



})




/* 취소 누르면 모달 닫힘 */

const closeBtnList = document.getElementsByClassName('close-btn');

for(let btn of closeBtnList) {
    btn.addEventListener('click', () => {
        
        document.getElementById("myContent").style.display="none";
        document.getElementById("myContent-modal").style.display="none";
        
    });
}

