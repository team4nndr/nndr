function info(num){
    const infoList = document.getElementById("main-info").children;
    for(var n=0; n<7; n++){
    infoList[n].style.display = "none";
    }
    switch (num) {
        case 0:
            document.getElementsByClassName("info-experience-1")[0].style.display="block"
            break;
        case 1:
            document.getElementsByClassName("info-experience-2")[0].style.display="block"
            break;
        case 2:
            document.getElementsByClassName("info-experience-3")[0].style.display="block"
            break;
        case 3:
            document.getElementsByClassName("info-experience-4")[0].style.display="block"
            break;
        case 4:
            document.getElementsByClassName("info-experience-5")[0].style.display="block"
            break;
        case 5:
            document.getElementsByClassName("info-experience-6")[0].style.display="block"
            break;
        case 6:
            document.getElementsByClassName("info-experience-7")[0].style.display="block"
            break;
        default:
            break;
    }
}

function infoMy(){
    const intro = document.getElementById("intro-my");
    const introArea = document.getElementById("input-intro");
    intro.style.display = "none";
    introArea.style.display = "block";
}

function infoCan(){
    const introArea = document.getElementById("input-intro");
    const intro = document.getElementById("intro-my");
    introArea.style.display = "none";
    intro.style.display = "block";
}

if(document.getElementById("intro-save")!=null){
    document.getElementById("intro-save").addEventListener("click", ()=>{
        if(document.getElementById("intro-text").value.length<100){
            const introArea = document.getElementById("input-intro");
            const intro = document.getElementById("intro-my");
            intro.innerText=document.getElementById("intro-text").value;
            introArea.style.display = "none";
            intro.style.display = "block";
        }else{
            alert("글자 수를 초과했습니다.")
        }
    })
}

if (document.getElementById("info-modal") != null) {
    document.getElementById("intro-text").addEventListener("input", () => {
        const strLength = document.getElementById("intro-text").value.length
        document.getElementById("texta").innerText = 100 - strLength + "자 남음";
        document.getElementById("texta").style.color = "black";

        if (100 - strLength < 0) {
            document.getElementById("texta").style.color = "red";
            document.getElementById("texta").innerText = 100 - strLength + "자 초과 ";
        }
    })
}

Array.from( document.getElementsByClassName("info-2-1")).forEach((target) => target.addEventListener("click", function(){ 
    jsSearch('test', target); 
})
);

function jsSearch(str, target){		
    
    const hobbyl = document.getElementById("what-hobby")
    document.getElementById("info-modal").style.display="block";
    document.getElementById("info-modali").style.display="block";

    hobbyl.innerText=(target.innerText).substring(4);
    hobbyl.style.fontSize="19px";
};    
if(document.getElementById("info-modal")!=null){
    document.getElementById("info-modal").addEventListener("click", () => {
    document.getElementById("info-modal").style.display="none";
    document.getElementById("info-modali").style.display="none";
    })
}
if (document.getElementById("info-cancel") != null) {
    document.getElementById("info-cancel").addEventListener("click", () => {
        document.getElementById("info-modal").style.display = "none";
        document.getElementById("info-modali").style.display = "none";
    })
}
if (document.getElementById("info-confirm") != null) {
    document.getElementById("info-confirm").addEventListener("click", () => {
        document.getElementById("info-modal").style.display = "none";
        document.getElementById("info-modali").style.display = "none";
    })
}

if(document.getElementById("hobby-checked") != null){
    document.getElementById("hobby-checked").addEventListener("click", () => {
        document.getElementById("add-hobby").removeAttribute('checked');
    })
}


    // 슬라이드
var slides = document.querySelector('.item1-3'); //전체 슬라이드 컨테이너
var slideImg = document.querySelectorAll('.who'); //모든 슬라이드들
var currentIdx = 0; //현재 슬라이드 index
var slideCount = slideImg.length; // 슬라이드 개수
var prev = document.querySelector('.prev'); //이전 버튼
var next = document.querySelector('.next'); //다음 버튼
var slideWidth = 202; //한개의 슬라이드 넓이
var slideMargin = 20; //슬라이드간의 margin 값

//전체 슬라이드 컨테이너 넓이 설정
// slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

function moveSlide(num) {
    let slideNum = 0;
    slideNum  = -num * 800;
    slides.style.left = slideNum+ 'px';
    currentIdx = num;
}
if(prev !=null){
    prev.addEventListener('click', function () {
    /*첫 번째 슬라이드로 표시 됐을때는 
    이전 버튼 눌러도 아무런 반응 없게 하기 위해 
      currentIdx !==0일때만 moveSlide 함수 불러옴 */
    if (currentIdx !== 0) moveSlide(currentIdx - 1);
    })
}

