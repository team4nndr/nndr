<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 기능 : 회원 관리</title>
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/admin/users.css">
    <script src="https://kit.fontawesome.com/9c2aaccfe5.js" crossorigin="anonymous"></script>
</head>
<body>
    <%-- 상단바 메뉴 --%>
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
    
    <main>
        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

        <%-- 회원 관리 --%>
        <section id="content">
            <div class="search_wrap">
                <span>회원검색</span>
                <div class="search_box">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" name="" id="" placeholder="회원번호/회원이름/이메일 검색">
                </div>
                <button id="submit">검색</button>
                <!-- <select name="" id="" placeholder="계정상태">
                    <option value="모든계정">모든계정</option>
                    <option value="정상">정상</option>
                    <option value="비활성">비활성</option>
                    <option value="탈퇴">탈퇴</option>
                </select> -->

                <!-- <button class="condition_select">
                    <span>계정상태</span>
                    <i class="fa-solid fa-angle-down"></i>
                    <i class="fa-solid fa-angle-up"></i>
                </button>
                <ul class="listbox" id="listbox">
                    <li><button class="list">모든계정</button></li>
                    <li><button class="list">정상</button></li>
                    <li><button class="list">비활성</button></li>
                    <li><button class="list">탈퇴</button></li>
                </ul> -->
            </div>
            <div class="board-list-wrap">
                <div class="board-list">
                    <div class="top">
                        <div class="user-no">회원번호</div>
                        <div class="user-name">이름</div>
                        <div class="email">이메일</div>
                        <div class="regist-date">가입일</div>
                        <div class="account-condition top">계정상태</div>
                    </div>
                    <a href="admin/user" class="row">
                        <div class="user-no">2</div>
                        <div class="user-name">
                            <img src="/resources/images/common/user-deafult.png" class="profile-img">
                            <span>최유나</span>
                        </div>
                        <div class="email">cyunanne@gmail.com</div>
                        <div class="regist-date">2023-04-23</div>
                        <div class="account-condition">
                            <div class="normal">정상</div>
                        </div>
                    </a>
                    <a href="admin/user" class="row">
                        <div class="user-no">1</div>
                        <div class="user-name">
                            <img src="/resources/images/common/user-deafult.png" class="profile-img">
                            <span>최유나</span>  
                        </div>
                        <div class="email">cyunanne@gmail.com</div>
                        <div class="regist-date">2023-04-23</div>
                        <div class="account-condition">
                            <div class="disabled">비활성화</div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="board-page">
                <a href="#" class="prev-page">PREV</a>
                <a href="#" class="current-page">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">6</a>
                <a href="#" class="next-page">NEXT</a>
            </div>
        </section>
    </main>

    <script src="/resources/js/admin/admin.js"></script>
</body>
</html>