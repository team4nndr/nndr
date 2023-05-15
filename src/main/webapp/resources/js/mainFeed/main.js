
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
    document.querySelector("textarea").value="";
   
    

    


});

// 사진 버튼 눌렀을 때 모달창 사진 탭으로 이동
document.getElementById("imgBtn").addEventListener("click",() => {
    document.getElementById("myContent").style.display="block";
    document.getElementById("myContent-modal").style.display="block";
    // 포커스 추가

});


// 일단 해보고 수정해보자
// 플러스 버튼을 눌렀을 때 이미지 창 생성
const addImg = document.getElementById("plusLogo");
var result = 0;


    

    addImg.addEventListener("click",()=>{

        const imgBox = document.getElementById("imgBox1");
        const num = document.getElementById("num");
        
        if(result <4){

            const div = document.createElement("div");
            const label = document.createElement("label");
            const img = document.createElement("img"); // label 자식 요소추가
            const input = document.createElement("input");
            const span = document.createElement("span");
            
            
        
            
            label.setAttribute("for","img2")
            input.setAttribute("type","file");
            
            div.classList.add("boardImg");
            img.classList.add("preview");
            input.classList.add("inputImage");
            span.classList.add("delete-image");
            span.innerHTML = "&times;";
            
            label.append(img);
            
            div.prepend(label);
            div.append(input);
            div.append(span);
            
            num.after(div);
        }
        result++;
        if(document.getElementsByClassName("boardImg").length>5){
            alert("5개까지 추가할 수 있습니다");
        return;
        }

            
        
            
        
    })

















