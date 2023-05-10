<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <link rel="stylesheet" href="/resources/css/personalFeed/personalFeed.css">

    <%-- <div class="flex-container"> --%>
        <div class="main-container1">
            <img src="/resources/images/topMenu/페이지 시작화면.gif" alt="로고"id="backLogo">
            <div class="item3">
                <div class="myname1">
                    <a class ="backLogobutton" class ="storypuls" href=""></a>
                </div>
            </div>
            <div class="item4">
                <div class="main1-1">
                    <a href="#"><img src="/resources/images/common/user-deafult.png" alt="로고"id="homeLogo"></a>
                </div>
                <h2 class="name">${infoMember.memberName}</h2>
                <div class="main1-2">
                    <div class="myname2">
                    <c:if test="${infoMember.memberNo ne loginMember.memberNo}" > 
                        <button class ="storypuls" href=""> 친구추가
                    </c:if>
                        </button>
                        <a class ="plo" href=""> 커버 사진 추가
                        </a>
                    </div>
                </div>
            </div>
            
            <nav class="item5">
                <li class="main-li"><a class="main-li" href="/personalFeed/${infoMember.memberNo}"> 게시물</a></li>
                <li class="main-li"><a class="main-li " href="/personalFeedInfo/${infoMember.memberNo}">정보</a></li>
                <li class="main-li"><a class="main-li" href="/personalFeedFriend/${infoMember.memberNo}">친구</a></li>
                <li class="main-li"><a class="main-li" href="/personalFeedPic/${infoMember.memberNo}">사진</a></li>
                <div></div>
            </nav>
                                
        </div> 
                
    <%-- </div> --%>


<script src="/resources/js/personalFeed/personalFeed.js"></script>