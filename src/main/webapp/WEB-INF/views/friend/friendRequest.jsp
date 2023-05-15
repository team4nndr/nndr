<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>친구요청</title>
  <link rel="stylesheet" href="/resources/css/friend/friendRequest.css">
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
            <h1 class="friendpuls">친구 요청</h1>
          </div>
        </div>
      </div>
      <div class="hr2">
      </div>
      <div>
        <div> <!--친구요청 개수-->
          <div id="friendRQBox">
            <span id="friendRQ">친구 요청 9개</span>
          </div>
        </div>
        <form action= "/request" method="GET">
        <div class="frtopdiv">
          <img class="proimg" src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
          <div class="frbox"> <!--이름 + 확인,삭제-->
            <div class="namecount"><!--이름, 함께 아는친구-->
              <span class="freindName">${memberName}</span>
              <div class="pulsfrcountBox">
                <%-- <span class="pulsfrcount">함께 아는 친구 2명</span> --%>
              </div>
            </div>
            <div class="boxbtn"> <!--확인, 삭제 -->
              <button class="yesbtn">확인</button>
              <button class="nobtn">삭제</button>
            </div>
          </div>
        </div>
        </form>
        <%-- <div class="frtopdiv">
          <img class="proimg" src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
          <div class="frbox"> <!--이름 + 확인,삭제-->
            <div class="namecount"><!--이름, 함께 아는친구-->
              <span class="freindName">박종욱</span>
              <div class="pulsfrcountBox">
                <span class="pulsfrcount">함께 아는 친구 5명</span>
              </div>
            </div>
            <div class="boxbtn"> <!--확인, 삭제 -->
              <button class="yesbtn">확인</button>
              <button class="nobtn">삭제</button>
            </div>
          </div>
        </div>
        <div class="frtopdiv">
          <img class="proimg" src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
          <div class="frbox"> <!--이름 + 확인,삭제-->
            <div class="namecount"><!--이름, 함께 아는친구-->
              <span class="freindName">이예슬</span>
              <div class="pulsfrcountBox">
                <span class="pulsfrcount">함께 아는 친구 3명</span>
              </div>
            </div>
            <div class="boxbtn"> <!--확인, 삭제 -->
              <button class="yesbtn">확인</button>
              <button class="nobtn">삭제</button>
            </div>
          </div>
        </div>
        <div class="frtopdiv">
          <img class="proimg" src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
          <div class="frbox"> <!--이름 + 확인,삭제-->
            <div class="namecount"><!--이름, 함께 아는친구-->
              <span class="freindName">조우형</span>
              <div class="pulsfrcountBox">
                <span class="pulsfrcount">함께 아는 친구 2명</span>
              </div>
            </div>
            <div class="boxbtn"> <!--확인, 삭제 -->
              <button class="yesbtn">확인</button>
              <button class="nobtn">삭제</button>
            </div>
          </div>
        </div>
        <div class="frtopdiv">
          <img class="proimg" src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
          <div class="frbox"> <!--이름 + 확인,삭제-->
            <div class="namecount"><!--이름, 함께 아는친구-->
              <span class="freindName">정반석</span>
              <div class="pulsfrcountBox">
                <span class="pulsfrcount">함께 아는 친구 5명</span>
              </div>
            </div>
            <div class="boxbtn"> <!--확인, 삭제 -->
              <button class="yesbtn">확인</button>
              <button class="nobtn">삭제</button>
            </div>
          </div>
        </div>
        <div class="frtopdiv">
          <img class="proimg" src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
          <div class="frbox"> <!--이름 + 확인,삭제-->
            <div class="namecount"><!--이름, 함께 아는친구-->
              <span class="freindName">최유나</span>
              <div class="pulsfrcountBox">
                <span class="pulsfrcount">함께 아는 친구 6명</span>
              </div>
            </div>
            <div class="boxbtn"> <!--확인, 삭제 -->
              <button class="yesbtn">확인</button>
              <button class="nobtn">삭제</button>
            </div>
          </div>
        </div> --%>
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