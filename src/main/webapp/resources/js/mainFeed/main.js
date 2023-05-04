
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
})
document.getElementById("info-cancel").addEventListener("click", () => {
    document.getElementById("info-modal").style.display="none";
    document.getElementById("info-modali").style.display="none";
})
document.getElementById("info-confirm").addEventListener("click", () => {
    document.getElementById("info-modal").style.display="none";
    document.getElementById("info-modali").style.display="none";



})



