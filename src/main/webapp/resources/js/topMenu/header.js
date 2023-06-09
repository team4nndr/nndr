// 검색 input 태그
const search = document.getElementById("nndrQuery");
// 자동완성 목록
const suggestion_pannel = document.querySelector(".nndr-suggestions_pannel");
// 검색 버튼
const searchBtn = document.getElementById("nndrSearchBtn");

// input 태그 이벤트
search.addEventListener("input", e => {

    const input_value = e.target.value.trim();

    // #으로 시작하는 검색어인 경우

    // if (input_value.startsWith("#") && input_value.length > 1 || input_value.startsWith("")&& input_value.length > 1) {
    //     suggestion_pannel.style.display = "block";
    //     console.log(input_value);
    //     var query = input_value.replace("#", "%23");
    //     fetch("/mainFeed/getTags?query=" + query)
    //         .then(resp => resp.json())
    //         .then(tagList => {

    //             console.log(tagList);
    //             suggestion_pannel.innerHTML = ""; // 이전 검색 결과 비우기

    //             if (tagList.length == 0) {
    //                 const div = document.createElement("div");
    //                 div.classList.add("result");
    //                 div.innerText = "일치하는 태그가 없습니다.";
    //                 div.style = "padding-top: 15px;"
    //                 suggestion_pannel.appendChild(div);
    //             }

    //             for (let tags of tagList) {
    //                 const div = document.createElement("div");
    //                 div.classList.add("result");
    //                 div.setAttribute("hashTags", tags.hashtagKeyword);

    //                 if (query.toLowerCase().startsWith(query.toLowerCase())) {

    //                     let div = document.createElement("div");
    //                     const query = input_value.replace("%23", "#");
    //                     div.innerHTML = query;
    //                     div.style = "padding-top: 15px;"
    //                     suggestion_pannel.appendChild(div);

    //                     div.onclick = () => {
    //                         const query = input_value.replace("%23", "#");
    //                         // query = div.innerHTML;
    //                         suggestion_pannel.innerHTML = "";
    //                         location.href = "/matching/" + tags.hashtagKeyword ;
    //                         return;

                    
    //                     };
    //                 }
    //             }
    //         });

    // 검색어와 일치하는 게시글 불러오기

    // 멤버 검색
    if (input_value.startsWith("@") && input_value.length >= 2) {  

        suggestion_pannel.style.display = "block";
        var fName = input_value.substring(1);
        console.log("친구검색: " + fName);
        fetch("/mainFeed/friendNameList?fName=" + fName)
        .then(resp => resp.json())
        .then(friendNameList => {

            console.log(friendNameList);
            suggestion_pannel.innerHTML = "";

            if (friendNameList.length == 0) {
                const div = document.createElement("div");
                div.classList.add("result");
                div.innerText = "일치하는 검색어가 없습니다.";
                div.style = "padding-top: 15px;"
                suggestion_pannel.appendChild(div);
            }

            for (let names of friendNameList) {
                if (names.memberNo == loginMemberNo) continue;

                const div = document.createElement("div");
                div.classList.add("result");
                div.setAttribute("names", names.memberNo);

                const img = document.createElement("img");

                if (fName.toLowerCase().startsWith(fName.toLowerCase())) {

                    let div = document.createElement("div");
                    div.classList.add("search-content");

                    let p = document.createElement("p");
                    p.classList.add("search-fName");

                    let img = document.createElement("img");
                    img.classList.add("memberProfileImage");

                
                    const fName = names.memberName;
                    p.innerHTML = fName;
                    div.append(p);
                    div.prepend(img);
                    suggestion_pannel.appendChild(div);

                    if (names.profileImage != null) {
                        img.setAttribute("src", names.profileImage);
                    } else {
                        img.setAttribute("src", "/resources/images/common/user-default.png");
                    }


                    div.onclick = (e) => {
                        // e.target.preventDefault();
                        const fName = input_value;
                        // fName = div.innerHTML;
                        // suggestion_pannel.innerHTML = "";
                        location.href = "/personalFeed/" + names.memberNo;
                        return;
                    };
                }
            }
        });
                    
    // 일반 게시글 검색
    } else {
        suggestion_pannel.style.display = "block";
        // console.log(input_value);
        var query = input_value;
        fetch("/mainFeed/boardList?query=" + query)
        .then(resp => resp.json())
        .then(boardList => {

            console.log(boardList);
            suggestion_pannel.innerHTML = ""; // 이전 검색 결과 비우기

            if (boardList.length == 0) {
                const div = document.createElement("div");
                div.classList.add("result");
                div.innerText = "일치하는 검색 결과가 없습니다.";
                div.style = "padding-top: 15px;"
                suggestion_pannel.appendChild(div);
            }

            for (let board of boardList) {
                const div = document.createElement("div");
                div.classList.add("result");
                div.setAttribute("matching", board.boardText);

                if (query.toLowerCase().startsWith(query.toLowerCase())) {

                    let div = document.createElement("div");
                    const query = input_value;
                    div.innerHTML = board.boardText;
                    div.style = "padding-top: 15px;"
                    
                    suggestion_pannel.appendChild(div);

                    div.onclick = e => {
                        const query = input_value;
                        // query = div.innerHTML;
                        suggestion_pannel.innerHTML = "";
                        location.href = "/matchingList/" + query;

                        return;
                    };
                }
            }
        });
    }

    // 입력된 값이 없을 때
    if (input_value.length === 0) {
        suggestion_pannel.innerHTML = "";
        suggestion_pannel.style.display = "none";

        return;
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

/* 알람 옵션 */
var nndrOptionAlarm = document.getElementById("nndrOptionAlarm");
nndrOptionAlarm.addEventListener("click", e => {
    e.stopPropagation();
    nndrOptionAlarmContent.classList.toggle("hidden");
});
nndrOptionAlarmContent.addEventListener("click", e => {
    e.stopPropagation();
});

const mark = document.getElementById("alarmMark");
const btn1 = document.getElementById("nndrDropBtn1");

btn1.addEventListener("click",() => {
	mark.style.display = "none";
});


// 드롭다운 외부 클릭 시 드롭다운 메뉴 닫기
document.addEventListener('click', e => {

    if (e.target.className == "nndr-top-alarm-delete") return;

    const temp = document.querySelectorAll(".nndr-dropdown-container, .nndr-dropdown-container *");

    let flag = true;
    for (let el of temp) {
        if (el == e.target) {
            flag = false;
            break;
        }
    }

    if (flag) {
        nndrMyDropdown.classList.add("hidden");
        nndrBellDropdown.classList.add("hidden");
        nndrOptionAlarmContent.classList.add("hidden");
    }

    const modal = document.getElementById('nndrDropdown1');
});


Array.from(document.getElementsByClassName("nndr-top-alarm-delete")).forEach((target) => target.addEventListener("click", function () {
    alarmDel(target);
})
)
function alarmDel(target) {
    const alarmDel = (target.parentElement.previousElementSibling).dataset.alarmno
    target.parentElement.previousElementSibling.remove()
    target.parentElement.remove()
    console.log(alarmDel)
    //알람 삭제
    fetch("/alarmDel?alarmDel=" + alarmDel)
        .then(response => response.text())
        .then(() => {
        })
        .catch(e => { console.log(e) });

};   


document.getElementById("delAllAlarm").addEventListener("click", () => {
	fetch("/delAllAlarm")  
    .then(response => response.text()) 
    .then(() => {
    }) 
    .catch (e => { console.log(e)}); 
    document.getElementById("nndrAddContainer").innerHTML = "";



})