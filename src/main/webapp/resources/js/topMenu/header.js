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
search.addEventListener("input", e => {

    // e.target.preventDefault();

    suggestion_pannel.innerHTML = "";

    let input_value = search.value;

    // #으로 시작하는 검색어인 경우
    if (input_value.startsWith("#") && input_value.trim().length > 1) {
        console.log(input_value);
        const query = input_value.replace("#", "%23");
        fetch("/mainFeed/getTags?query=" + query)
        .then(resp => resp.json())
        .then(tagList => {

            console.log(tagList);

            if (query.toLowerCase().startsWith(query.toLowerCase())) {
                let div = document.createElement("div");
                const query = input_value.replace("%23", "#");
                div.innerHTML = query;
                suggestion_pannel.appendChild(div);
    
                div.onclick = () => {
                    const query = input_value.replace("%23", "#");
                    query = div.innerHTML;
                    suggestion_pannel.innerHTML = "";
                };
            }
        });
            
    }

     if(/* 수정 예정 */) { // 일반 검색어인 경우
        
            toLowerCase().startsWith(input_value);

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

// 알림 드롭다운 관련 요소
const nndrDropBtn1 = document.getElementById("nndrDropBtn1"); // 알림 버튼
const nndrBellDropdown = document.getElementById("nndrBellDropdown"); // 알림 하위메뉴
const nndrOptionAlarmContent = document.getElementById('nndrOptionAlarmContent'); // 알림 하위하위메뉴

// 내정보 드롭다운 관련 요소
const nndrDropBtn2 = document.getElementById("nndrDropBtn2"); // 내정보 버튼
const nndrMyDropdown = document.getElementById('nndrMyDropdown'); // 내정보 하위메뉴

// 알림버튼 클릭 이벤트 (function bell())
nndrDropBtn1.addEventListener('click', e => {
    nndrBellDropdown.classList.toggle("hidden");
    nndrMyDropdown.classList.add("hidden"); // 내정보 메뉴 없애기
});

// 프로필사진 클릭 이벤트 (function my())
nndrDropBtn2.addEventListener('click', e => { 
    nndrMyDropdown.classList.toggle("hidden");
    nndrBellDropdown.classList.add("hidden"); // 알림 메뉴 없애기
    nndrOptionAlarmContent.classList.add("hidden"); // 알림 내부 메뉴 없애기
});

// 드롭다운 외부 클릭 시 드롭다운 메뉴 닫기
window.addEventListener('click', e => {

    if(e.target.className == "nndr-dropdown-container") {
        alert("!");
    }
    // if ( !e.target.matches('.nndr-dropdown-container') 
    //     && !e.target.matches('.nndr-dropdown-button') 
    //     && !e.target.matches('.nndr-dropdown-menu')) {
    //     nndrMyDropdown.classList.add("hidden");
    //     nndrBellDropdown.classList.add("hidden");
    //     nndrOptionAlarmContent.classList.add("hidden");
    // }
    // const modal = document.getElementById('nndrDropdown1');
    // e.target == modal ? false : nndrBellDropdown.classList.add('hidden');
});




/* 알람 옵션 */
var nndrOptionAlarm = document.getElementById("nndrOptionAlarm");
nndrOptionAlarm.addEventListener("click", e => {
    e.stopPropagation();
    nndrOptionAlarmContent.classList.toggle("hidden");
});
nndrOptionAlarmContent.addEventListener("click", e => {
    e.stopPropagation();
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