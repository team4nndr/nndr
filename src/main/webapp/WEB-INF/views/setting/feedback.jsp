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
    <link rel="stylesheet" href="/resources/css/setting/feedback.css">
    <script src="https://kit.fontawesome.com/9c2aaccfe5.js" crossorigin="anonymous"></script>
</head>
<body>
    <%-- 상단바 메뉴 --%>
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
    
    <main>
        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/setting/sidebar.jsp" />

        <%-- 회원 의견 상세 페이지 --%>
        <div class="modal show">
            <div class="modal-body">
                <section class="modalTop">
                    <span class="title">너나들이 개선을 위해 의견 보내기</span>
                    <button type="button" class="close cancelBtn"></button>
                </section>
                <hr>
                <section class="modalContent" id="modalContent1">
                    <div class="title">어떻게 개선할 수 있을까요?</div>
                    <textarea id="feedbackContent" placeholder="최대한 자세히 적어주세요..."></textarea>
                    <div>
                        더 나은 제품을 만드는 데 도움이 될 만한 의견이 있다면 알려주세요. 
                        특정 문제를 해결하기 위해 도움이 필요한 경우 관리자에게 개별적으로 연락주세요.
                        <br><i class="fa-regular fa-envelope"></i>
                        admin@gamil.com
                    </div>
                </section>
                <section class="modalBottom" id="modalBottom1">
                    <button type="button" class="cancelBtn" id="cancelBtn">취소</button>
                    <button class="reverse" id="submitBtn" disabled>제출</button>
                    <!-- 제출버튼 누르면 ajax로 DB에 데이터 전송하기..! -->
                </section>

                <section class="modalContent" id="modalContent2">
                    <div class="title">의견이 성공적으로 제출되었습니다.</div>
                </section>
                <section class="modalBottom" id="modalBottom2">
                    <button class="reverse" id="cancelBtn2">닫기</button>
                    <!-- 여기서 창 닫고나면 설정 > 일반 화면으로 이동 -->
                </section>
            </div>
        </div>
    </main>
    
    <script>
        const memberNo = "${loginMember.memberNo}";
    </script>
    <!-- <script src="../../js/setting/setting.js"></script> -->
    <script src="/resources/js/setting/feedback.js"></script>
</body>
</html>