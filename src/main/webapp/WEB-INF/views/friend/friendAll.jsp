<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든친구</title>
    <link rel="stylesheet" href="/resources/css/friend/friendAll.css">
</head>
	<jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
<body>
    <div class="content">
        <div class="friendNav">

            <div class="frtopbox"> <!-- 맨위 친구요청 text hr위-->

                <a href="/friend"><img class="back" src="/resources/images/friend/—Pngtree—vector back icon_4187319.png"
                        alt=""></a>
                <div class="frmidbox">
                    <div><span><a class="backfriend" href="#">친구</a></span></div>
                    <div>
                        <h1 class="allfriend">모든 친구</h1>
                    </div>
                </div>
            </div>
            <div id="searchFrBox"> <!-- 검색 기능-->
                <label for="searchfr" id="lafrbel">
                    <span id="searchimg"> <img src="/resources/images/friend/KakaoTalk_20230420_151612862.png" alt=""></span>
                    <input type="search"  name="query" id="searchfr"  autocomplete="off" placeholder="친구 검색"> <button class = "searchbtn"></button>
                </label>
                <div class = "frsearch searchList"></div>
            </div>
            <div class="hr2"> <!-- 줄 -->
            </div>
            <div id="friendRQBoxCount">
                <div id="friendRQBox">
                    <span id="friendRQ">친구 ${friendCount}명</span>
                </div>
            </div>
            <div id="friendAllList">
            <c:forEach  var="friend" items="${friendList}">
                <div class="frtopdiv">
                    <c:if test="${empty friend.profileImage}" >
                        <img class="proimg" src="/resources/images/common/user-default.png" alt="">
                    </c:if>
                    <c:if test="${not empty friend.profileImage}" >
                        <img class="proimg" src="${friend.profileImage}" alt="">
                    </c:if>
                        <div class="namecount"><!--이름-->
                            <div class="friendAll" onclick="friendPage(${friend.memberNo})">
                                <span class="friendName">${friend.memberName}</span>
                                <span class="pulsnav"><img src="/resources/images/friend/free-icon-three-dots-6941941.png" alt=""></span>
                            </div>
                            <div class="frmenu"> 
                                <div class="noFriend" onclick="refuse(${friend.friendNo})">${friend.memberName}님과 친구 관계 끊기</div>
                            </div>
                        </div>
                </div>
            </c:forEach>
            </div>
        </div>
        <div id="mainfrbox"> <!--메인 피드-->
            <div id="mainbox">
                <img id="imgmain" src="/resources/images/friend/null_states_people_gray_wash.svg" alt="">
                <span id="maintext">프로필을 볼 사람의 이름을 선택하세요.</span>
            </div>
        </div>
    </div>
    
    <script src="/resources/js/friend/friendAll.js"></script>
</body>

</html>