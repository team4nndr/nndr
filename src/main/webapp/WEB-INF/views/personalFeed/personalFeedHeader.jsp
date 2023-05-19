<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <link rel="stylesheet" href="/resources/css/personalFeed/personalFeed.css">

    <%-- <div class="flex-container"> --%>
        <div class="main-container1">
            <c:if test="${infoMember.memberNo eq loginMember.memberNo}" > <%-- 일치 ㅇ--%>
                <c:if test="${empty infoMember.infoBack}" >
                    <div id="backChg"><img src="/resources/images/topMenu/페이지 시작화면.gif" alt="로고"id="backLogo"></div>
                </c:if>
                <c:if test="${not empty infoMember.infoBack}" >
                    <div id="backChg"><img src="${infoMember.infoBack}" alt="로고"id="backLogo"></div>
                </c:if>
            </c:if>
            <c:if test="${infoMember.memberNo ne loginMember.memberNo}" > <%-- 일치 ㄴ--%>
                <c:if test="${empty infoMember.infoBack}" >
                    <div><img src="/resources/images/topMenu/페이지 시작화면.gif" alt="로고"id="backLogo"></div>
                </c:if>
                <c:if test="${not empty infoMember.infoBack}" >
                    <div><img src="${infoMember.infoBack}" alt="로고"id="backLogo"></div>
                </c:if>
            </c:if>
            <div class="item3">
                <div class="myname1">
                    <a class ="backLogobutton" class ="storypuls" href=""></a>
                </div>
            </div>
            <div class="item4">
                <div class="main1-1">
                    <c:if test="${infoMember.memberNo eq loginMember.memberNo}" >
                        <c:if test="${empty infoMember.infoBack}" >
                            <div id="profileChg"><img src="/resources/images/common/user-deafult.png" alt="로고"id="homeLogo"></div>
                        </c:if>
                        <c:if test="${not empty infoMember.infoBack}" >
                            <div id="profileChg"><img src="${infoMember.infoBack}" alt="로고"id="homeLogo"></div>
                        </c:if>
                    </c:if>    
                    <c:if test="${infoMember.memberNo ne loginMember.memberNo}" >
                        <c:if test="${empty infoMember.infoBack}" >
                            <div id="notP"><img src="/resources/images/common/user-deafult.png" alt="로고"id="homeLogo"></div>
                        </c:if>
                        <c:if test="${not empty infoMember.infoBack}" >
                            <div id="notP"><img src="${infoMember.infoBack}" alt="로고"id="homeLogo"></div>
                        </c:if>
                    </c:if>    
                </div>
                <h2 class="name">${infoMember.memberName}</h2>
                <div class="main1-2">
                    <div class="myname2">
                        <c:if test="${infoMember.memberNo ne loginMember.memberNo}" > 
                            <c:if test="${not empty friendcheck}">
                                <div class ="storypuls friendAdd" id="perAddFriend"data-seNo="${loginMember.memberNo}" data-reNo="${infoMember.memberNo}">친구 신청 중</div>
                            </c:if>
                            <c:if test="${empty friendcheck}">
                                <div class ="storypuls" id="perAddFriend"data-seNo="${loginMember.memberNo}" data-reNo="${infoMember.memberNo}">친구 추가</div>
                            </c:if>
                        </c:if>
                        <c:if test="${infoMember.memberNo eq loginMember.memberNo}" >
                            <a class ="plo" href=""> 커버 사진 추가</a>
                        </c:if>
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
    <div id="profile-modal">
    </div>
        <%-- <form action="/personalFeedInfo/${no}" method="POST"> --%>
        <div id="profile-modali">
            <div id="what-profile" >프로필 변경</div>
            <br>
            <div id="profile-asd">
                <div id=profile-set class="profileset">
                    <c:forEach items="${imgSet}" var="i">
                        <img src="${i.imgPath}${i.imgRename}" alt="" class="profi" data-boardNo = "${i.boardNo}">
                    </c:forEach>
                </div>
            </div>
            <%-- </form> --%>
            <p class="pcontroller">
                <!-- &lang: 왼쪽 방향 화살표
                &rang: 오른쪽 방향 화살표 -->
                <span class="pofileprev">&lang;</span>  
                <span class="pofilenext">&rang;</span>
            </p>
        </div>
    </div>


<script src="/resources/js/personalFeed/personalFeed.js"></script>
<script src="/resources/js/personalFeed/personalFeedHeader.js"></script>