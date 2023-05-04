const frtopdiv = document.querySelectorAll(".frtopdiv");
const pulsnav = document.querySelectorAll(".pulsnav");
const frmenu = document.querySelectorAll(".frmenu");


for (let i = 0; i < frtopdiv.length; i++) {

    frtopdiv[i].onmouseover = function () {
        pulsnav[i].style.backgroundColor = "#EBEDF0";
    }
    frtopdiv[i].onmouseout = function () {
        pulsnav[i].style.backgroundColor = "#ffffff";
    }


    const outclick = e => {
        if (!frmenu[i].contains(e.target)) { // 클릭한 요소가 frmenu의 하위 요소인지 확인
            frmenu[i].style.display = "none"; // frmenu를 숨김
            document.removeEventListener("click", outclick); // 클릭 이벤트 리스너 제거
        }
    };


    pulsnav[i].addEventListener("click", e => {
        if (frmenu[i].style.display == "block") {
            for (let i = 0; i < frtopdiv.length; i++) {
                frmenu[i].style.display = "none";
            }
        } else {
            for (let i = 0; i < frtopdiv.length; i++) {
                frmenu[i].style.display = "none";
            }
            e.stopPropagation(); // pulsnav 클릭 이벤트 전파 방지
            frmenu[i].style.display = "block"; // frmenu를 보임
            document.addEventListener("click", outclick); // 클릭 이벤트 리스너 등록
        }
    });
};