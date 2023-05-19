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
    <header>
        <jsp:include page="/WEB-INF/views/topMenu/header.jsp" /> 
        <jsp:include page="/WEB-INF/views/personalFeed/personalFeedHeader.jsp" /> 
        <style>
            .item5 > li:nth-child(4){
                border-bottom: 3px solid #56A8C5;
            }
        </style>
    </header>
        <div class="main-container2">
            <div class="item1-1"></div>
            <div class="info">
                <div class="imset">
                    <div  class="imop">
                        <div id="na"><h2>사진</h2></div>
                        <div id="imBtn"><button class="info-2-1">사진추가</button></div>
                    </div>
                    <div id="imgset">
                            <c:forEach items="${imgSet}" var="i">
                                <div><img src="${i.imgPath}${i.imgRename}" alt="" class="im" data-boardNo = "${i.boardNo}"></div>
                            </c:forEach>
                        
                    </div>
                </div>
            </div>
            </div>
    </div>
</header>
<script src="/resources/js/personalFeed/personalFeed.js"></script>
</body>
</html>



