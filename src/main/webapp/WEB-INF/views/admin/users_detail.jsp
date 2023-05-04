<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 기능</title>
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/admin/users.css">
    <link rel="stylesheet" href="/resources/css/admin/users_detail.css">
    <script src="https://kit.fontawesome.com/9c2aaccfe5.js" crossorigin="anonymous"></script>
</head>
<body>
    <%-- 상단바 메뉴 --%>
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
    
    <main>
        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

        <%-- 회원 관리 상세 페이지 --%>
        <form action="#" method="POST" id="content">
            <button type="button" id="backBtn" class="back">
                <i class="fa-solid fa-arrow-left"></i>
                <span>뒤로가기</span>                
            </button>
            <div id="details">
                <h3>회원 상세 정보</h3>
                <hr>
                <div class="row">
                    <span class="title">로그인계정</span>
                    <span class="data">cyunanne@gmail.com</span>
                </div>
                <div class="row">
                    <span class="title">이름</span>
                    <span class="data">최유나</span>
                </div>
                <div class="row">
                    <span class="title">성별</span>
                    <span class="data">여</span>
                </div>
                <div class="row">
                    <span class="title">이메일</span>
                    <span class="data">cyunanne@gmail.com</span>
                </div>
                <div class="row">
                    <span class="title">주소</span>
                    <span class="data">경기도 하남시 아리수로 499 미사강변루나리움아파트 502동 1302호</span>
                </div>
                <div class="row">
                    <span class="title">연락처</span>
                    <span class="data">010-5923-9363</span>
                </div>
                <div class="row">
                    <span class="title">회원상태</span>
                    <div class="data account-condition normal">정상</div>
                    <div class="data account-condition disabled">비활성</div>
                    <div class="data account-condition dropped">탈퇴</div>
                </div>
            </div>
            <div id="bottom">
                <button type="button" name="button" value="able" disabled>비활성 해제</button>
                <button type="button" name="button" vlaue="recover" disabled>계정 복구</button>
            </div>
        </form>
    </main>

    <script src="/resources/js/admin/admin.js"></script>
</body>
</html>