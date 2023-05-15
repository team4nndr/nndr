// 검색어 누적창 구현
console.log(tagArr[0]);
// 검색어 누적창 구현

// 검색 input 태그h
const search = document.getElementById("nndrQuery");
// 자동완성 목록
const suggestion_pannel = document.querySelector(".nndr-suggestions_pannel");
// 검색 버튼
const searchBtn = document.getElementById("nndrSearchBtn");

// 자동완성 데이터 초기 설정(친구 이름 검색 시)
// let s_arr = [
//     { name: "최팀장님", },
//     { name: "장과장님" },
//     { name: "조대리님" },
//     { name: "정사원" },
//     { name: "박사원" },
//     { name: "이사원" },
// ];

// // 자동완성 (#검색)
// let hashTagArr = [
//     { tagName: "#사과" },
//     { tagName: "#바나나" },
//     { tagName: "#수박" },
//     { tagName: "#메론" },
//     { tagName: "#딸기" },
//     { tagName: "#파인애플" },
//     { tagName: "#여행" },
//     { tagName: "#코딩" },
//     { tagName: "#주말" },

// ];

// input 태그 이벤트
search.addEventListener("keyup", (event) => {

    event.preventDefault();

    suggestion_pannel.innerHTML = "";

    let input_value = search.value;

    // #으로 시작하는 검색어인 경우
    if (input_value.startsWith("#")) {
        tagList.forEach(function (tag) {
            if (tag.tagName.toLowerCase().startsWith(input_value.toLowerCase())) {
                let div = document.createElement("div");
                div.innerHTML = tag.tagName;
                suggestion_pannel.appendChild(div);

                div.onclick = () => {
                    input_value = div.innerHTML;
                    suggestion_pannel.innerHTML = "";
                };
            }
        });
    } else { // 일반 검색어인 경우
        let suggestions = s_arr.filter(function (exam) {
            return exam.name.toLowerCase().startsWith(input_value);
        });

        suggestions.forEach(function (suggested) {
            let div = document.createElement("div");
            div.innerHTML = suggested.name;

            suggestion_pannel.appendChild(div);

            div.onclick = () => {
                input_value = div.innerHTML;
                suggestion_pannel.innerHTML = "";
            };
        });
    }
    if (input_value == "") {
        suggestion_pannel.innerHTML = "";
    }
});

// 드롭다운 아이콘 구현
var dropdowns = document.getElementById("nndrBellDropdown");

const dropBtn1 = document.getElementById("nndrDropBtn1");
const dropBtn2 = document.getElementById("nndrDropBtn2");
const bellDropdown = document.getElementById("nndrBellDropdown");
const myDropdown = document.getElementById("nndrMyDropdown");
const thumsUp = document.getElementById("thumsUp");
const nndrOptionAlarm = document.getElementById("nndrOptionAlarm");
const nndrOptionAlarmContent = document.getElementById("nndrOptionAlarmContent");

function bell() {
    document.getElementById("nndrBellDropdown").classList.toggle("nndr-show");


}

window.onclick = function (e) {
    if (e.target.matches('.DropBtn1')) {
        var dropdowns = document.getElementById("nndrBellDropdown");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('nndr-show')) {
                openDropdown.classList.remove('nndr-show');
            }
        }
    }



}

function my() {
    document.getElementById("nndrMyDropdown").classList.toggle("nndr-show");
}

window.onclick = function (e) {
    if (!e.target.matches('.nndrDropBtn2')) {
        var dropdowns = document.getElementById("nndrMyDropdown");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('nndr-show')) {
                openDropdown.classList.remove('nndr-show');
            }
        }
    }


}


/* 드롭다운 content 영역 */

/* 알림 버튼1 */
dropBtn1.addEventListener("click", () => {
    myDropdown.style.display = "none";
    thumsUp.style.display = "inline-block";

    if (bellDropdown.style.display != "none") {
        bellDropdown.style.display = "none";
        thumsUp.style.cursor = "pointer";
        return;
    } else {
        bellDropdown.style.display = "block";

    }
})


