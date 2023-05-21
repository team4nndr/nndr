function accept(friendNo) {


    fetch("/friend/friend/yesbt?friendNo=" + friendNo)
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

/* 거절 눌렀을 때 */
function refuse(friendNo) {

    fetch("/friend/friend/nobt?friendNo=" + friendNo)//컨트롤작성해야함
        .then(resp => resp.text())
        .then(result => {
            if (result > 0) {
                alert("거절하였습니다..");
                friendList(); // 목록을 다시 조회해서 삭제된 글을 제거
            } else {
                alert("거절 실패");
            }
        })
        .catch(err => console.log(err));
}


//친구 목록 비동기 표시 
function friendList() {
    fetch("/friend/friend/birequest")
        .then(resp => resp.json())
        .then(result => {
            console.log(result)
            const friendListElement = document.getElementById("friendContent"); // 화면에서 친구 목록을 표시하는 요소 선택

            friendListElement.innerHTML="";

            for(let f of result){

                const friendbax = document.createElement("div");
                friendbax.classList.add("friendbax");
                const tbox = document.createElement("div");
                tbox.classList.add("tbox");
                const pick = document.createElement("img");
                pick.setAttribute("src", "/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png");
                pick.classList.add("pick");
                const boxname = document.createElement("div");
                boxname.classList.add("boxname");
                const namebar = document.createElement("div");
                namebar.classList.add("namebar");
                const frName = document.createElement("span");
                frName.classList.add("frName");
                frName.innerText = f.memberName;
                const btnbox = document.createElement("div");
                btnbox.classList.add("btnbox");
                const checkYes = document.createElement("button");
                checkYes.classList.add("checkYes");
                checkYes.innerText = "확인";
                checkYes.setAttribute("onclick", "accept(" + f.friendNo + ")" );
                const btnbox2 = document.createElement("div");
                btnbox2.classList.add("btnbox");
                const checkNo = document.createElement("button");
                checkNo.classList.add("checkNo");
                checkNo.innerText = "취소";
                checkNo.setAttribute("onclick", "refuse(" + f.friendNo + ")" );

                friendbax.append(tbox,boxname);
                tbox.append(pick);
                boxname.append(namebar,btnbox,btnbox2);
                namebar.append(frName);
                btnbox.append(checkYes);
                btnbox2.append(checkNo);
                
                friendListElement.append(friendbax);
            }

        })
        .catch(err => console.log(err));
}