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
                            <div id="imBtn"><button class="info-2-1">친구추가</button></div>
                        </div>
                        <div id="imgset">
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                            <div><img src="../images/cats/cat2.jpg" alt="" class="im"></div>
                        </div>
                    </div>
                </div>
            
            <script src="/resources/js/personalFeed/personalFeed.js"></script>
</body>
</html>