/* 알람 옵션 */
window.addEventListener("load", function () {
    var nndrOptionAlarm = document.getElementById("nndrOptionAlarm");
    var nndrOptionAlarmContent = document.getElementById("nndrOptionAlarmContent");

    nndrOptionAlarm.addEventListener("click", function () {
        if (nndrOptionAlarmContent.style.display === "none") {
            nndrOptionAlarmContent.style.display = "block";
        } else {
            nndrOptionAlarmContent.style.display = "none";
        }
    });
});


/* 알림내용 추가하기 */
const nndrAddAlarm = document.getElementsByClassName("nndrAddAlarm");
const nndrAddAlarmContent = document.getElementsByClassName("nndrAddAlarmContent");
const nndrTopAlarmDelete =  document.getElementsByClassName("nndrBottomAlarmDelete"); 
const nndrAddAlarmProfile = document.getElementsByClassName("nndrAddnndrAddAlarmProfile");
const nndrAddContainer = document.getElementById("nndrAddContainer");

thumsUp.addEventListener("click", () => {

    const nndrAddAlarm = document.createElement("div");
    nndrAddAlarm.classList.add("nndrAddAlarm");

    const nndrAddAlarmProfile = document.createElement("a");
    nndrAddAlarmProfile.classList.add("nndrAddAlarmProfile");
    nndrAddAlarmProfile.href = "#";

    const nndrAddAlarmContent = document.createElement("a");
    nndrAddAlarmContent.classList.add("nndrAddAlarmContent");
    nndrAddAlarmContent.href = "#";

    const topMyProfile = document.createElement("img");
    topMyProfile.classList.add("topMyProfile");
    topMyProfile.src = "/resources/images/topMenu/topMyProfile.png";


    const nndrAlarmContent = document.createElement("p");
    nndrAlarmContent.classList.add("nndrAlarmContent");
    nndrAlarmContent.innerHTML = "알림내용";

    const x = document.createElement('div');
    x.classList.add('nndr-top-alarm-delete');
    x.innerHTML = '&times;';

    nndrAddContainer.append(nndrAddAlarm);

    nndrAddAlarm.prepend(nndrAddAlarmProfile);
    nndrAddAlarm.append(nndrAddAlarmContent);
    nndrAddAlarm.append(x);

    nndrAddAlarmProfile.append(topMyProfile);
    nndrAddAlarmContent.append(nndrAlarmContent);

    /* 알람 삭제 하기 */
    
    x.addEventListener('click', (e) =>{
        
        e.target.parentElement.remove();

    });
});



/* 알림 버튼 2 */
dropBtn2.addEventListener("click", () => {
    bellDropdown.style.display = "none";
    if (myDropdown.style.display != "none") {
        myDropdown.style.display = "none";
        return;
    } else {
        myDropdown.style.display = "block";
    }
})



// const outclick = e => {
//     if (!bellDropdown.contains(e.target)) { // 클릭한 요소가 bellDropown의 하위 요소인지 확인
//         bellDropdown.style.display = "none"; // bellDropown를 숨김
//         document.removeEventListener("click", outclick); // 클릭 이벤트 리스너 제거
//     }


//     if (!myDropdown.contains(e.target)) { // 클릭한 요소가 myDropdown의 하위 요소인지 확인
//         myDropdown.style.display = "none"; // myDropdown를 숨김
//         document.removeEventListener("click", outclick); // 클릭 이벤트 리스너 제거
//     }

// };

// dropBtn1.addEventListener("click", e => {
//     e.stopPropagation(); // dropBtn1 클릭 이벤트 전파 방지
//     bellDropdown.style.display = "block"; // bellDropdown를 보임
//     document.addEventListener("click", outclick); // 클릭 이벤트 리스너 등록
// });



// dropBtn2.addEventListener("click", e => {
//     e.stopPropagation(); //dropBtn2 클릭 이벤트 전파 방지
//     myDropdown.style.display = "block"; // myDropdown를 보임
//     document.addEventListener("click", outclick); // 클릭 이벤트 리스너 등록
// });


