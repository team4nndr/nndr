<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/resources/css/mainFeed/feed.css">

    <%-- 피드 목록 --%>
    <c:forEach items="${boardList}" var="board">
        <div class="feed">

            <!-- 피드 상단  -->
            <section class="feed-head">

                <div class="feed-head-left">
                    <!-- 프로필 이미지 -->
                    <a class="feed-head-profile" href="#">
                        <img src="/resources/images/common/user-default.png" class="wirter-profile-image">
                    </a>
                    
                    <!-- 이름, 시간 -->
                    <div class="feed-head-info">
                        <a href="/personalFeed/${board.memberNo}" class="name change">${board.memberName}</a>
                        <a href="#" class="date change">${board.uploadDate}</a>
                    </div>
                </div>
                
                <%-- 내 피드 더보기 --%>
                <c:if test="${board.memberNo eq loginMember.memberNo}" >
                    <div class="feed-more detailBtn">
                        <div class="feedContain hidden" id="feedHidden">
                            <button type="submit" class="feedUpdate" id="feedUpdate" data="${board.boardNo}" >게시물 수정</button>
                            <button type="submit" class="feedDelete" id="feedDelete" data="${board.boardNo}">게시물 삭제</button>
                        </div>
                    </div>
                </c:if>
            </section>
            
            <hr>

            <!--  피드 본문 : 텍스트  -->
            <div class="text-container">${board.boardText}</div>

            <%-- 피드 본문 : 이미지 --%>
            <div class="image-container">
                <c:if test="${not empty board.imageList}" >
                    <c:set var="start" value="0"/>
                    <c:if test="${fn:length(board.imageList) > start}">
                        <c:forEach var="i" begin="${start}" end="${fn:length(board.imageList)-1}">
                            <div class="image-content">
                                <c:set var="path" value="${board.imageList[i].imgPath}${board.imageList[i].imgReName}"/>
                                <img src="${path}">
                            </div>
                        </c:forEach>
                    </c:if>
                </c:if>
            </div>

            <hr>

            <!--  나의 게시물 좋아요, 댓글달기, 공유하기 -->
            <section class="like">
                <div><img src="/resources/images/mainFeed/mainLike.png">좋아요</div>
                <div><img src="/resources/images/mainFeed/mainReply.png">댓글 달기</div>
                <div><img src="/resources/images/mainFeed/mainNext.png">공유하기</div>
            </section>

            <hr>

            <!-- 댓글 목록  -->
            <section class="reply-container board${board.boardNo}">
                <c:forEach items="${board.replyList}" var="reply">
                    <c:if test="${reply.parentReplyNo == 0 || reply.parentReplyNo == null}" >
                        <div class="reply">
                    </c:if>
                    <c:if test="${reply.parentReplyNo != 0}" >
                        <div class="reply re-reply">
                    </c:if>
                        <img src="/resources/images/common/user-default.png" class="reply-profile-image">
                        <div class="reply-body">
                            <div class="reply-bubble">
                                <p class="reply-name">${reply.memberName}</p>
                                <p class="reply-content">${reply.replyContent}</p>
                            </div>
                            <div class="reply-footer">
                                <%-- <a class="like-btn">좋아요</a> --%>
                                <a class="re-reply" onclick="replyWrite(${reply.replyNo}, ${reply.memberNo}, ${reply.memberName})">답글</a><a class="reply-mod" onclick="">수정</a><a class="reply-del" onclick="">삭제</a><a class="date">${reply.replyDate}</a>
                            </div>
                        </div>                    
                    </div>
                </c:forEach>
            </section>

            <!-- 댓글 작성  -->
            <section class="reply-write reply-container">
                <div class="reply">
                    <img src="/resources/images/common/user-default.png" class="reply-profile-image">
                    <div class="reply-body">
                        <div class="reply-bubble">
                            <textarea class="reply-textarea" no="${board.boardNo}" type="textarea" placeholder="댓글을 입력하세요..." maxlength="1000"></textarea>
                            <a onclick="svubmitReply(${board.boardNo})">
                                <img src="/resources/images/mainFeed/send.png" class="reply-send-disable">
                                <img src="/resources/images/mainFeed/send-blue.png" class="reply-send-enable hidden">
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </div>

    </c:forEach>

</div>