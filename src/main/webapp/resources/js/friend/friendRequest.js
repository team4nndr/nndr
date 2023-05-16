
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

// 댓글 목록 조회
function friendList() {

}

