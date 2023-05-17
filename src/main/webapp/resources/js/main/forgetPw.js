const emailCheck = document.getElementById("emailCheck");
const buttonBtn = document.getElementById("buttonBtn");
const forgetFail = document.getElementById("forgetFail");
const certification = document.getElementById("certification");

buttonBtn.addEventListener("click", ()=>{

    fetch('/main/emailCheck?email='+emailCheck.value)
    .then(resp => resp.text()) // json 아닌 이유는 결과값이 하나이기 때문 
    .then(result => {
        // console.log(result);

        if(result == 0 ){
            forgetFail.style.display = "block";
            certification.style.display = "none";
        }else{
            forgetFail.style.display = "none";

            certification.style.display = "block";
        }
        
    })
    .catch(err => console.log(err));
});



