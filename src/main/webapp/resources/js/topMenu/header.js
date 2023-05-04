// 검색어 누적창 구현

// 검색어 누적창 구현

// 검색 input 태그
const search = document.getElementById("query");
// 자동완성 목록
const suggestion_pannel = document.querySelector(".suggestions_pannel");
// 검색 버튼
const searchBtn = document.getElementById("searchBtn");

// 자동완성 데이터 초기 설정(친구 이름 검색 시)
let s_arr = [
    { name: "최팀장님", },
    { name: "장과장님" },
    { name: "조대리님" },
    { name: "정사원" },
    { name: "박사원" },
    { name: "이사원" },
];

// 자동완성 (#검색)
let hashTagArr = [
    { tagName: "#사과" },
    { tagName: "#바나나" },
    { tagName: "#수박" },
    { tagName: "#메론" },
    { tagName: "#딸기" },
    { tagName: "#파인애플" },
    { tagName: "#여행" },
    { tagName: "#코딩" },
    { tagName: "#주말" },

];


// input 태그 이벤트
search.addEventListener("keyup", (event) => {

    event.preventDefault();

    suggestion_pannel.innerHTML = "";

    let input_value = search.value;

    // #으로 시작하는 검색어인 경우
    if (input_value.startsWith("#")) {
        hashTagArr.forEach(function (tag) {
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
var dropdowns = document.getElementById("bellDropdown");

const dropBtn1 = document.getElementById("dropBtn1");
const dropBtn2 = document.getElementById("dropBtn2");
const bellDropdown = document.getElementById("bellDropdown");
const myDropdown = document.getElementById("myDropdown");


function bell() {
    document.getElementById("bellDropdown").classList.toggle("show");


}

window.onclick = function (e) {
    if (e.target.matches('.dropBtn1')) {
        var dropdowns = document.getElementById("bellDropdown");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }



}

function my() {
    document.getElementById("myDropdown").classList.toggle("show");
}

window.onclick = function (e) {
    if (!e.target.matches('.dropBtn2')) {
        var dropdowns = document.getElementById("myDropdown");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }


}


/* 드롭다운 content 영역 */


dropBtn1.addEventListener("click", () => {
    myDropdown.style.display = "none";

    if (bellDropdown.style.display != "none") {
        bellDropdown.style.display = "none";
        return;
    } else {
        bellDropdown.style.display = "block";

    }


})

dropBtn2.addEventListener("click", () => {
    bellDropdown.style.display = "none";
    if (myDropdown.style.display != "none") {
        myDropdown.style.display = "none";
        return;
    } else {
        myDropdown.style.display = "block";
    }
})



const outclick = e => {
    if (!bellDropdown.contains(e.target)) { // 클릭한 요소가 bellDropown의 하위 요소인지 확인
        bellDropdown.style.display = "none"; // bellDropown를 숨김
        document.removeEventListener("click", outclick); // 클릭 이벤트 리스너 제거
    }


    if (!myDropdown.contains(e.target)) { // 클릭한 요소가 myDropdown의 하위 요소인지 확인
        myDropdown.style.display = "none"; // myDropdown를 숨김
        document.removeEventListener("click", outclick); // 클릭 이벤트 리스너 제거
    }

};

dropBtn1.addEventListener("click", e => {
    e.stopPropagation(); // dropBtn1 클릭 이벤트 전파 방지
    bellDropdown.style.display = "block"; // bellDropdown를 보임
    document.addEventListener("click", outclick); // 클릭 이벤트 리스너 등록
});



dropBtn2.addEventListener("click", e => {
    e.stopPropagation(); //dropBtn2 클릭 이벤트 전파 방지
    myDropdown.style.display = "block"; // myDropdown를 보임
    document.addEventListener("click", outclick); // 클릭 이벤트 리스너 등록
});















