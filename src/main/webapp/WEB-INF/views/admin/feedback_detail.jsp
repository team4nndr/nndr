<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <section id="content">
            <button type="button" id="backBtn" class="back">
                <i class="fa-solid fa-arrow-left"></i>
                <span>뒤로가기</span>                
            </button>
            <div id="details">
                <div id="feedbackUserSection">
                    <div class="row">
                        <span class="title">의견번호</span>
                        <span class="data">2</span>
                    </div>
                    <div class="row">
                        <span class="title">접수회원번호</span>
                        <span class="data">54</span>
                    </div>
                    <div class="row">
                        <span class="title">접수일</span>
                        <span class="data">2023-04-20</span>
                    </div>
                    <div class="row">
                        <span class="title">처리상태</span>
                        <div class="data feedback-condition in-porgress">처리중</div>
                        <div class="data feedback-condition complete">처리완료</div>
                        <div class="data complete-date">처리일시 : <span>2023-04-20</span></div>
                    </div class="row">
                    <div id="feedbackContent" class="data"><span>페이스북이랑 너무 똑같아요 배낀거 아닌가요?</span></div>
                </div>
                <div id="feedbackAdminSection" class="row">
                    <span class="title">처리의견</span>
                    <textarea name="adminComment" id="adminComment" placeholder="처리의견을 작성해주세요..."></textarea>
                </div>
            </div>
            <div id="bottom">
                <button type="button" class="back">뒤로가기</button>
                <button type="submit" id="submit" disabled>처리완료</button>
            </div>
        </section>
    </main>

    <script src="/resources/js/admin/admin.js"></script>
    <script>
        const adminComment = document.getElementById('adminComment');
        adminComment.addEventListener('input', () => {
            if( adminComment.value.length > 0 ) {
                document.getElementById('submit').disabled = false;
            } else {
                document.getElementById('submit').disabled = true;
            }
        });
    </script>
</body>
</html>