<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="memberList" value="${map.memberList}"/>

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

                    <c:forEach var="member" items="${memberList}">
                        <a href="/admin/user/${member.memberNo}" class="row">
                            <div class="user-no">${member.memberNo}</div>
                            <div class="user-name">
                                <c:choose>
                                    <c:when test="${empty member.profileImage}">
                                        <img src="/resources/images/common/user-deafult.png" class="profile-img">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${member.profileImage}" class="profile-img">
                                    </c:otherwise>
                                </c:choose>
                                <span>${member.memberName}</span>
                            </div>
                            <div class="email">${member.memberEmail}</div>
                            <div class="regist-date">${member.enrollDate}</div>
                            <div class="account-condition">
                                <c:choose>
                                    <c:when test="${member.memberCode == 'N'}">
                                        <div class="normal">정상</div>
                                    </c:when>
                                    <c:when test="${member.memberCode == 'B'}">
                                        <div class="disabled">비활성화</div>
                                    </c:when>
                                    <c:when test="${member.memberCode == 'D'}">
                                        <div class="dropped">탈퇴</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="admin">관리자</div>
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