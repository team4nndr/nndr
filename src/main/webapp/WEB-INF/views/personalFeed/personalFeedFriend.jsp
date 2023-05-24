<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="/resources/css/personalFeed/personalFeed.css">
    <link rel="shortcut icon" href="#" />
</head>
<body>
<div id="all"></div>
	<jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
	<jsp:include page="/WEB-INF/views/personalFeed/personalFeedHeader.jsp" /> 
    <style>
         .item5 > li:nth-child(3){
            border-bottom: 3px solid #56A8C5;
        }
    </style>
    
            <div class="main-container2">
                <div class="item1-1"></div>
                <div class="info">
                    <div class="imset">
                        <div  class="imop">
                            <div id="na"><h2>친구</h2></div>
                            <div id="imBtn"><a class="info-2-1" href="/friend/recom">친구추가</a></div>
                        </div>
                            <c:forEach items="${friendList}" var="i" begin="0" end="2">
                                <c:if test="${empty i.profileImage}">
                                    <a href="/personalFeed/${i.memberNo}">
                                        <div class="who">
                                            <div class="who-pic"><img class="who-pic" src="/resources/images/common/user-default.png" alt="로고"></div>
                                            <div class="who-name">${i.memberName}</div>
                                        </div>
                                    </a>
                                </c:if>
                                <c:if test="${not empty i.profileImage}">
                                    <a href="/personalFeed/${i.memberNo}">
                                        <div class="who">
                                            <div class="who-pic"><img class="who-pic" src="${i.profileImage}" alt="로고"></div>
                                            <div class="who-name">${i.memberName}</div>
                                        </div>
                                    </a>
                                </c:if>
                            </c:forEach>
                    </div>
                </div>
            
            <script src="/resources/js/personalFeed/personalFeed.js"></script>
</body>
</html>