;
if (next != null) {
    next.addEventListener('click', function () {
        /* 마지막 슬라이드로 표시 됐을때는 
        다음 버튼 눌러도 아무런 반응 없게 하기 위해
        currentIdx !==slideCount - 1 일때만 
        moveSlide 함수 불러옴 */
        if (currentIdx !== slideCount - 1) {
            moveSlide(currentIdx + 1);
        }
    });
}
if (document.querySelector('.info-cancel') != null) {
    document.getElementById("info-cancel").addEventListener("click", () => {
        document.getElementById("info-modali").style.display = none;
    })
}
///////////////////////////////////////////////////////////////////// 이미지
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

const profileImage = document.getElementById("profileImage"); // img 태그
const imageInput = document.getElementById("imageInput"); // input 태그
const deleteImage = document.getElementById("deleteImage"); // x버튼
let initCheck; // 초기 프로필 이미지 상태를 저장하는 변수 false == 기본 이미지, true == 이전 업로드 이미지
let deleteCheck = -1; // 프로필 이미지가 새로 업로드 되거나 삭제 되었음을 나타내는 변수 // -1 == 초기값 , 0 == 프로필 삭제(x버튼), 1 == 새 이미지 업로드
let orginalImage; // 초기 프로필 이미지 파일 경로 저장
if(imageInput != null) { //화면에 imageInput이 있을 경우
    orginalImage = profileImage.getAttribute("src");

    // 회원 프로필 화면 진입 시 현재 회원의 프로필 이미지 상태를 확인
    if(profileImage.getAttribute("src")=="/resources/images/user.png"){
        // 기본 이미지인 경우
        initCheck = false;
    } else {
        initCheck = true;
    }


    // change 이벤트 : 값이 변했을 때
    // - input type="file", "checkbox", "radio" 에서 많이 사용
    // - text/number 형식 사용 가능
    // == > 이 때 input값 입력 후 포커스를 잃었을 때 이전 값과 다르면 change 이벤트 발생

    imageInput.addEventListener("change", e => {

        // 2MB 최대 크기 제한
        const maxSize = 1*1024*1024*2 ; // 파일 크기 지정(바이트 단위)

        console.log(e.target); // 
        console.log(e.target.value); // 업로드된 파일 경로
        console.log(e.target.files);  // 업로드된 파일의 정보가 담긴 배열

        const file = e.target.files[0]; // 업로드한 파일의 정보가 담긴 객체


        
    



        // 파일을 한번 선택한 후 취소했을 때
        if (file ==undefined) {
            console.log("파일 선택이 취소됨");
            deleteCheck = -1;
            profileImage.setAttribute("src", orginalImage);
            return;
        }
        
        
        if(file.size > maxSize) { // 선택된 파일의 크기가 최대 크기를 초과한 경우
            alert("2MB 이하의 이미지를 선택해주세요.")
            imageInput.value = ""; //
            deleteCheck = -1;
            // 기존 프로필 이미지로 변경
            profileImage.setAttribute("src", orginalImage);
            return; 
            // input type="file" 태그에 대입할 수 있는 value는 ""(빈칸) 뿐이다 
        }


        
        // JS에서 파일을 읽는 객체 파일을 읽고 클라이언트 컴퓨터에 파일을 저장할 수 있음
        const reader = new FileReader();

        reader.readAsDataURL(file);
        // 매개변수에 작성된 파일을 읽어서 저장 후 파일을 나타내는 URL로  result 속성으로 얻어올 수 있게 함.
        
        // 다 읽었을 때
        reader.onload = e => {
            //console.log(e.target);
            //console.log(e.target.result); // 읽은 파일의 URL

            const url = e.target.result;

            //프로필 이미지(img) 태그에 src 속성으로 추가
            profileImage.setAttribute("src", url);
            deleteCheck = 1;
        }
    });

    // x버튼 클릭 시 
    deleteImage.addEventListener('click', () => {
        imageInput.value = ""; // input type="file"의 value 삭제
        profileImage.setAttribute("src", "/resources/images/user.png");
        // 프로필 이미지를 기본 이미지로 변경
        
        deleteCheck = 0;

    });


    // #profileFrm이 제출 되었을 때
    document.getElementById("profileFrm").addEventListener("submit", e=> {
        // initCheck
        // 초기 프로필 이미지 상태를 저장하는 변수
        // false == 기본 이미지,  true == 이전 업로드 이미지

        // deleteCheck
        // 프로필 이미지가 새로 업로드 되거나 삭제 되었음을 나타내는 변수
        // -1 == 초기값 ,  0 == 프로필 삭제(x버튼),  1 == 새 이미지 업로드
        let flag = true;
        // 프로필 이미지가 없다 -> 있다
        if(!initCheck && deleteCheck == 1) flag = false;
        // 프로필 이미지가 있다 -> 삭제
        if(initCheck && deleteCheck == 0) flag = false;
        // 이전 프로필 이미지가 있다 -> 새 이미지
        if(initCheck && deleteCheck == 1) flag = false;
        
        if(flag){ // flag == true -> 제출하면 안되는 경우
            e.preventDefault(); // form 기본 이벤트 제거
            alert("이미지 변경 후 클릭하세요");
        }
    });

}