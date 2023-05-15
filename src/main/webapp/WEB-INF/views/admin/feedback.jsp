<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="feedbackList" value="${map.feedbackList}"/>

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

                    <c:forEach var="feedback" items="${feedbackList}">

                        <a href="/admin/feedback/${feedback.feedbackNo}?cp=${pagination.currentPage}" class="row">
                            <div class="feedback-no">${feedback.feedbackNo}</div>
                            <div class="user-no">${feedback.memberNo}</div>

                            <c:choose>
                                <c:when test="${fn:length(feedback.feedbackContent) > 40}">
                                    <div class="feedback-content">${fn:substring(feedback.feedbackContent, 0, 40)}...</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="feedback-content">${feedback.feedbackContent}</div>
                                </c:otherwise>
                            </c:choose>
                            
                            <div class="regist-date">${fn:substring(feedback.feedbackDate, 0, 10)}</div>
                            <div class="complete-date">${fn:substring(feedback.confirmDate, 0, 10)}</div>
                            <div class="feedback-condition">
                            <c:choose>
                                <c:when test="${feedback.confirmFlag == 'N'}">
                                    <div class="data feedback-condition-icon in-porgress">처리중</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="data feedback-condition-icon complete">처리완료</div>
                                </c:otherwise>
                            </c:choose>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>
            <div class="board-page">
                <a href="?cp=1" class="first-page"><i class="fa-solid fa-angles-left fa-xs"></i></a>
                <a href="?cp=${pagination.prevPage}" class="prev-page"><i class="fa-solid fa-angle-left fa-xs"></i></a>

                <!-- 특정 페이지로 이동 -->
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
                    <c:choose>
                        <%-- 현재 페이지 --%>
                        <c:when test="${i == pagination.currentPage}">
                            <a class="current-page">${i}</a>
                        </c:when>

                        <%-- 현재 페이지를 제외한 나머지 페이지 --%>
                        <c:otherwise>
                            <a href="?cp=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <a href="?cp=${pagination.nextPage}" class="next-page"><i class="fa-solid fa-angle-right fa-xs"></i></a>
                <a href="?cp=${pagination.maxPage}" class="last-page"><i class="fa-solid fa-angles-right fa-xs"></i></a>
            </div>
        </section>
    </main>

    <script src="/resources/js/admin/admin.js"></script>
</body>
</html>