const emailCheck = document.getElementById("emailCheck");

const forgetFail = document.getElementById("forgetFail");
const certification = document.getElementById("certification");
const sendAuthKeyBtn = document.getElementById("sendAuthKeyBtn");
const buttonBtn = document.getElementById("buttonBtn");


buttonBtn.addEventListener("click", ()=>{

    fetch('/main/emailCheck?email='+emailCheck.value)
    .then(resp => resp.text()) // json 아닌 이유는 결과값이 하나이기 때문 
    .then(result => {
        // console.log(result);

        if(result == 0 ){
            forgetFail.style.display = "block";
            certification.style.display = "none";
            sendAuthKeyBtn.style.display = "none";
        }else{
            forgetFail.style.display = "none";
            sendAuthKeyBtn.style.display = "block";
            certification.style.display = "block";
        }
        
    })
    .catch(err => console.log(err));
});

// 이메일 유효성 검사
const checkObj ={
    "emailCheck" : false,
    "inputText"  : false
};

emailCheck.addEventListener("input", ()=>{

    // 입력된 이메일 없을 경우 
    if(emailCheck.value.trim().length == 0){
        emailCheck.value = ""; // 띄어쓰기 입력 막기

        emailCheck.style.backgroundColor ="#e4cac2";

        checkObj.emailCheck = false
        return;
    }

    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    if(regEx.test(emailCheck.value)){

        fetch('/main/emailDuplication?emailDup='+ emailCheck.value)
        .then(response => response.text())   
        .then(result => {
            
            if(result == 1){ //등록된 이메일이 0이면 중복 없을 때, 1이면 중복 있을 때
                emailCheck.style.backgroundColor = "#e4cac2";
                checkObj.emailCheck = true;
            }else{
                emailCheck.style.backgroundColor = "rgba(142, 179, 234, 0.617)";
                checkObj.emailCheck = false;
            }

        })
        .catch(err =>console.log(err));

    } else{
        emailCheck.style.backgroundColor = "#e4cac2";
        checkObj.emailCheck = false;
    }

});

// 이메일 인증


// 인증번호 발송

let authTimer;
let authMin = 4;
let authSec = 59;

// 인증번호를 발송한 이메일 저장
let tempEmail;

sendAuthKeyBtn.addEventListener("click", function(){
    authMin = 4;
    authSec = 59;

    checkObj.authKey = false;

    if(checkObj.emailCheck){ // 비밀찾기의 이메일등록 되어있다면


    /* fetch() API 방식 ajax */
    fetch("/sendEmail/findEmail?email="+emailCheck.value)
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            console.log("인증 번호가 발송되었습니다.")
            tempEmail = emailCheck.value;
        }else{
            console.log("인증번호 발송 실패")
        }
    })
    .catch(err => {
        console.log("이메일 발송 중 에러 발생");
        console.log(err);
    });
    

    alert("인증번호가 발송 되었습니다.");

    

    authTimer = window.setInterval(()=>{

        
        // 남은 시간이 0분 0초인 경우
        if(authMin == 0 && authSec == 0){
            checkObj.authKey = false;
            clearInterval(authTimer);
            return;
        }

        // 0초인 경우
        if(authSec == 0){
            authSec = 60;
            authMin--;
        }


        authSec--; // 1초 감소

        }, 1000)
    
    } 


});


// 인증 확인
const inputText = document.getElementById("inputText");
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn");

checkAuthKeyBtn.addEventListener("click", function(){

    if(authMin > 0 || authSec > 0){ // 시간 제한이 지나지 않은 경우에만 인증번호 검사 진행
        /* fetch API */
        const obj = {"inputKey":inputText.value, "email":tempEmail} 
        const query = new URLSearchParams(obj).toString()
        // 파라미터가 많을 때 쿼리스트링을 쓰는 방법 : URLSearchParams toString 으로 반환 => inputKey=123456&email=user01 

        fetch("/sendEmail/findCheck?" + query)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                clearInterval(authTimer); // 시간가는거 멈추는 코드
                checkAuthKeyBtn.style.backgroundColor = "rgba(142, 179, 234, 0.617)";
                checkObj.authKey = true; // 인증되면
                location.href="/main/forgetPw/newPw";

            } else{
                alert("인증번호가 일치하지 않습니다.")
                checkAuthKeyBtn.style.backgroundColor = "#e4cac2";
                checkObj.authKey = false;
            }
        })
        .catch(err => console.log(err));


    } else{
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.")
    }

});

// 의견 전송 완료 후 창 닫으면 설정 > 일반 화면으로 이동
var cancel = document.getElementById('cancel');
if(cancel != null) {
    cancel.addEventListener('click', () => {
        location.href = "/";
    });
}

// footer의 메인페이지 이동 
var mainPageGo = document.getElementById('mainPageGo');
var loginGo   = document.getElementById('loginGo');

mainPageGo.addEventListener('click', () => {
    location.href = "/";
});

loginGo.addEventListener('click', () => {
    location.href = "/";
});



