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

const frsearch = document.querySelector(".frsearch");
const searchfr = document.getElementById("searchfr");



searchfr.addEventListener("input", (e) => {


    const query = e.target.value.trim();

    if (query.length > 0) {

        fetch("/friend/all/ser?query=" + query)
            .then(resp => resp.json())
            .then(friendList => {

                console.log(friendList);
                frsearch.innerHTML = "";


                if (friendList.length == 0) {
                    var div = document.createElement("div");
                    div.classList.add("result2");
                    div.innerText = "일치하는 친구가 없습니다.";
                    frsearch.appendChild(div);
                }

                for (let fr of friendList) {
                    const div = document.createElement("div");
                    div.classList.add("result2");
                    div.setAttribute("fr", fr.memberNo);

                    if (query.toLowerCase().startsWith(query.toLowerCase())) {

                        let div = document.createElement("div");
                        const query = searchfr;
                        div.innerHTML = query.value;
                        frsearch.appendChild(div);

                        div.onclick = () => {
                            var query = searchfr;
                            query = div.innerHTML;
                            frsearch.innerHTML = "";
                            return;
                        };
                    }
                }
            });
    }

    if (searchfr == "") {
        frsearch.innerHTML = "";
    }

})

