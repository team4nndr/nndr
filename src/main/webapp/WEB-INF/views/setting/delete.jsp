<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/setting/setting.css">
    <link rel="stylesheet" href="/resources/css/setting/delete.css">
    <script src="https://kit.fontawesome.com/9c2aaccfe5.js" crossorigin="anonymous"></script>
</head>
<body>
    <%-- 상단바 메뉴 --%>
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
    
    <main>
        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/setting/sidebar.jsp" />

        <%-- 계정 삭제 페이지 --%>
        <section class="delete-container">

            <h3>회원 탈퇴</h3>

            <div class="content-box">
                <div class="delete-section">
                    <p>아쉬운 점이 있으셨다면</p> 
                    <p>너나들이가 발전할 수 있도록</p> 
                    <p> 의견을 보내주세요.</p> 
                    <a href="/setting/feedback"><button class="delete-btn reverse">의견 보내기</button></a>
                </div>
                <br><br><br><br>

                <form action="/setting/delete" method="post">
                    <div class="delete-section">
                        <p>정말로 계정을 삭제하시려면</p> 
                        <p>비밀번호를 입력하고</p> 
                        <p>탈퇴하기 버튼을 눌러주세요.</p> 
                        <p>
                            <div id="deletePasswdInput">
                                <input type="password" name="passwd" placeholder="비밀번호를 입력해주세요...">
                            </div>
                        </p>
                        <button class="delete-btn reverse">탈퇴하기</button>
                    </div>
                </form>
            </div>
            
        </section>
    </main>
    
    <script>
        const memberNo = "${loginMember.memberNo}";
    </script>
    <script src="/resources/js/setting/delete.js"></script>
</body>
</html>