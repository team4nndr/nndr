

// 열기 버튼
const openBtn = document.getElementById('openBtn');

// 닫기 버튼
const remove = document.getElementById('remove');

// modal 창
const modal = document.getElementById('modal');

// input 태그 
const inputList = document.getElementsByTagName("input");



// nav 요소
// const nav = document.querySelector('nav');

// 새 계정만들기 버튼을 누르면 display = flex로 보이기
openBtn.addEventListener("click", () => {
    modal.style.display = "flex";
});

// 닫기 버튼을 누르면 nav의 display가 none으로 변경
remove.addEventListener("click", function () {
    modal.style.display = "none";
    for(let input of inputList) {
        input.value = "";
    }

    document.getElementById("birthday").value = "selected";
    document.getElementById("month").value = "selected";
    document.getElementById("day").value = "selected";
    var radio = document.querySelector('input[type=radio][name=InfoGender]:checked');
    radio.checked = false;
   

    return;
});

// 이름 느낌표 표시 
const memberName = document.getElementById("memberName");
const bangWarn2 = document.getElementById("bangWarn2");

memberName.addEventListener("mousemove", () => {
    if (memberName.value.trim().length == 0) {

        bangWarn2.classList.remove("hidden");
    } else{
        bangWarn2.classList.add("hidden");
    }
});



// 유효성 검사 진행 여부 확인용 객체
const checkObj = {
    "memberEmail": false,
    "memberPw": false,
    "memberPwConfirm": false,
    "memberNickname": false,
    "memberTel": false,
    "authKey" : false
};

// 이메일 유효성 검사
const memberEmail = document.getElementById("memberEmail");

const bangWarn1 = document.getElementById("bangWarn1");

// 이메일이 입력될 때 마다
memberEmail.addEventListener("input", ()=>{

    // 입력된 이메일 없을 경우
    if(memberEmail.value.trim().length == 0) {
        memberEmail.value = ""; // 띄어쓰기 입력 막기

        // memberEmail.style.backgroundColor = "#e4cac2"; // 배경색 색깔 변경

        checkObj.memberEmail = false // 빈칸 == 유효 X
        return; 
    }
    
    
    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;
    
    if( regEx.test(memberEmail.value) ){
        
        fetch('/main/email?inputEmail='+memberEmail.value)
        .then(response => response.text())
        .then(result => {
            //  console.log(result);
            
            if(result == 0){ // 중복 없으면 0 
                memberEmail.style.backgroundColor = "rgba(142, 179, 234, 0.617)";
                checkObj.memberEmail = true;
                bangWarn1.classList.add('hidden');
                
                
            }else{  // 중복 있으면 0(X)
                memberEmail.style.backgroundColor = "#e4cac2";
                checkObj.memberEmail = false;
                bangWarn1.classList.remove('hidden');
            }

            
            
        })

        .catch(err =>console.log(err)); // 예외 처리
        
    } else {
        memberEmail.style.backgroundColor = "#e4cac2";
        checkObj.memberEmail = false
        bangWarn1.classList.remove('hidden');
    }


});




// 비밀번호/ 비밀번호 확인 유효성 검사
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const bangWarn4 = document.getElementById("bangWarn4");
const bangWarn5 = document.getElementById("bangWarn5");

memberPw.addEventListener("input", ()=>{

    // 비밀번호가 입력되지 않은 경우
    if(memberPw.value.trim().length == 0) {
        memberPw.value = ""; 

        bangWarn4.classList.remove("hidden"); 
        bangWarn5.classList.remove("hidden"); 
        
        // memberPw.style.backgroundColor = "#e4cac2";
        checkObj.memberPw = false;
        return;
    }
    
    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;

    if(regEx.test(memberPw.value)){

        checkObj.memberPw = true;
        
        // 비밀번호가 유효하게 작성된 상태에서
        // 비밀번호확인이 입력되지 않았을 때 
        if(memberPwConfirm.value.trim().length = 0){
            
            bangWarn5.classList.remove('hidden');
            memberPwConfirm.style.backgroundColor = "#e4cac2";
        } else{

            if(memberPw.value == memberPwConfirm.value){
                memberPw.style.backgroundColor = "rgba(142, 179, 234, 0.617)";
                checkObj.memberPwConfirm = true;
                bangWarn4.classList.add('hidden');
                bangWarn5.classList.add('hidden');

            }else {
                memberPw.style.backgroundColor = "rgba(142, 179, 234, 0.617)";
                checkObj.memberPwConfirm = false;
                bangWarn4.classList.add('hidden');
            }

        }
 
    } else {
        memberPw.style.backgroundColor = "#e4cac2";
        checkObj.memberPw = false;
        bangWarn4.classList.remove('hidden');

    }

});

