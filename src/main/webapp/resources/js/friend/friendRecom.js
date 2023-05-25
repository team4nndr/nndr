function accept(memberNo) {

    fetch("/friend/recom/yesbt?memberNo=" + memberNo)
        .then(resp => resp.text())
        .then(result => {
            if (result > 0) {
                alert("수락했습니다.");
                friendList();
            } else {
                alert("수락 실패");
            }
        })
        .catch(err => console.log(err));
}
function friendList() {
    fetch("/friend/recom/birequest")
        .then(resp => resp.json())
        .then(result => {
            console.log(result)
            const friendListElement = document.getElementById("friendSuggestionList"); // 화면에서 친구 목록을 표시하는 요소 선택

            friendListElement.innerHTML=""; //친구추천리스트 초기화

            for(let f of result){
                const frtopdiv = document.createElement("div");
                frtopdiv.classList.add("frtopdiv");
                const proimg = document.createElement("img");
                proimg.classList.add("proimg");
                proimg.setAttribute("src", (f.profileImage !== null && f.profileImage !== '') ? f.profileImage : "/resources/images/common/user-default.png");
                const frbox = document.createElement("div");
                frbox.classList.add("frbox");
                const namecount = document.createElement("div");
                namecount.classList.add("namecount");
                const freindName = document.createElement("span");
                freindName.innerText = f.memberName;
                freindName.classList.add("freindName");
                freindName.setAttribute("onclick", "friendPage(" + f.memberNo + ")");
                const boxbtn = document.createElement("div");
                boxbtn.classList.add("boxbtn");
                const yesbtn = document.createElement("button");
                yesbtn.classList.add("yesbtn");
                yesbtn.innerText = "확인";
                yesbtn.setAttribute("onclick", "accept(" + f.friendNo + ")" );
                const nobtn = document.createElement("button");
                nobtn.classList.add("nobtn");
                nobtn.innerText = "삭제";
                nobtn.setAttribute("onclick", "exit(" + f.memberNo + ")" );
                frtopdiv.append(proimg,frbox);

                frbox.append(namecount);
                
                namecount.append(freindName,boxbtn);
                boxbtn.append(yesbtn,nobtn);

        
                friendListElement.append(frtopdiv);
            }



        })

        .catch(err => console.log(err));

}
function hideParentDiv(button, memberNo) {
    // 버튼의 부모 div 요소 가져오기
    var parentDiv = button.parentNode.parentNode.parentNode.parentNode;

    // 부모 div 요소 숨기기
    parentDiv.style.display = 'none';

    // 선택적: 일정 시간(예: 3초)이 지난 후에 div를 다시 표시하려면 setTimeout 함수를 사용할 수 있습니다.
        }

function friendPage(memberNo) {
    location.href= "/personalFeed/" + memberNo;
}