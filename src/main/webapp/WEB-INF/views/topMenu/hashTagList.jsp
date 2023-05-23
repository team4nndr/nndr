<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NNDR :: 너나들이</title>

    <link rel="stylesheet" href="/resources/css/mainFeed/sidebar.css">
    <link rel="stylesheet" href="/resources/css/mainFeed/main.css">
    <link rel="stylesheet" href="/resources/css/mainFeed/feed.css">

</head>
<body>
    <!-- 상단바 -->
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp"/>

    <main id="mainFeedGridContainer">

        <%-- Grid 1 : 사이드바(왼쪽) --%>
        <jsp:include page="/WEB-INF/views/mainFeed/sidebarL.jsp"/>
        
        <!-- Grid 2 : 중심 내용  -->
        <section class="mainView">
        
            <%-- 해시태그 연관 검색어 입력 시 태그 내용 입력된 부분--%>
            <div class="hashtag-keyword-box">
                <%-- 피드 작성 --%>
                <div id="hashtag-keyword">
                </div>
                
                <%-- 피드 목록 --%>
                <jsp:include page="/WEB-INF/views/mainFeed/feedList.jsp"/>
            </div>

        </section>

        <%-- Grid 3 : 사이드바(오른쪽) --%>
        <jsp:include page="/WEB-INF/views/mainFeed/sidebarR.jsp"/>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/mainFeed/main.js"></script>
    <script src="/resources/js/mainFeed/reply.js"></script>
</body>
</html>