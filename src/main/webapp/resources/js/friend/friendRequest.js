function accept(friendNo) {


    fetch("/friend/request/yesbt?friendNo=" + friendNo)
        .then(resp => resp.text())
        .then(result => {
            if (result > 0) {
                alert("수락했습니다.");
                friendList(); // 목록을 다시 조회해서 삭제된 글을 제거
            } else {
                alert("수락 실패");
            }
        })
        .catch(err => console.log(err));
}

function friendList() {
    fetch("/friend/request/birequest")
        .then(resp => resp.json())
        .then(result => {
            console.log(result)
            const friendListElement = document.getElementById("friendList2"); // 화면에서 친구 목록을 표시하는 요소 선택

            friendListElement.innerHTML="";

            for(let f of result){
                const div1 = document.createElement("div");
                div1.classList.add("frtopdiv");
                const img1 = document.createElement("img");
                img1.setAttribute("src", "/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png");
                img1.classList.add("proimg");
                const frboxdiv = document.createElement("div");
                frboxdiv.classList.add("frbox");
                const nameCountdiv = document.createElement("div");
                nameCountdiv.classList.add("namecount");
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
                noButton.classList.add("nobtn");


                div1.append(img1,frboxdiv);

                frboxdiv.append(nameCountdiv,boxBtndiv);

                nameCountdiv.append(span1,pfdiv);

                boxBtndiv.append(yesButton, noButton);

                friendListElement.append(div1);
            }

            // // 새로운 친구 목록 HTML을 생성
            // const newFriendListHTML = result;

            // // 새로운 친구 목록을 기존 목록에 추가
            // friendListElement.innerHTML = newFriendListHTML;
        })
        .catch(err => console.log(err));
}