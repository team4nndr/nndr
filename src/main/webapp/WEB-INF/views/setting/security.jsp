<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설정</title>
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/setting/setting.css">
    <link rel="stylesheet" href="/resources/css/setting/security.css">
    <script src="https://kit.fontawesome.com/9c2aaccfe5.js" crossorigin="anonymous"></script>
</head>
<body>
    <%-- 상단바 메뉴 --%>
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
    
    <main>
        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/setting/sidebar.jsp" />

        <%-- 회원 의견 상세 페이지 --%>
        <section id="content">
            <h3>보안 관련 설정</h3>
            <div class="content-box">
                <div class="title">친구 요청</div>
                <div class="content-list hover">
                    친구 요청을 받으시겠어요?
                    <div class='toggle <c:if test="${loginMember.setFriendReq eq 'Y'}" >checked</c:if>' key="SET_FRIEND_REQ">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <div class="content-box">
                <div class="title">개인 피드 설정</div>
                <div class="content-list" id="setPersonalFeed">
                    내 피드에 새로운 게시글을 올릴 수 있는 사람은?

                    <div class="dropdown">
                        <ul>
                            <li class="button">
                                <img src="/resources/images/setting/everyone.png" class="img">
                                <span>모든 사람</span>
                                <img class="mini" src="/resources/images/setting/triangle-down.png">
                            </li>
                        </ul>
                        <ul class="list-wrap hidden">
                            <li value="A">
                                <img src="/resources/images/setting/check.png" class="<c:if test='${loginMember.setFeedAuthority ne "A"}'>hidden</c:if>">
                                <img src="/resources/images/setting/everyone.png" class="img">
                                <span>모든 사람</span>
                            </li>
                            <li value="F">
                                <img src="/resources/images/setting/check.png" class="<c:if test='${loginMember.setFeedAuthority ne "F"}'>hidden</c:if>">
                                <img src="/resources/images/setting/only-friend.png" class="img">
                                <span>친구만</span>
                            </li>
                            <li value="M">
                                <img src="/resources/images/setting/check.png" class="<c:if test='${loginMember.setFeedAuthority ne "M"}'>hidden</c:if>">
                                <img src="/resources/images/setting/only-me.png" class="img">
                                <span>나만</span>
                            </li>
                        </ul>
                    </div>


                    <!-- <div class="dropdown">
                        <label for="checkbox" id="label">드롭다운</label>
                        <input type="checkbox" id="checkbox">
                        <div class="container">
                            <div class="item" id="test1">모두</div>
                            <div class="item" id="test2">친구만</div>
                            <div class="item" id="test3">나만</div>
                        </div>
                    </div> -->
                    <%-- <select>
                        <option value="모두">모두</option>
                        <option value="친구만">친구만</option>
                        <option value="나만">나만</option>
                    </select> --%>
                </div> 
            </div>
            <div class="content-box">
                <div class="title">계정 비활성화</div>
                <div class="content-list">
                    계정을 비활성화 하시겠습니까?
                    <button class="reverse disableBtn" id="accountDisableBtn">계정 비활성화</button>
                </div>
            </div>
        </section>
    </main>

    <!-- 계정 비활성화 버튼 클릭 시 팝업 -->
    <div class="modal">
        <div class="modal-body">
            <section class="modalTop">
                <span class="title">계정 비활성화 진행</span>
                <button type="button" class="close cancelBtn"></button>
            </section>
            <hr>
            <section class="modalContent show" id="modalContent1">
                <span class="title">정말로 계정을 비활성화 하시겠습니까?</span><br>
                계정을 비활성화하면 프로필을 사용할 수 없게 되며 
                Facebook에 공유했던 게시물 대부분에서 회원님의 이름과 사진이 사라집니다. 
                그러나 기존 친구의 친구 리스트나 회원님이 보낸 메시지에는 회원님의 이름이 
                표시되는 등 다른 사람이 회원님의 정보 일부를 계속 보게 될 수 있습니다.
            </section>
            <section class="modalBottom show" id="modalBottom1">
                <button type="button" class="cancelBtn" id="cancelBtn1">취소</button>
                <button class="reverse" id="disableContinueBtn">계정 비활성화</button>
            </section>

            <section class="modalContent" id="modalContent2">
                <span class="title">계정이 비활성화 되었습니다.</span><br>
                이 창을 닫으면 자동으로 로그아웃이 진행되며, 다시 Facebook을 사용하시려면 
                이메일 인증 절차가 필요합니다. 언제든 다시 돌아오시길 기다리겠습니다. 감사합니다.
            </section>
            <section  class="modalBottom" id="modalBottom2">
                <button class="reverse" id="finalBtn">닫기</button>
            </section>
        </div>
    </div>

    <script src="/resources/js/setting/setting.js"></script>
    <script src="/resources/js/setting/security.js"></script>
</body>
</html>