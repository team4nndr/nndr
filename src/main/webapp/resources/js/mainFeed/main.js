
// document.getElementById("info-modal").style.display="block";
// document.getElementById("info-modali").style.display="block";

/* 모달창 확인 */
const newFeedBtn = document.getElementById("newFeedBtn");
if(newFeedBtn != null) {
    newFeedBtn.addEventListener("click",()=>{
        document.getElementById("myContent").style.display="block";
        document.getElementById("myContent-modal").style.display="block";
    });
}

const myContent = document.getElementById("myContent");
if(myContent != null) {
    myContent.addEventListener("click", () => {
        document.getElementById("myContent").style.display="none";
        document.getElementById("myContent-modal").style.display="none";
    });
}


/* 모달창 열어서 취소버튼을 눌렀을 때도 원래로 */

const cancelBtn = document.getElementById("cancelBtn");
if(cancelBtn != null) {
    cancelBtn.addEventListener("click", ()=>{
        document.getElementById("myContent").style.display="none";
        document.getElementById("myContent-modal").style.display="none";
        document.querySelector("textarea").value="";
    });
}

// 사진 버튼 눌렀을 때 모달창 사진 탭으로 이동
const imgBtn = document.getElementById("imgBtn");
if(imgBtn != null) {
    imgBtn.addEventListener("click",() => {
        document.getElementById("myContent").style.display="block";
        document.getElementById("myContent-modal").style.display="block";
        // 포커스 추가

    });
}


// 일단 해보고 수정해보자
// 플러스 버튼을 눌렀을 때 이미지 창 생성
// const addImg = document.getElementById("plusLogo");
// var result = 0;


    

//     addImg.addEventListener("click",()=>{

//         const imgBox = document.getElementById("imgBox1");
//         const num = document.getElementById("num");
//         let a = 1;
//         if(result <4){

//             const div = document.createElement("div");
//             const label = document.createElement("label");
//             const img = document.createElement("img"); // label 자식 요소추가
//             const input = document.createElement("input");
//             const span = document.createElement("span");
            
            
        
            
//             label.setAttribute("for","img1")
//             input.setAttribute("type","file","name","images","id","img+'a++'","accept","image/*")
            

            
//             div.classList.add("boardImg");
//             img.classList.add("preview");
//             input.classList.add("inputImage");
//             span.classList.add("delete-image");
//             span.innerHTML = "&times;";
            
//             label.append(img);
            
//             div.prepend(label);
//             div.append(input);
//             div.append(span);
            
//             num.after(div);
//         }
//         result++;
//         if(document.getElementsByClassName("boardImg").length>5){
//             alert("5개까지 추가할 수 있습니다");
//         return;
//         }

            
        
            
        
//     })


    // 게시글 등록 JS
// 미리보기 관련 요소 모두 얻어오기

// img 5개
const preview = document.getElementsByClassName("preview"); 
// file 5개
const inputImage = document.getElementsByClassName("inputImage");

// x버튼 5개
const deleteImage = document.getElementsByClassName("delete-image");

for(let i =0; i < inputImage.length; i++){

    // 파일이 선택 되거나 선택 후 취소 되었을 때
    inputImage[i].addEventListener("change", e => {

        const file = e.target.files[0];

         // 선택된 파일의 데이터
        if(file != undefined){

        const reader = new FileReader(); // 파일을 읽는 객체
            reader.readAsDataURL(file);
            // 지정된 파일을 읽은 후 result 변수에 URL형식으로 저장

            reader.onload = e=>{ // 파일을 다 읽은 후 수행
                preview[i].setAttribute("src",e.target.result);
            }

        }else{ // 선택후 취소 되었을 떄

            preview[i].removeAttribute("src");

        }

        // 미리보기 삭제 버튼(X버튼)
        deleteImage[i].addEventListener("click", ()=>{
            if(preview[i].getAttribute("src")!=""){
                
                // 미리보기 삭제
                preview[i].removeAttribute("src");

                // input type="file" 태그의 value 삭제
                inputImage[i].value="";

            };

        })

    });


}


// 컨텐츠가 비었을때
const boardWriteFrm = document.querySelector("#boardWriteFrm");
const boardContent = document.querySelector("[name='boardText']");

boardWriteFrm.addEventListener("submit", e=>{
    if(boardContent.value.trim().length==0){
    
        
        alert("내용을 입력해주세요")
        boardContent.value="";
        boardContent.focus();
        e.preventDefault();
    }
    return;


});

// 게시글 더보기 버튼 

const detailBtnList = document.querySelectorAll(".detailBtn");
const feedHiddenList = document.querySelectorAll(".feedContain");


detailBtnList.forEach(detailBtn => {
    feedHiddenList.forEach(feedHidden=>{
    
        detailBtn.addEventListener("click", e => {
            e.stopPropagation();
            feedHidden.classList.toggle("hidden");
        });

        feedHidden.addEventListener("click", e => {
            e.stopPropagation();
        });
    })
})

/* 
detailBtn.addEventListener("click", e => {
    e.stopPropagation();
    feedHidden.classList.toggle("hidden");
});
feedHidden.addEventListener("click", e => {
    e.stopPropagation();
}); */

// 게시물 삭제버튼을 누르면 삭제가 되게
const feedDeleteList = document.querySelectorAll(".feedDelete");

feedDeleteList.forEach(feedDelete => {
    feedDelete.addEventListener("click", e => {
        if( confirm("정말 삭제하시겠습니까?") ) {
            location.href = "/mainFeed/delete?boardNo=" + e.currentTarget.getAttribute("data");
        }
    });
})

// feedUpdate버튼을 누른다면 수정버튼이 나올 수 있도록!
