<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="hobbyList"  value="${HobbyMap.hobbyList}"/>
<c:set var="perHobbyList"  value="${HobbyMap.perhobbyList}" />


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="/resources/css/personalFeed/personalFeed.css">
    <link rel="stylesheet" href="/resources/css/mainFeed/reply.css">
    <link rel="stylesheet" href="/resources/css/mainFeed/feed.css">
    <link rel="shortcut icon" href="#" />
    
</head>
<body>
<div id="all"></div>
	<jsp:include page="/WEB-INF/views/topMenu/header.jsp" /> 
	<jsp:include page="/WEB-INF/views/personalFeed/personalFeedHeader.jsp" /> 
    <style>
        .item5 > li:nth-child(1){
            border-bottom: 3px solid #56A8C5;
        }
    </style>
    <%-- 알 수도 있는 사람 파트 --%>
        <div class="main-container2">
            <c:if test="${infoMember.memberNo eq loginMember.memberNo}" > 
                <div id="fr-border">
                    <div class="item1-2">
                        <h4>&nbsp;&nbsp; 알 수도 있는 사람</h4>
                    </div>
                    <div class="item1-3">
                        <c:forEach items="${friendSuggestion}" var="i"> <%-- 프로필 없을 때 --%>
                            <c:if test="${empty i.profileImage}">
                                <div class="who">
                                    <a href="/personalFeed/${i.memberNo}" class="aTag">
                                        <div class="who-pic"><img class="who-pic" src="/resources/images/common/user-default.png" alt="로고"></div>
                                        <div class="who-name">${i.memberName}</div>
                                    </a>
                                    <div class="add-friend">
                                        <li><button class="add-friend2" id="addf" data-seNo="${loginMember.memberNo}" data-reNo="${i.memberNo}">친구 추가</button></li>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${not empty i.profileImage}"> <%-- 프로필 있을 때 --%>
                                <div class="who">
                                    <a href="/personalFeed/${i.memberNo}"  class="aTag">
                                        <div class="who-pic"><img class="who-pic" src="${i.profileImage}" alt="로고"></div>
                                        <div class="who-name">${i.memberName}</div>
                                    </a>
                                    <div class="add-friend">
                                        <li><button class="add-friend2" id="addf" data-seNo="${loginMember.memberNo}" data-reNo="${i.memberNo}">친구 추가</button></li>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        
                    </div>
                    <p class="controller">
                        <span class="prev">&lang;</span>  
                        <span class="next">&rang;</span>
                    </p>
                </div>
            </c:if>
            <div class=" item2-1">
            <%-- 취미 부분 --%>
                <div class=" item2-2">
                    <%-- 내 소개 --%>
                    <div class="item2-2-1">
                        <div class="so"><h2>&nbsp;&nbsp;소개</h2></div>
                        <div>
                            <div id="intro-my">${infoMember.infoIntro}</div>
                            <%-- 모달창 --%>
                            <div id="input-intro">
                                <form action="infoIntro" method="get" >
                                    <textarea type="text" name="infoIntro" id="intro-text" cols="50" rows="3" ></textarea><br>
                                    <div id="texta"></div>
                                    <div id="public">
                                        <div>&nbsp;전체 공개</div>
                                        <div id="btn-set">
                                            <button class="in-btn" id="intro-save" type="submit" >저장</button>
                                            <button class="in-btn" id="intro-can" type="button" onclick="infoCan()">취소</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <c:if test="${infoMember.memberNo eq loginMember.memberNo}" > 
                                <button class="intro-1" onclick="infoMy()">소개수정</button>
                            </c:if>
                        </div>
                        <%-- 내 정보 조회 및 수정 --%>
                        <div id="intro-infom">
                            <div id="info-job">${infoMember.infoJob}</div>
                            <div id="info-college">${infoMember.infoCollege}</div>
                            <div id="info-high">${infoMember.infoHigh}</div>
                            <div id="info_residence">${infoMember.infoResidence}</div>
                            <div id="info_birth">${infoMember.infoBirthplace}</div>
                            <c:if test="${infoMember.romanticYn eq 'y'}" >
                                <div id="info_romantic">
                                    <div>연애/결혼 분류</div>
                                    <div href="#">연애/결혼 상대방</div>
                                    <div>연애/결혼 시작일</div>
                                </div>
                            </c:if>
                        </div>
                        <c:if test="${infoMember.memberNo eq loginMember.memberNo}" > 
                            <div class="intro-1"  id="info-link"><a id="info-link" href="/personalFeedInfo/${infoMember.memberNo}">상세정보 수정</a></div>
                        </c:if>
                        <div>
                        <%-- 취미 --%>
                            <div id="intro-hobby">
                                <h3 id=zzs>관심있는 취미</h3>
                                <div id="dhho" style="display:none">
                                    <c:forEach items="${hobbyList}" var="hobby">${hobby.hobby}　</c:forEach>
                                </div>
                                <div id="myhho">
                                    <c:forEach items="${perHobbyList}" var="hobby">${hobby.hobby}　</c:forEach>
                                </div>
                            </div>
                            <%-- 취미 수정 버튼 --%>
                            <c:if test="${infoMember.memberNo eq loginMember.memberNo}" > 
                                <div class="hobby-main hobby-center intro-1">
                                    <input type="checkbox" id="add-hobby">
                                    <label class="hobby-btn" id="login" for="add-hobby">취미 수정</label>
                                    <div class="hobby-box hobby-center">
                                        <h2>취미</h2>
                                        <%-- 취미 모달창 --%>
                                        <div id="hobby-list">
                                            <c:forEach items="${hobbyList}" var="hobby">
                                                <c:forEach items="${perHobbyList}" var="perHobby">
                                                    <c:if test="${hobby.hobby eq perHobby.hobby}">
                                                        <c:set var="ch"  value="checked"/>
                                                    </c:if>
                                                </c:forEach>
                                                <div>
                                                    <input class="hobby-check" type="checkbox" name="hobbychecked" id="${hobby.hobby}" ${ch}>
                                                    <label for="${hobby.hobby}">${hobby.hobby}</label> 
                                                </div>
                                                <c:remove var="ch" />
                                            </c:forEach>
                                        </div>
                                        <div id="hobt">
                                            <button id="hobby-checked" class="hobby-btn" type="button">
                                                <label class="btn-sty"  for="add-hobby">확인</label>
                                            </button>
                                            <button id="hobby-no" class="hobby-btn"  type="button">
                                                <label class="btn-sty"  for="add-hobby">닫기</label>
                                            </button>
                                        </div>
                                    </div>
                                    <label class="hobby-overlay" for="add-hobby"></label>
                                </div>
                            </c:if>
                        <br>
                        </div>
                    </div>
                
                    <br>
                    <div class="item2-2-2">
                    <%-- 사진 목록--%>
                        <div class="item2-2-2-1" >
                            <div class="so">
                                <h3>&nbsp;&nbsp;사진</h3>
                            </div>
                            <a class="my-info" href="/personalFeedPic/${infoMember.memberNo}">모든 사진 보기</a>
                        </div>
                        <div class="main-imset">
                            <c:forEach items="${imgSet}" var="i" begin="0" end="2">
                                <div id="main-im3"><img src="${i.imgPath}${i.imgRename}" alt="로고" class="main-im"></div>
                            </c:forEach>
                            <div class="something"></div>
                        </div>
                    </div>
                    <br>
                    <%-- 친구 목록 --%>
                    <div class="item2-2-2">
                        <div class="item2-2-2-1">
                        <div class="so">
                            <h3>&nbsp;&nbsp;친구</h3>
                        </div>
                        <a class="my-info" href="/personalFeedFriend/${infoMember.memberNo}">모든 친구 보기</a>
                    </div>
                        <div class="main-imset">
                            <c:forEach items="${friendList}" var="i" begin="0" end="2">
                                    <c:if test="${empty i.profileImage}">
                                        <a href="/personalFeed/${i.memberNo}" id="main-im3"><img src="/resources/images/common/user-default.png" alt="로고" class="main-im"></a>
                                    </c:if>
                                    <c:if test="${not empty i.profileImage}">
                                        <a href="/personalFeed/${i.memberNo}" id="main-im3"><img src="${i.profileImage}" alt="로고" class="main-im"></a>
                                    </c:if>
                                
                            </c:forEach>
                            <div class="something"></div>
                        </div>
                    </div>
                </div>
                <div class="item item2-3">
            <%-- 피드 작성 + 피드 목록 --%>
                        <div class="feed-list">
                            <%-- 피드 작성 --%>
                            <c:if test="${infoMember.memberNo eq loginMember.memberNo}">  <%-- 본인 일 때 --%>
                                <div id="newFeed">
                                    <c:if test="${empty loginMember.profileImage}">
                                        <img src="/resources/images/common/user-default.png" class="profile-image">
                                    </c:if>
                                    <c:if test="${not empty loginMember.profileImage}">
                                        <img src="${loginMember.profileImage}" class="profile-image" >
                                    </c:if>
                                    <p id="newFeedBtn">${loginMember.memberName}님, 무슨 생각을 하고 계신가요?</p>
                                    <%-- 피드 작성 모달 --%>
                                    <jsp:include page="/WEB-INF/views/personalFeed/pernewFeed.jsp"/>
                                </div>
                            </c:if>
                            <c:if test="${infoMember.memberNo ne loginMember.memberNo}"> <%-- 본인 x --%>
                                <c:if test="${infoMember.setFeedAuthority eq 'A'}">
                                    <div id="newFeed">
                                        <c:if test="${empty loginMember.profileImage}">
                                            <img src="/resources/images/common/user-default.png" class="profile-image">
                                        </c:if>
                                        <c:if test="${not empty loginMember.profileImage}">
                                            <img src="${loginMember.profileImage}" class="profile-image" >
                                        </c:if>
                                        <p id="newFeedBtn">${loginMember.memberName}님, 무슨 생각을 하고 계신가요?</p>
                                        <%-- 피드 작성 모달 --%>
                                        <jsp:include page="/WEB-INF/views/personalFeed/pernewFeed.jsp"/>
                                    </div>
                                </c:if>    
                                <c:if test="${infoMember.setFeedAuthority eq 'F'}">
                                    <c:if test="${friendcheck.friendFl eq 'Y'}">
                                        <div id="newFeed">
                                            <c:if test="${empty loginMember.profileImage}">
                                                <img src="/resources/images/common/user-default.png" class="profile-image">
                                            </c:if>
                                            <c:if test="${not empty loginMember.profileImage}">
                                                <img src="${loginMember.profileImage}" class="profile-image" >
                                            </c:if>
                                            <p id="newFeedBtn">${loginMember.memberName}님, 무슨 생각을 하고 계신가요?</p>
                                            <%-- 피드 작성 모달 --%>
                                            <jsp:include page="/WEB-INF/views/personalFeed/pernewFeed.jsp"/>
                                        </div>
                                    </c:if>    
                                </c:if>    
                            </c:if>

                            <%-- <c:if test="${personalInfo.setFriendReq eq 'Y'}"> --%>
                            <%-- 피드 목록 --%>

                            <jsp:include page="/WEB-INF/views/personalFeed/perFeedList.jsp"/>
                        </div>
                </div>
            </div>
        </div>
        
    <script src="/resources/js/personalFeed/personalFeed.js"></script>
    <script src="/resources/js/mainFeed/main.js"></script>
    <script src="/resources/js/mainFeed/reply.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
                        
</body>
</html>