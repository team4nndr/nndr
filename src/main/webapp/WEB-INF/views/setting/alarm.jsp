<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설정</title>
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/topMenu/header.css">
    <link rel="stylesheet" href="/resources/css/setting/setting.css">
    <link rel="stylesheet" href="/resources/css/setting/alarm.css">
    <script src="https://kit.fontawesome.com/9c2aaccfe5.js" crossorigin="anonymous"></script>
    <c:set var="alarmList" value="${alarmList}"/>
</head>
<body>
    <%-- 상단바 메뉴 --%>
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
    
    <main>
        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/setting/sidebar.jsp" />

        <%-- 회원 의견 상세 페이지 --%>
        <!-- <form action="#" id="content"> -->
        <section id="content">
            <h3>알림 설정</h3>
            <div class="content-box">
                <div class="title">친구 요청</div>
                <div class="content-list hover">
                    누군가 회원님께 친구 요청을 했을 때 알림 받기
                    <div class='toggle <c:if test="${loginMember.setAlarmFriendReq eq 'Y'}" >checked</c:if>' key="SET_AL_FRIEND_REQ">
                        <div class="circle"></div>
                    </div>
                </div>
                <div class="content-list hover">
                    회원님의 친구 요청이 수락되었을 때 알림 받기
                    <div class='toggle <c:if test="${loginMember.setAlarmReqAccept eq 'Y'}" >checked</c:if>' key="SET_AL_REQ_ACCEPT">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <div class="content-box">
                <div class="title">태그</div>
                <div class="content-list hover">
                    누군가 회원님을 태그(@)했을 때 알림 받기
                    <div class='toggle <c:if test="${loginMember.setAlarmTag eq 'Y'}" >checked</c:if>' key="SET_AL_TAG">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <div class="content-box">
                <div class="title">게시글</div>
                <div class="content-list hover">
                    회원님의 게시글에 댓글이 달렸을 때 알림 받기
                    <div class='toggle <c:if test="${loginMember.setAlarmReply eq 'Y'}" >checked</c:if>' key="SET_AL_REPLY">
                        <div class="circle"></div>
                    </div>
                </div>
                <div class="content-list hover">
                    회원님의 게시글에 좋아요가 눌렸을 때 알림 받기
                    <div class='toggle <c:if test="${loginMember.setAlarmLike eq 'Y'}" >checked</c:if>' key="SET_AL_LIKE">
                        <div class="circle"></div>
                    </div>
                </div>
                <%-- <div class="content-list hover">
                    회원님의 게시글이 공유되었을 때 알림 받기
                    <div class='toggle <c:if test="${loginMember.setAlarmShare eq 'Y'}" >checked</c:if>' key="SET_AL_SHARE">
                        <div class="circle"></div>
                    </div>
                </div> --%>
            </div>
            <div class="content-box">
                <div class="title">내 피드</div>
                <div class="content-list hover">
                    회원님의 피드에 새로운 게시글이 작성되었을 때 알림 받기
                    <div class='toggle <c:if test="${loginMember.setAlarmFeed eq 'Y'}" >checked</c:if>' key="SET_AL_FEED">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- </form> -->
    </main>

    <script src="/resources/js/setting/setting.js"></script>
    <script src="/resources/js/topMenu/header.js"></script>
</body>
</html>