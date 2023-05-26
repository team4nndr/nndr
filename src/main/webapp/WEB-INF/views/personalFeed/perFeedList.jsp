<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="/resources/css/mainFeed/reply.css">
<link rel="stylesheet" href="/resources/css/mainFeed/mention.css">

<script src="https://kit.fontawesome.com/f7459b8054.js" crossorigin="anonymous"></script>

    <%-- 피드 목록 --%>
    <c:forEach items="${boardList}" var="board">
        <div class="feed">

            <!-- 피드 상단  -->
            <section class="feed-head">

                <div class="feed-head-left">
                    <!-- 프로필 이미지 -->
                    <a class="feed-head-profile" href="#">
                        <c:if test="${empty board.profileImage}">
                            <img src="/resources/images/common/user-default.png" class="wirter-profile-image">
                        </c:if>
                        <c:if test="${not empty board.profileImage}">
                            <a href="/personalFeed/${board.memberNo}">
                                <img class="wirter-profile-image" src="${board.profileImage}">
                            </a>
                        </c:if>
                    </a>
                    
                    <!-- 이름, 시간 -->
                    <div class="feed-head-info">
                        <c:if test="${board.memberNo eq infoMember.memberNo}">
                            <a href="/personalFeed/${board.memberNo}" class="name change">${board.memberName}</a>
                        </c:if>
                        <c:if test="${board.memberNo ne infoMember.memberNo}">
                            <a href="/personalFeed/${board.memberNo}" class="name change">${board.memberName} ▷▷ ${infoMember.memberName}</a> 
                        </c:if>
                        <a class="date change">${board.uploadDate}</a>
                    </div>
                </div>
                
                <%-- 내 피드 더보기 --%>
                <c:if test="${board.memberNo eq loginMember.memberNo}" >
                    <div class="feed-more detailBtn">
                        <div class="feedContain hidden">
                            <button type="submit" class="feedUpdate" id="feedInfo" data="${board.boardNo}" >게시물 수정</button>
                            <button type="submit" class="feedDelete" data="${board.boardNo}">게시물 삭제</button>
                        </div>
                    </div>
                </c:if>
            </section>
            
            <hr class="feed-hr">

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

            <hr class="feed-hr">

            <!--  나의 게시물 좋아요, 댓글달기, 공유하기 -->
            <section class="like">
            
                    <div class="likeBtn">
                        <c:if test="${board.boardCount == 0}">
                        <i class="fa-regular fa-thumbs-up boardLike" data="${board.boardNo}"></i>
                        </c:if>

                        <%-- board.boardCount == 1 --%>
                        <c:if test="${board.boardCount == 1}" >
                        <i class="fa-solid fa-thumbs-up boardLike" data="${board.boardNo}"></i>
                        </c:if>
                
        
                <%-- <img src="/resources/images/mainFeed/mainLike.png"> --%>
                좋아요</div>   
                
                <div onclick="replyFocus(${board.boardNo})"><img src="/resources/images/mainFeed/mainReply.png">댓글 달기</div>
                <%-- <div><img src="/resources/images/mainFeed/mainNext.png">공유하기</div> --%>
            </section>

            <hr class="feed-hr">
            <!-- 댓글 목록  -->
            <section class="reply-container board${board.boardNo}">
                <c:forEach items="${board.replyList}" var="reply">
                    <c:if test="${reply.parentReplyNo == 0 || reply.parentReplyNo == null}" >
                        <div class="reply">
                    </c:if>
                    <c:if test="${reply.parentReplyNo != 0}" >
                        <div class="reply re-reply">
                    </c:if>
                        <c:if test="${empty reply.profileImage}">
                            <img src="/resources/images/common/user-default.png" class="reply-profile-image">
                        </c:if>
                        <c:if test="${not empty reply.profileImage}">
                            <a href="/personalFeed/${reply.memberNo}">
                                <img class="reply-profile-image" src="${reply.profileImage}">
                            </a>
                        </c:if>
                        <div class="reply-body">
                            <div class="reply-bubble">
                                <p class="reply-name">${reply.memberName}</p>
                                <p class="reply-content">${reply.replyContent}</p>
                            </div>
                            <div class="reply-footer">
                                <div class="re-reply" onclick="showReplyForm(${reply.boardNo}, ${reply.replyNo}, this)">답글</div>
                                <c:if test="${reply.memberNo == loginMember.memberNo}">
                                    <div class="reply-mod" onclick="showUpdateForm(${reply.boardNo}, ${reply.replyNo}, this)">수정</div>
                                    <div class="reply-del" onclick="deleteReply(${reply.boardNo}, ${reply.replyNo})">삭제</div>
                                </c:if>
                                <c:if test="${empty reply.updateDate}">
                                    <div class="date">${reply.replyDate}</div>
                                </c:if>
                                <c:if test="${not empty reply.updateDate}">
                                    <div class="date">${reply.updateDate}에 수정됨</div>
                                </c:if>
                            </div>
                        </div>                    
                    </div>
                </c:forEach>
            </section>

            <!-- 댓글 작성  -->
            <section class="reply-write reply-container">
                <div class="reply">

                    <c:if test="${empty loginMember.profileImage}">
                        <img src="/resources/images/common/user-default.png" class="reply-profile-image">
                    </c:if>
                    <c:if test="${not empty loginMember.profileImage}">
                        <img class="reply-profile-image" src="${loginMember.profileImage}">
                    </c:if>
                    <div class="reply-body">
                        <div class="reply-bubble">
                            <textarea class="reply-textarea" no="${board.boardNo}" placeholder="댓글을 입력하세요..." maxlength="1000"></textarea>
                            <div class="submit-btn" onclick="submitReply('${board.boardNo}', null, this)">
                                <img src="/resources/images/mainFeed/send.png" class="reply-send-disable">
                                <img src="/resources/images/mainFeed/send-blue.png" class="reply-send-enable hidden">
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>

    </c:forEach>

    <script src="/resources/js/mainFeed/mention.js"></script>

</div>