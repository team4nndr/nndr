<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>친구추천</title>
    <link rel="stylesheet" href="/resources/css/friend/friendRecom.css">
</head>
	<jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
<body>
    <div class="content">
        <div class="friendNav">

            <div class="frtopbox"> <!-- 맨위 친구요청 text hr위-->

                <a href="/friend"><img class="back" src="/resources/images/friend/—Pngtree—vector back icon_4187319.png" alt=""></a>
                <div class="frmidbox">
                    <div><span class="backfriend">친구</span></div>
                    <div>
                        <h1 class="friendpuls">친구 추천</h1>
                    </div>
                </div>
            </div>
            <div class="hr2">
            </div>
            <div>
                <div> <!--친구요청 개수-->
                    <div id="friendRQBox">
                        <span id="friendRQ">알 수도 있는 사람</span>
                    </div>
                </div>
                <div id="friendSuggestionList">
                <c:forEach var="fs" items="${friendSuggestion}" >
                <div class="frtopdiv">
                    <c:if test="${empty fs.profileImage}" >
                        <img class="proimg" src="/resources/images/common/user-default.png" alt="">
                    </c:if>
                    <c:if test="${not empty fs.profileImage}" >
                        <img class="proimg" src="${fs.profileImage}" alt="">
                    </c:if>
                    <div class="frbox"> <!--이름 + 확인,삭제-->
                        <div class="namecount" ><!--이름, 함께 아는친구-->
                            <span class="freindName" onclick="friendPage(${fs.memberNo})">${fs.memberName}</span>
                            <div class="boxbtn"> <!--확인, 삭제 -->
                                <button class="yesbtn" onclick="accept(${fs.memberNo})">친구 신청 보내기 </button>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                </div>
            
            </div>
        </div>
        <div id="mainfrbox"> <!--메인 피드-->
            <div id="mainbox">
                <img id="imgmain" src="/resources/images/friend/null_states_people_gray_wash.svg" alt="">
                <span id="maintext">프로필을 볼 사람의 이름을 선택하세요.</span>
            </div>
        </div>
    </div>
    <script src="/resources/js/friend/friendRecom.js"></script>
</body>

</html>