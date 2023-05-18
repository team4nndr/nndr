<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="/resources/css/mainFeed/sidebar.css">
    <link rel="stylesheet" href="/resources/css/mainFeed/main.css">
    <link rel="stylesheet" href="/resources/css/mainFeed/reply.css">

</head>
<body>
    <!-- 상단바 -->
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp"/>

    <main id="mainFeedGridContainer">

        <%-- Grid 1 : 사이드바(왼쪽) --%>
        <jsp:include page="/WEB-INF/views/mainFeed/sidebarL.jsp"/>
        
        <!-- Grid 2 : 중심 내용  -->
        <div class="mainView">

            <%-- 피드 작성 --%>

            <%-- 피드 목록 --%>
            <div class="centerArea-2">
            
            <c:forEach items="${boardList}" var="board">
                <div class="feed">

                    <!-- 나의 게시물 상단  -->
                    <section class="cTopArea">

                        <!-- 이미지 -->
                        <section class="cTopArea1">
                            <a href="#"><img src="/resources/images/common/user-default.png" class="wirter-profile-image"></a>
                        </section> 
                        
                        <!-- 이름 and 시간  -->
                        <section class="cTopArea2">
                            <a href="/personalFeed/${board.memberNo}" class="name change">${board.memberName}</a>
                            <a href="#" class="date change">${board.uploadDate}</a>
                        </section> 

                    </section>
                    
                    <hr>

                    <!--  나의 게시물 중간  -->
                    <div class="feedContent">

                        <section>${board.boardText}</section>
                        
                        <%-- 이미지가 있다면 --%>
                        <%-- <c:if test="${not empty board.imageList}" >
                            <c:set var="start" value="0"/>
                            <c:if test="${fn:length(board.imageList)>start}" >
                                <c:forEach var="i" begin="${start}" end="${fn:length(board.imageList)}">
                                    <div class="boardImg1">
                                        <c:set var="path" value="${board.imageList[i].imgPath}${board.imageList[i].imgReName}"/>
                                        <img src="${path}">
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:if> --%>

                    </div>

                    <hr>

                    <!--  나의 게시물 좋아요 등등등 -->
                    <section class="like">
                        <ul>
                            <li><a href="#"><img src="/resources/images/mainFeed/mainLike.png">좋아요</a></li>
                            <li><a href="#"><img src="/resources/images/mainFeed/mainReply.png">댓글 달기</a></li>
                            <li><a href="#"><img src="/resources/images/mainFeed/mainNext.png">공유하기</a></li>
                        </ul>
                    </section>

                    <hr>

                    <!-- 댓글 목록  -->
                    <section class="reply-container">
                        <div class="reply">
                            <img src="/resources/images/common/user-default.png" class="reply-profile-image">
                            <div class="reply-body">
                                <div class="reply-bubble">
                                    <p class="reply-name">Steve Yoo</p>
                                    <p class="reply-content">looking good hyung!</p>
                                </div>
                                <div class="reply-footer">
                                    <a href="#" class="like-btn">좋아요</a>
                                    <a href="#" class="re-reply">답글달기</a>
                                    <a href="#" class="date">6일</a>
                                </div>
                            </div>                        
                        </div>
                    </section>

                    <!-- 댓글 작성  -->
                    <section class="reply-write reply-container">
                        <div class="reply">
                            <img src="/resources/images/common/user-default.png" class="reply-profile-image">
                            <div class="reply-body">
                                <div class="reply-bubble">
                                    <input type="text" placeholder="댓글을 입력하세요...">
                                    <a href="#"><img src="/resources/images/mainFeed/send.png" class="reply-send"></a>
                                </div>
                            </div>              
                        </div>
                    </section>
                </div>

            </c:forEach>


            </div>

        </div> <%-- Grid 2 : 중심 내용 종료 --%>

        <%-- Grid 3 : 사이드바(오른쪽) --%>
        <jsp:include page="/WEB-INF/views/mainFeed/sidebarR.jsp"/>

    </main>
    
    <script src="/resources/js/mainFeed/main.js"></script>

</body>
</html>