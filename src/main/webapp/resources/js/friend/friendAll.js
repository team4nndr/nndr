const frtopdiv = document.querySelectorAll(".frtopdiv");
const pulsnav = document.querySelectorAll(".pulsnav");
const frmenu = document.querySelectorAll(".frmenu");
const puls = document.querySelectorAll(".puls");

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

    if (query == "") {
        frsearch.innerHTML = "";
    }

})

/* 삭제 눌렀을 때 */
function refuse(friendNo) {
    fetch("/friend/all/nobt?friendNo=" + friendNo)//컨트롤작성해야함
        .then(resp => resp.text())
        .then(result => {
            if (result > 0) {
                alert("삭제하였습니다..");
                friendList(); // 목록을 다시 조회해서 삭제된 목록 을 제거
            } else {
                alert("삭제 실패");
            }
        })
        .catch(err => console.log(err));
}

//친구 목록 비동기 표시 
function friendList() {
    fetch("/friend/all/birequest")
        .then(resp => resp.json())
        .then(result => {
            console.log(result)
            const friendListElement = document.getElementById("friendAllList");
            const friendListElement2 = document.getElementById("friendRQBoxCount");

            friendListElement.innerHTML = "";
            friendListElement2.innerHTML = ""; //친구요청 갯수 제거

            for (let f of result) {
                const friendAllList = document.createElement("div");
                friendAllList.classList.add("frtopdiv");
                const img1 = document.createElement("img");
                img1.classList.add("proimg");
                img1.setAttribute("src", "/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png");
                const frbox = document.createElement("div");
                frbox.classList.add("frbox");
                const namecount = document.createElement("div");
                namecount.classList.add("namecount");
                const friendAll = document.createElement("div");
                friendAll.classList.add("friendAll");
                const frmenu2 = document.createElement("div");
                frmenu2.classList.add("frmenu");
                frmenu2.setAttribute("style", "display: none");
                const friendName = document.createElement("span");
                friendName.classList.add("friendName");
                friendName.innerText = f.memberName;
                const pulsnav2 = document.createElement("span");
                pulsnav2.classList.add("pulsnav");
                pulsnav2.setAttribute("style", "background-color: rgb(255, 255, 255)");
                const img2 = document.createElement("img");
                img2.setAttribute("src", "/resources/images/friend/free-icon-three-dots-6941941.png");
                const noFriend = document.createElement("div");
                noFriend.classList.add("noFriend");
                noFriend.setAttribute("onclick", "refuse(" + f.friendNo + ")");
                noFriend.innerText = f.memberName + "님과 친구 관계 끊기";

                friendAllList.append(img1, frbox);
                frbox.append(namecount);
                namecount.append(friendAll, frmenu2);
                friendAll.append(friendName, pulsnav2);
                pulsnav2.append(img2);
                frmenu2.append(noFriend);

                friendListElement.append(friendAllList);
            }

            const friendRQBox = document.createElement("div")
            friendRQBox.id = "friendRQBox";
            const friendRQ = document.createElement("span");
            friendRQ.id = "friendRQ";
            friendRQ.innerHTML = "친구 " + result.length + "명";

            friendRQBox.append(friendRQ);

            friendListElement2.append(friendRQBox);

            // 이벤트 핸들러 등록
            registerEventHandlers();
        })
        .catch(err => console.log(err));
}
//이벤트 제호출
function registerEventHandlers() {
    const frtopdiv = document.querySelectorAll(".frtopdiv");
    const pulsnav = document.querySelectorAll(".pulsnav");
    const frmenu = document.querySelectorAll(".frmenu");
    const puls = document.querySelectorAll(".puls");

    for (let i = 0; i < frtopdiv.length; i++) {
        frtopdiv[i].onmouseover = function () {
            pulsnav[i].style.backgroundColor = "#EBEDF0";
        };
        frtopdiv[i].onmouseout = function () {
            pulsnav[i].style.backgroundColor = "#ffffff";
        };

        const outclick = e => {
            if (!frmenu[i].contains(e.target)) {
                frmenu[i].style.display = "none";
                document.removeEventListener("click", outclick);
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
                e.stopPropagation();
                frmenu[i].style.display = "block";
                document.addEventListener("click", outclick);
            }
        });
    }
}

const friendAllList = document.getElementById("friendAllList");
const mainBox = document.getElementById("mainbox");

friendAllList.addEventListener("click", (e) => {
    if (e.target.classList.contains("frtopdiv")) {
        mainBox.style.display = "none";
    }
});