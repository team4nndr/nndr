<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 기능</title>
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/admin/feedback_detail.css">
    <script src="https://kit.fontawesome.com/9c2aaccfe5.js" crossorigin="anonymous"></script>
</head>
<body>

    <%-- 상단바 메뉴 --%>
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
    
    <main>
        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

        <%-- 회원 의견 상세 페이지 --%>
        <form action="/admin/feedback/${feedback.feedbackNo}/confirm" method="POST" id="content">
            <button type="button" id="backBtn" class="back">
                <i class="fa-solid fa-arrow-left"></i>
                <span>뒤로가기</span>                
            </button>
            <div id="details">
                <div id="feedbackUserSection">
                    <div class="row">
                        <span class="title">의견번호</span>
                        <span class="data">${feedback.feedbackNo}</span>
                    </div>
                    <div class="row">
                        <span class="title">접수회원번호</span>
                        <span class="data">${feedback.memberNo} (${feedback.memberName})</span>
                    </div>
                    <div class="row">
                        <span class="title">접수일</span>
                        <span class="data">${feedback.feedbackDate}</span>
                    </div>
                    <div class="row">
                        <span class="title">처리상태</span>

                        <c:choose>
                            <c:when test="${feedback.confirmFlag == 'N'}">
                                <div class="data feedback-condition in-porgress">처리중</div>
                            </c:when>
                            <c:otherwise>
                                <div class="data feedback-condition complete">처리완료</div>
                                <div class="data complete-date">(처리일시 : <span>${feedback.confirmDate}</span>)</div>
                            </c:otherwise>
                        </c:choose>

                    </div class="row">
                    <div id="feedbackContent" class="data">${feedback.feedbackContent}</div>
                </div>
                <div id="feedbackAdminSection" class="row">
                    <span class="title">처리의견</span>
                    <c:choose>
                        <c:when test="${feedback.confirmFlag == 'N'}">
                            <textarea name="adminComment" id="adminComment" placeholder="처리의견을 작성해주세요..."></textarea>
                        </c:when>
                        <c:otherwise>
                            <div id="adminComment">${feedback.adminComment}</div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <input type="hidden" name="adminNo" value="${loginMember.memberNo}">
                <input type="hidden" name="cp" value="${param.cp}">
            </div>
            <div id="bottom">
                <button type="button" class="back">목록으로</button>
                <button type="submit" class="submit" id="feedbackSubmit" disabled>처리하기</button>
            </div>
        </form>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/admin/admin.js"></script>

</body>
</html>