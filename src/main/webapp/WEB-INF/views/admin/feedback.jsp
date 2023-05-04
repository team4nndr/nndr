<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 기능 : 회원 의견</title>
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/admin/feedback.css">
    <script src="https://kit.fontawesome.com/9c2aaccfe5.js" crossorigin="anonymous"></script>
</head>
<body>
    <%-- 상단바 메뉴 --%>
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
    
    <main>
        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

        <%-- 회원 의견 --%>
        <section id="content">
            <form action="#" method="GET" class="search_wrap">
                <span>의견검색</span>
                <div class="search_box">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" name="inputSearch" placeholder="의견번호/회원번호/회원이름/내용 검색">
                </div>
                <button id="submit">검색</button>
                <!-- <select name="" id="" placeholder="처리상태">
                    <option value="전체">전체</option>
                    <option value="처리중">처리중</option>
                    <option value="처리완료">처리완료</option>
                </select> -->

                <!-- <button class="condition_select">
                    <span>처리상태</span>
                    <i class="fa-solid fa-angle-down"></i>
                    <i class="fa-solid fa-angle-up"></i>
                </button>
                <ul class="listbox" id="listbox">
                    <li><button class="list">전체</button></li>
                    <li><button class="list">처리중</button></li>
                    <li><button class="list">처리완료</button></li>
                </ul> -->
            </form>
            <div class="board-list-wrap">
                <div class="board-list">
                    <div class="top">
                        <div class="feedback-no">의견번호</div>
                        <div class="user-no">회원번호</div>
                        <div class="feedback-content">내용</div>
                        <div class="regist-date">접수일</div>
                        <div class="complete-date">처리일</div>
                        <div class="feedback-condition">처리상태</div>
                    </div>
                    <a href="feedback/detail" class="row">
                        <div class="feedback-no">2</div>
                        <div class="user-no">53</div>
                        <div class="feedback-content">페이스북이랑 너무 똑같아요 베낀 거 아닌가요?</div>
                        <div class="regist-date">2023-04-14</div>
                        <div class="complete-date">2023-04-14</div>
                        <div class="feedback-condition">
                            <div class="data feedback-condition-icon in-porgress">처리중</div>
                            <div class="data feedback-condition-icon complete">처리완료</div>
                        </div>
                    </a>
                    <a href="feedback/detail" class="row">
                        <div class="feedback-no">1</div>
                        <div class="user-no">28</div>
                        <div class="feedback-content">의견은 이런 식으로 보여질것입니다 이렇게 이렇게 그리고 글이 길어...</div>
                        <div class="regist-date">2023-04-13</div>
                        <div class="complete-date">2023-04-13</div>
                        <div class="feedback-condition">
                            <div class="data feedback-condition-icon in-porgress">처리중</div>
                            <div class="data feedback-condition-icon complete">처리완료</div>
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