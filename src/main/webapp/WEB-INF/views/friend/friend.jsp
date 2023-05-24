<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>friendTab</title>
    <link rel="stylesheet" href="/resources/css/friend/friend.css">
</head>

	<jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
<body>
    <main>
        <div class="content">
            <div class="friendNav">
                <ul>
                    <strong id="friend">친구</strong>
                    <li><a href="friend"><img class="friendimg" src="/resources/images/friend/free-icon-friend-5003758.png" alt=""> 홈</a>
                    </li>
                    <li><a href="friend/request"><img class="friendimg" src="/resources/images/friend/free-icon-add-friend-3394625.png" alt="">
                            친구요청</a></li>
                    <li><a href="friend/recom"><img class="friendimg" src="/resources/images/friend/free-icon-friends-2583035.png" alt=""> 친구추천</a>
                    </li>
                    <li><a href="friend/all"><img class="friendimg" src="/resources/images/friend/free-icon-friends-7596695.png" alt=""> 모든친구</a>
                    </li>
                </ul>
            </div>
            <div class="topdiv">
                <div class="topfr">친구요청</div>
                <div id="friendContent">
                        <c:forEach  var="reciver" items="${friendReqList}">
                            <div class="friendbax">
                                <!-- pick = img로  -->
                                <div class="tbox"> 
                                    <c:if test="${empty friend.profileImage}" >
                                        <img class="proimg" src="/resources/images/common/user-default.png" alt="">
                                    </c:if>
                                    <c:if test="${not empty friend.profileImage}" >
                                        <img class="proimg" src="${friend.profileImage}" alt="">
                                    </c:if>
                                </div>
                                <div class="boxname">
                                    <div class="namebar"><span class="frName">${reciver.memberName}</span></div>
                                    <div class="btnbox"><button class="checkYes" onclick="accept(${reciver.friendNo})">확인</button></div>
                                    <div class="btnbox"><button class="checkNo"  onclick="refuse(${reciver.friendNo})">삭제</button></div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        
    </main>
    <script src="/resources/js/friend/friend.js"></script>
</body>

</html>