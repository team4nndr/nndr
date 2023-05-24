function accept(friendNo) {


    fetch("/friend/request/yesbt?friendNo=" + friendNo)
        .then(resp => resp.text())
        .then(result => {
            if (result > 0) {
                alert("수락했습니다.");
                friendList(); // 목록을 다시 조회해서 삭제된 목록을 제거
            } else {
                alert("수락 실패");
            }
        })
        .catch(err => console.log(err));
}

/* 거절 눌렀을 때 */
function refuse(friendNo) {
    fetch("/friend/request/nobt?friendNo=" + friendNo)//컨트롤작성해야함
        .then(resp => resp.text())
        .then(result => {
            if (result > 0) {
                alert("거절하였습니다..");
                friendList(); // 목록을 다시 조회해서 삭제된 목록 을 제거
            } else {
                alert("거절 실패");
            }
        })
        .catch(err => console.log(err));
}
//친구 목록 비동기 표시 
function friendList() {
    fetch("/friend/request/birequest")
        .then(resp => resp.json())
        .then(result => {
            console.log(result)
            const friendListElement = document.getElementById("friendList1"); // 화면에서 친구 목록을 표시하는 요소 선택
            const friendListElement2 = document.getElementById("friendList2"); // 화면에서 친구 요청    갯수을 표시하는 요소 선택

            friendListElement2.innerHTML=""; //친구요청 갯수 제거
            friendListElement.innerHTML=""; //친구 요청목록 제거



            for(let f of result){
                const div1 = document.createElement("div");
                div1.classList.add("frtopdiv");
                const img1 = document.createElement("img");
                img1.classList.add("proimg");
                img1.setAttribute("src", (f.profileImage !== null && f.profileImage !== '') ? f.profileImage : "/resources/images/common/user-default.png");
                const frboxdiv = document.createElement("div");
                frboxdiv.classList.add("frbox");
                const nameCountdiv = document.createElement("div");
                nameCountdiv.classList.add("namecount");
                nameCountdiv.setAttribute("onclick", "friendPage(" + f.memberNo + ")");
                const span1 = document.createElement("span");
                span1.classList.add("freindName");
                span1.innerText = f.memberName;
                const boxBtndiv = document.createElement("div");
                boxBtndiv.classList.add("boxbtn");
                const pfdiv = document.createElement("div");
                pfdiv.classList.add("pulsfrcountBox");
                const yesButton = document.createElement("button");
                yesButton.innerText = "확인";
                yesButton.setAttribute("onclick", "accept(" + f.friendNo + ")" );
                yesButton.classList.add("yesbtn");
                // onclick="accept(${reciver.friendNo})"
                const noButton = document.createElement("button");
                noButton.innerText = "삭제";
                noButton.setAttribute("onclick", "refuse(" + f.friendNo + ")" );
                noButton.classList.add("nobtn");


                div1.append(img1,frboxdiv);

                frboxdiv.append(nameCountdiv,boxBtndiv);

                nameCountdiv.append(span1,pfdiv);

                boxBtndiv.append(yesButton, noButton);

                friendListElement.append(div1);
            }
            const friendRQBox = document.createElement("div")
            friendRQBox.id = "friendRQBox";
            const friendRQ = document.createElement("span");
            friendRQ.id = "friendRQ";
            friendRQ.innerHTML = "친구 요청" +result.length + "개";

            friendRQBox.append(friendRQ);

            friendListElement2.append(friendRQBox);
            // // 새로운 친구 목록 HTML을 생성
            // const newFriendListHTML = result;

            // // 새로운 친구 목록을 기존 목록에 추가
            // friendListElement.innerHTML = newFriendListHTML;

        })

        .catch(err => console.log(err));

}

function friendPage(memberNo) {
    location.href= "/personalFeed/" + memberNo;
}