// 비밀번호 확인 유효성 검사
memberPwConfirm.addEventListener('input', () => {

    
    if (checkObj.memberPw) { // 비밀번호가 유효하게 작성된 경우에
        
        // 비밀번호 == 비밀번호 확인 (같을 경우)
        if (memberPw.value == memberPwConfirm.value) {
            memberPw.style.backgroundColor = "rgba(142, 179, 234, 0.617)";
            memberPwConfirm.style.backgroundColor = "rgba(142, 179, 234, 0.617)";
            checkObj.memberPwConfirm = true;
            bangWarn4.classList.add('hidden');
            bangWarn5.classList.add('hidden');


        } else {// 다를 경우
            memberPw.style.backgroundColor = "#e4cac2";
            memberPwConfirm.style.backgroundColor = "#e4cac2";
            checkObj.memberPwConfirm = false;
            bangWarn5.classList.remove('hidden');
        }

    } else { // 비번이 유효하지 않은 경우
        checkObj.memberPwConfirm = false;
    }

});

// 전화번호 유효성 검사
const memberTel = document.getElementById("memberTel");
const bangWarn6 = document.getElementById("bangWarn6");


// 전화번호가 입력 되었을 때
memberTel.addEventListener("input", () => {

    if (memberTel.value.trim().length == 0) {
        // memberTel.style.backgroundColor ="#e4cac2";
        checkObj.memberTel = false;
        memberTel.value = ""; // 빈칸 방지
        return;
    }

    // 정규표현식으로 유형성 검사
    const regEx = /^0(1[01679]|2|[3-6][1-5]|70)[1-9]\d{2,3}\d{4}$/;

    // if(regEx.test(문자열))
    if (regEx.test(memberTel.value)) { // 유효
        memberTel.style.backgroundColor ="rgba(142, 179, 234, 0.617)";
        checkObj.memberTel = true;
        bangWarn6.classList.add('hidden');

    } else {//무효
        memberTel.style.backgroundColor = "#e4cac2";
        bangWarn6.classList.remove('hidden');
        checkObj.memberTel = false;
    }

});


// ---------------- 이메일 인증 -----------------------

// 인증번호 발송
const sendAuthKeyBtn = document.getElementById("sendAuthKeyBtn");
let authTimer;
let authMin = 4;
let authSec = 59;

// 인증번호를 발송한 이메일 저장
let tempEmail;

sendAuthKeyBtn.addEventListener("click", function(){
    authMin = 4;
    authSec = 59;

    checkObj.authKey = false;

    if(checkObj.memberEmail){ // 중복이 아닌 이메일인 경우


        /* fetch() API 방식 ajax */
        fetch("/sendEmail/signUp?email="+memberEmail.value)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                console.log("인증 번호가 발송되었습니다.")
                tempEmail = memberEmail.value;
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

            authKeyMessage.innerText = "0" + authMin + ":" + (authSec<10 ? "0" + authSec : authSec);
            
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

    } else{
        alert("중복되지 않은 이메일을 작성해주세요.");
        memberEmail.focus();
    }

});


// 인증 확인
const authKey = document.getElementById("authKey");
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn");

checkAuthKeyBtn.addEventListener("click", function(){

    if(authMin > 0 || authSec > 0){ // 시간 제한이 지나지 않은 경우에만 인증번호 검사 진행
        /* fetch API */
        const obj = {"inputKey":authKey.value, "email":tempEmail} 
        const query = new URLSearchParams(obj).toString()
        // 파라미터가 많을 때 쿼리스트링을 쓰는 방법 : URLSearchParams toString 으로 반환 => inputKey=123456&email=user01 

        fetch("/sendEmail/checkAuthKey?" + query)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                clearInterval(authTimer); // 시간가는거 멈추는 코드
                checkAuthKeyBtn.style.backgroundColor = "rgba(142, 179, 234, 0.617)";
                checkObj.authKey = true; // 인증되면

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


// 회원 가입 form 태그가 제출 되었을 때
document.getElementById("btn").addEventListener("submit", e => {

    for (let key in checkObj) {

        if (!checkObj[key]) { 
        
            switch (key) {
                case "memberEmail":
                    alert("이메일이 유효하지 않습니다."); break;

                case "memberPw":
                    alert("비밀번호가 유효하지 않습니다."); break;

                case "memberPwConfirm":
                    alert("비밀번호가 확인되지 않았습니다"); break;

                case "memberTel":
                    alert("전화번호가 유효하지 않습니다"); break;
            }

            document.getElementById(key).focus();

            e.preventDefault(); 
            return; 
        }
    }

});



