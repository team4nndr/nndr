<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <link rel="stylesheet" href="/resources/css/personalFeed/personalFeed.css">
        <link rel="stylesheet" href="/resources/css/mainFeed/main.css">
    <link rel="stylesheet" href="/resources/css/mainFeed/feed.css">
    
    <%-- 배경화면 --%>
    <div id="memberInfo" data-sender = "${loginMember.memberNo}" data-profile = "${infoMember.infoProfilePath}${infoMember.infoProfile}" data-sendername = "${infoMember.memberName}" data-reciver = "${infoMember.memberNo}"></div>
        <div class="main-container1" >
            <c:if test="${infoMember.memberNo eq loginMember.memberNo}" > <%-- 해당페이지 유저와 로그인멤버 일치 ㅇ--%>
                <c:if test="${empty infoMember.infoBack}" >
                    <div id="backChg"><img src="/resources/images/topMenu/페이지 시작화면.gif" alt="로고"id="backLogo" ></div>
                </c:if>
                <c:if test="${not empty infoMember.infoBack}" >
                    <div id="backChg" width="1250px" height="703px" style="position: relative;"><img width="1250px" height="703px" src="${infoMember.infoBackPath}${infoMember.infoBack}" alt="로고"id="backLogo" ></div>
                </c:if>
            </c:if>
            <c:if test="${infoMember.memberNo ne loginMember.memberNo}" > <%-- 해당페이지 유저와 로그인멤버 일치 ㄴ--%>
                <c:if test="${empty infoMember.infoBack}" >
                    <div><img src="/resources/images/topMenu/페이지 시작화면.gif" alt="로고"id="backLogo"></div>
                </c:if>
                <c:if test="${not empty infoMember.infoBack}" >
                    <div id="backChg" width="1250px" height="703px" style="position: relative;"><img width="1250px" height="703px" src="${infoMember.infoBackPath}${infoMember.infoBack}" alt="로고"id="backLogo" ></div>
                </c:if>
            </c:if>
            <div class="item3">
                <div class="myname1">
                </div>
            </div>
            <div class="item4">
            <%-- 프로필 편집 --%>
                <div class="main1-1">
                    <c:if test="${infoMember.memberNo eq loginMember.memberNo}" ><%-- 해당페이지 유저와 로그인멤버 일치 ㅇ--%>
                        <c:if test="${empty infoMember.infoProfile}" >
                            <div id="profileChg"><img src="/resources/images/common/user-deafult.png" alt="로고"id="homeLogo"></div>
                        </c:if>
                        <c:if test="${not empty infoMember.infoProfile}" >
                            <div id="profileChg"><img src="${infoMember.infoProfilePath}${infoMember.infoProfile}" alt="로고"id="homeLogo"></div>
                        </c:if>
                    </c:if>    
                    <c:if test="${infoMember.memberNo ne loginMember.memberNo}" ><%-- 해당페이지 유저와 로그인멤버 일치 ㄴ--%>
                        <c:if test="${empty infoMember.infoProfile}" >
                            <div id="notP"><img src="/resources/images/common/user-deafult.png" alt="로고"id="homeLogo"></div>
                        </c:if>
                        <c:if test="${not empty infoMember.infoProfile}" >
                            <div id="notP"><img src="${infoMember.infoProfilePath}${infoMember.infoProfile}" alt="로고"id="homeLogo"></div>
                        </c:if>
                    </c:if>    
                </div>
                <h2 class="perName">${infoMember.memberName}</h2>
                <div class="main1-2">
                    <div class="myname2">
                        <c:if test="${infoMember.memberNo ne loginMember.memberNo}" > <%-- 해당페이지 유저와 로그인멤버 일치 ㄴ--%>
                        <%-- 친구 버튼 관련 --%>
                            <c:if test="${personalInfo.setFriendReq eq 'Y'}">
                                <c:if test="${not empty friendcheck}">
                                    <c:if test="${friendcheck.friendFl eq 'Y'}">
                                        <div class ="storypuls friendDel" id="perAddFriend"data-seNo="${loginMember.memberNo}" data-reNo="${infoMember.memberNo}">친구 끊기</div>
                                    </c:if>
                                    <c:if test="${friendcheck.friendFl eq 'N'}">
                                        <c:if test="${friendcheck.friendSender eq loginMember.memberNo}">
                                            <div class ="storypuls friendAdd" id="perAddFriend"data-seNo="${loginMember.memberNo}" data-reNo="${infoMember.memberNo}">신청 취소</div>
                                        </c:if>
                                        <c:if test="${friendcheck.friendReciver eq loginMember.memberNo}">
                                            <div class ="storypuls friendAccept" id="perAddFriend"data-seNo="${loginMember.memberNo}" data-reNo="${infoMember.memberNo}">친구 수락</div>
                                        </c:if>
                                    </c:if>
                                </c:if>
                                <c:if test="${empty friendcheck}">
                                    <div class ="storypuls noFriend" id="perAddFriend"data-seNo="${loginMember.memberNo}" data-reNo="${infoMember.memberNo}">친구 추가</div>
                                </c:if>
                            </c:if>
                            <c:if test="${personalInfo.setFriendReq eq 'N'}">
                                <c:if test="${friendcheck.friendFl eq 'N'}">
                                    <c:if test="${friendcheck.friendReciver eq loginMember.memberNo}">
                                        <div class ="storypuls friendAccept" id="perAddFriend"data-seNo="${loginMember.memberNo}" data-reNo="${infoMember.memberNo}">친구 수락</div>
                                    </c:if>
                                </c:if>
                                <c:if test="${friendcheck.friendFl eq 'Y'}">
                                    <div class ="storypuls friendDel" id="perAddFriend"data-seNo="${loginMember.memberNo}" data-reNo="${infoMember.memberNo}">친구 끊기</div>
                                </c:if>
                            </c:if>
                        </c:if>


                        <c:if test="${infoMember.memberNo eq loginMember.memberNo}" ></c:if><%-- 해당페이지 유저와 로그인멤버 일치 ㅇ--%>
                            <div>
                                <c:if test="${infoMember.memberNo eq loginMember.memberNo}" >
                                    <div id="backPlus" class ="plo"> 커버 사진 추가</div>
                                    <div id="cv-set">
                                        <div class ="cv" id="choback" data-no="${loginMember.memberNo}">이미지 선택</div> <%-- 배경화면 선택 --%>
                                        <%-- <div class ="cv" id="uploadback" data-no="${loginMember.memberNo}">이미지 업로드</div> --%>
                                        <div class ="cv" id="delback" data-no="${loginMember.memberNo}">이미지 삭제</div> <%-- 배경화면 삭제 --%>
                                    </div>
                                </c:if>
                            </div>
                        <%-- </c:if> --%>
                    </div>
                </div>
            </div>
            
            <nav class="item5">
            <%-- 개인피드 탭 분류 --%>
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
    <%-- 프로필 변경 --%>
        <div id="profile-modali">
            <div class="flexall"><div id="what-profile" >프로필 변경</div> </div>
            <br>
            <div id="profile-asd">
                <div id=profile-set class="profileset">
                        <img src="/resources/images/common/user-deafult.png" alt="" class="profi" data-memberno = "${loginMember.memberNo}" data-imgpath = "/resources/images/common" data-imgrename = "/user-deafult.png">
                    <c:forEach items="${imgSet}" var="i">
                        <img src="${i.imgPath}${i.imgRename}" alt="" class="profi" data-boardno = "${i.boardNo}" data-memberno = "${loginMember.memberNo}" data-imgpath = "${i.imgPath}" data-imgrename = "${i.imgRename}">
                    </c:forEach>
                </div>
            </div>
            <p class="pcontroller">
                <!-- &lang: 왼쪽 방향 화살표
                &rang: 오른쪽 방향 화살표 -->
                <span class="pofileprev">&lang;</span>  
                <span class="pofilenext">&rang;</span>
            </p>
        </div>

<%-- 배경화면 변경 --%>
    </div><div id="back-modal">
    </div>
        <div id="back-modali">
            <div id="what-back" >배경화면 변경</div>
            <br>
            <div id="back-asd">
                <div id=back-set class="backset">
                    <c:forEach items="${imgSet}" var="i">
                        <img src="${i.imgPath}${i.imgRename}" class="backi" data-boardno = "${i.boardNo}" data-memberno = "${loginMember.memberNo}" data-imgpath = "${i.imgPath}" data-imgrename = "${i.imgRename}" >
                    </c:forEach>
                </div>
            </div>
            <p class="backcontroller">
                <!-- &lang: 왼쪽 방향 화살표
                &rang: 오른쪽 방향 화살표 -->
                <span class="backprev">&lang;</span>  
                <span class="backnext">&rang;</span>
            </p>
        </div>
    </div>
    <%-- <jsp:include page="/WEB-INF/views/personalFeed/perFeedChat.jsp"/> --%>
<script src="/resources/js/personalFeed/personalFeed.js"></script>
<script src="/resources/js/personalFeed/personalFeedHeader.js"></script>
<script src="/resources/js/personalFeed/personalFeedChat.js"></script>