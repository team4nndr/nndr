
// document.getElementById("info-modal").style.display="block";
// document.getElementById("info-modali").style.display="block";

/* 모달창 확인 */
const newFeedBtn = document.getElementById("newFeedBtn");
if (newFeedBtn != null) {
    newFeedBtn.addEventListener("click", () => {
        document.getElementById("myContent").style.display = "block";
        document.getElementById("myContent-modal").style.display = "block";
    });
}

const myContent = document.getElementById("myContent");
if (myContent != null) {
    myContent.addEventListener("click", () => {
        document.getElementById("myContent").style.display = "none";
        document.getElementById("myContent-modal").style.display = "none";
    });
}


/* 모달창 열어서 취소버튼을 눌렀을 때도 원래로 */

const cancelBtn = document.getElementById("cancelBtn");
if (cancelBtn != null) {
    cancelBtn.addEventListener("click", () => {
        document.getElementById("myContent").style.display = "none";
        document.getElementById("myContent-modal").style.display = "none";
        //document.querySelector("textarea").value="";


        const boardText = document.querySelector("[name='boardText']");
        boardText.value = "";

        const previewList = document.querySelectorAll(".preview");

        previewList.forEach((preview, i) => {
            preview.removeAttribute("src");
        });

        const inputImage1 = document.getElementsByClassName("inputImage");
        for (let image of inputImage1) {
            image.value = "";
        }

        deleteSet = new Set();

        document.getElementById("boardWriteFrm").setAttribute("action", "mainFeed")
    });
}

