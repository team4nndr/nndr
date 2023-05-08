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

    <header>
    <div class="flex-container">
        <div class="main-container1">
            <img src="../images/cats/cat2.jpg" alt="로고"id="backLogo">
            <div class="item3">
                <div class="myname1">
                    <a class ="backLogobutton" href=""> 커버 사진 추가</a>
                </div>
            </div>
            <div class="item4">
                <div class="main1-1">
                    <a href="#"><img src="../images/cats/cat2.jpg" alt="로고"id="homeLogo"></a>
                </div>
                <h2 class="name">${infoMember.memberName}</h2>
                
                
                <div class="main1-2">
                    <div class="myname2">
                        <button class ="storypuls" href=""> 친구추가
                        </button>
                        <a class ="plo" href=""> 프로필 편집
                        </a>
                    </div>
                </div>
            </div>
            
            <nav class="item5">
                <li class="main-li"><a class="main-li" href="/personalFeed/${infoMember.memberNo}"> 게시물</a></li>
                    <li class="main-li"><a class="main-li " href="/personalFeedInfo/${infoMember.memberNo}">정보</a></li>
                        <li class="main-li"><a class="main-li" href="/personalFeedFriend/${infoMember.memberNo}">친구</a></li>
                            <li class="main-li pick"><a class="main-li" href="/personalFeedPic/${infoMember.memberNo}">사진</a></li>
                <div></div>
            </nav>
        </div>
    
        <div class="main-container2">
            <div class="item1-1"></div>
            <div class="info">
                <div class="imset">
                    <div  class="imop">
                        <div id="na"><h2>사진</h2></div>
                        <div id="imBtn"><button class="info-2-1">사진추가</button></div>
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
            </div>
    </div>
</header>
<script src="/resources/js/personalFeed/personalFeed.js"></script>
</body>
</html>



