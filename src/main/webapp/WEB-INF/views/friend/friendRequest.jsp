<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>친구요청</title>
  <link rel="stylesheet" href="/resources/css/friend/friendRequest.css">
</head>

<body>
  <jsp:include page="/WEB-INF/views/topMenu/header.jsp" />

  <div class="content">
    <div class="friendNav">
      <div class="frtopbox"> <!-- 맨위 친구요청 text hr위-->
        <a href="/friend">
          <img class="back" src="/resources/images/friend/—Pngtree—vector back icon_4187319.png" alt="">
        </a>
        <div class="frmidbox">
          <div><span class="backfriend">친구</span></div>
          <div>
            <h1 class="friendpuls">친구 요청</h1>
          </div>
        </div>
      </div>
      <div class="hr2"></div>
      <div class="friendMenuList">
        <div id="friendList2"> <!--친구요청 개수-->
          <div id="friendRQBox">
            <span id="friendRQ">친구 요청 ${friendCount}개</span>
          </div>
        </div>
        <div id="friendList1">
          <c:forEach var="reciver" items="${friendReqList}">
            <div class="frtopdiv">
              <c:if test="${empty friend.profileImage}">
                <img class="proimg" src="/resources/images/common/user-default.png" alt="">
              </c:if>
              <c:if test="${not empty friend.profileImage}">
                <img class="proimg" src="${friend.profileImage}" alt="">
              </c:if>
              <div class="frbox"> <!--이름 + 확인,삭제-->
                <div class="namecount" onclick="friendPage(${reciver.memberNo})"><!--이름-->
                  <span class="freindName">${reciver.memberName}</span>
                </div>
                <div class="boxbtn"> <!--확인, 삭제 -->
                  <button class="yesbtn" onclick="accept(${reciver.friendNo})">확인</button>
                  <button class="nobtn" onclick="refuse(${reciver.friendNo})">삭제</button>
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
          
          <span id="maintext">프로필을 미리 볼 사람의 이름을 선택하세요.</span>
        </div>
      </div>
    </div>
 
    <script src="/resources/js/friend/friendRequest.js"></script>
</body>

</html>