// 사진 버튼 눌렀을 때 모달창 사진 탭으로 이동
const imgBtn = document.getElementById("imgBtn");
if (imgBtn != null) {
    imgBtn.addEventListener("click", () => {
        document.getElementById("myContent").style.display = "block";
        document.getElementById("myContent-modal").style.display = "block";
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





// 컨텐츠가 비었을때
const boardWriteFrm = document.querySelector("#submitBtn");
const boardContent = document.querySelector("[name='boardText']");

boardWriteFrm.addEventListener("submit", e => {
    if (boardContent.value.trim().length == 0) {


        alert("내용을 입력해주세요")
        boardContent.value = "";
        boardContent.focus();
        e.preventDefault();
    }
    return;


});

// 게시글 더보기 버튼 

const detailBtnList = document.querySelectorAll(".detailBtn");
const feedHiddenList = document.querySelectorAll(".feedContain");


detailBtnList.forEach(detailBtn => {
    detailBtn.addEventListener("click", e => {
        e.stopPropagation();
        e.currentTarget.children[0].classList.toggle("hidden");
    });
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
        if (confirm("정말 삭제하시겠습니까?")) {
            location.href = "/mainFeed/delete?boardNo=" + e.currentTarget.getAttribute("data");
        }
    });
})




// feedUpdate버튼을 누른다면 수정버튼이 나올 수 있도록!
// 댓글 수정 입니다 !



// 게시글 수정 시 삭제된 이미지의 순서를 기록할 Set객체를 생성
let deleteSet; // 순서x 중복x 
// -> x 버튼 클릭 시 순서를 한 번만 저장하는 용도 

const feedUpdateList = document.querySelectorAll(".feedUpdate");

for (let feedUpdate of feedUpdateList) {
    feedUpdate.addEventListener("click", e => {
        document.getElementById("myContent").style.display = "block";
        document.getElementById("myContent-modal").style.display = "block";

        const boardNo = e.currentTarget.getAttribute("data"); // 글번호
        document.getElementById("hiddenBoardNo").value = boardNo;


        fetch("/mainFeed/selectOne?boardNo=" + boardNo)
            .then(resp => resp.json())
            .then(board => {
                console.log(board);

                const boardText = document.querySelector("[name='boardText']");
                boardText.value = board.boardText;

                const previewList = document.querySelectorAll(".preview");

                previewList.forEach((preview, i) => {

                    for (let img of board.imageList) {
                        if (img.imgOrder == i) {
                            preview.setAttribute("src", img.imgPath + img.imgReName);
                        }
                    }
                });

                deleteSet = new Set();

                document.getElementById("boardWriteFrm").setAttribute("action", "/mainFeed/update")
            })
            .catch(err => console.log(err));
        /*
                // 미리보기 관련 요소 모두 얻어오기
                
                // img 3개
                const preview1 = document.getElementsByClassName("preview"); 
                
                // file 3개
                const inputImage1 = document.getElementsByClassName("inputImage");
                
                // x버튼 3개
                const deleteImage1 = document.getElementsByClassName("delete-image");
                
                // -> 위에 얻어온 요소들의 개수가 같음 == 인덱스가 일치함
                
                
                
                
                
                
                // 컨텐츠가 비었을때
                const submit = document.querySelector("#submitBtn");
                const boardText = document.querySelector("[name='boardText']");
                
                submit.addEventListener("submit", e=>{
                    if(boardText.value.trim().length==0){
                    
                        
                        alert("내용을 입력해주세요")
                        boardText.value="";
                        boardText.focus();
                        e.preventDefault();
                    }
                    return;
                
                
                });
        
        
        */

    })
};

// 미리보기 3개
const previewList = document.querySelectorAll(".preview");

// file 3개
const inputImage1 = document.getElementsByClassName("inputImage");

// x버튼 3개
const deleteImage1 = document.getElementsByClassName("delete-image");


for (let i = 0; i < inputImage1.length; i++) {

    // 파일이 선택 되거나 선택 후 취소 되었을 때
    inputImage1[i].addEventListener("change", e => {

        const file1 = e.target.files[0];

        // 선택된 파일의 데이터
        if (file1 != undefined) {

            const reader1 = new FileReader(); // 파일을 읽는 객체
            reader1.readAsDataURL(file1);
            // 지정된 파일을 읽은 후 result 변수에 URL형식으로 저장

            reader1.onload = e => { // 파일을 다 읽은 후 수행
                previewList[i].setAttribute("src", e.target.result);

                // 이미지가 성공적으로 읽어지면
                // deleteSet에서 삭제
                deleteSet.delete(i);


            }

        } else { // 선택후 취소 되었을 떄

            previewList[i].removeAttribute("src");

        }

    });


    // 미리보기 삭제 버튼(X버튼)
    deleteImage1[i].addEventListener("click", () => {
        if (previewList[i].getAttribute("src") != "") {

            // 미리보기 삭제
            previewList[i].removeAttribute("src");

            // input type="file" 태그의 value 삭제
            inputImage1[i].value = "";

            // deleteSet에 삭제된 이미지 순서(i) 추가
            deleteSet.add(i);
        };

    })
}

// 좋아요 !
// 좋아요 버튼이 클릭 되었을 때!
const boardLikeList = document.querySelectorAll(".boardLike");


        
        for (let boardLike of boardLikeList) {
        
        
            boardLike.addEventListener("click", e => {
        
        
        
                let check; // 기존에 좋아요가 X(빈 손가락) : 00
                // 좋아요 O : 1(색칠해짐) 
        
                // contains("클래스명") : 클래스가 있으면 true, 없으면 false
                if (e.target.classList.contains("fa-regular")) { // 빈하트
                    check = 0;
                } else { // 꽉찬하트
                    check = 1;
                }
        
                // ajax로 서버로 제출할 파라미터를 모아둔 JS객체
                const data = { "boardNo": e.currentTarget.getAttribute("data"), "memberNo": loginMemberNo, "check": check };
        
                // ajax 코드 작성
                fetch("/mainFeed/like", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(data)
        
                })
        
                    .then(resp => resp.text()) // 응답 객체를 필요한 형태로 파싱
                    .then(count => {
                        console.log("count:" + count);
        
                        if (count == -1) { // insert or delete 실패시 
                            console.log("좋아요 처리 실패");
                            return;
        
                        }
                        // toggle() : 클래스가 있으면 없애고 없으면 추가하고 
                        e.target.classList.toggle("fa-regular"); // fa-bounce 눌렀을 때 바운스되게 만들어보자
                        e.target.classList.toggle("fa-solid");
                        
                        // 현재 게시글의 좋아요 수를 화면에 출력
                        //e.target.nextElementSibling.innerText=count;
                        //e.target.parentElement.parentElement.previousSibling.previousSibling.firstElementChild.innerText=count;
                        //e.target.parentElement.parentElement.
                        // console.log(e.target.parentElement.parentElement.);

                        // 알람
                        sendLikeAlram(data.boardNo);
        
                    }) // 파싱된 데이터를 받아서 처리하는 코드 작성
                    .catch(err => {
                        console.log("예외 발생");
                        console.log(err);
                    })
        
            });
        };

        


// 좋아요 클릭시 글 작성자에게 알림 발송
function sendLikeAlram(boardNo) { 
    const memberNo = document.querySelector('.reply-container.board' + boardNo)
    .parentElement.querySelector('.feed-head-info > a')
    .getAttribute('href').split('/')[2];

    // 자기 게시글일 경우 알람 발송 안함
    if(memberNo == loginMemberNo) return;

    var obj = {
        "profileImage": profileImage,
        "link": "/personalFeed/" + loginMemberNo,
        "message": loginMemberName + "님이 게시글에 좋아요를 눌렀습니다."
    }

	var alram = {
		"memberNo": memberNo,
        "alarmContent" : makeAlarm(obj),
        "type": "LIKE"
    }
	
    
	alramSock.send(JSON.stringify(alram));
}