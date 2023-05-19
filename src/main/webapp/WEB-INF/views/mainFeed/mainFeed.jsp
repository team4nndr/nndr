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
            <div class="centerArea"><!--  가운데를 각 needs에 맞춰서 섹터를 나누는게 좋을 것 같아 -->
                <div class="centerArea-1"><!-- 나의 피드 올리기 -->
                    <section id="cArea-1">
                        
                        <section>  <a href="/personalFeed/${loginMember.memberNo}">
                            <img src="/resources/images/mainFeed/mainMy.png" alt="로고" id="myLogo">
                        </a>
                    </section>

                        <section>
                            <form action="mainFeed" method="post" id="boardWriteFrm" enctype="multipart/form-data">
                            <%-- <fieldset>  --%>
                                <!-- <input type="text" name="query" id="query" 
                                placeholder="무슨 생각을 하고 계신가요?" autocomplete="off">  -->
                                <div>
                                <span id="think">${loginMember.memberName} 님은 무슨생각을 하고 계신가요?</span>    
                                </div>
                                <%-- 모달 --%>
                                <div id="myContent"></div> 
                                <div id="myContent-modal">
                                
                                <section id="modalTop">
                                <span class="title">게시물 만들기</span>

                                
                                <button type="button" class="close cancelBtn" id="cancelBtn"></button>
                                

                                </section>


                                <div>
                                <section id="modal-my1">
                                    <a href="/personalFeed/${loginMember.memberNo}">
                                    <img src="/resources/images/mainFeed/mainMy.png" alt="로고" id="myLogo">
                                    </a>
                                </section>



                                <section id="modal-my2"> 

                                <section>
                                <span><a href="/personalFeed/${loginMember.memberNo}" class="change">${loginMember.memberName}</a></span>
                                </section>


                                <section>
                                <li><!-- 없애야해 -->
                                    <a href="#" class="change">현재 시간</a>
                                </li> 
                                </section>


                                </section>
                                </div>

                                <section id="modalContent">
                                <textarea placeholder="${loginMember.memberName}님은 무슨 생각을 하고 계신가요?"
                                name="boardText"></textarea>
                                </section>
                                
                                <section id="modalImg">
                                <h3>사진</h3>
                                <div class="img-box" id="imgBox1">
                                    <div class="boardImg" id="num">
                                        <label for="img1">
                                            <img class="preview" src="">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img1" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                </div>

                                    <div class="boardImg" id="num">
                                        <label for="img2">
                                            <img class="preview" src="">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img2" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                </div>

                                    <div class="boardImg" id="num">
                                        <label for="img3">
                                            <img class="preview" src="">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img3" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                </div>

                                    <div class="boardImg" id="num">
                                        <label for="img4">
                                            <img class="preview" src="">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img4" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                </div>

                                    <div class="boardImg" id="num">
                                        <label for="img5">
                                            <img class="preview" src="">
                                        </label>
                                        <input type="file" name="images" class="inputImage" id="img5" accept="image/*">
                                        <span class="delete-image">&times;</span>
                                </div>
                                <%-- <button id=plusBtn><img src="/resources/images/mainFeed/plusLogo.png" id="plusLogo" ></button> --%>

                                

                                



                                
                                
                            </section>
                            
                            <section class="modalBot">
                                <button type="submit" id="submitBtn">게시</button>

                            </section>




                                
                                    
                                
    
                            <!-- <%-- </fieldset> --%> -->
                                <%-- 기존 이미지가 있다가 삭제된 이미지의 순서 기록 --%>
                                <input type="hidden" name="deleteList" value="">
    
                        </form>
    
    </section>

                    </section>
                    
                    <section id="cArea-2">                  
                    <ul>
                        
                        <li><button id="imgBtn">사진/동영상</button></li>
                        <li><button >기분/활동</button></li>
                    </ul>
                    </section>

                    
                </div>

                      
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

                        <!--  피드 본문 : 텍스트  -->
                        <div class="text-container">${board.boardText}</div>

                        <%-- 피드 본문 : 이미지 --%>
                        <div class="image-container">
                            <%-- <c:if test="${not empty board.imageList}" >
                                <c:set var="start" value="0"/>
                                <c:if test="${fn:length(board.imageList) > start}">
                                    <c:forEach var="i" begin="${start}" end="${fn:length(board.imageList)-1}">
                                        <div class="image-content">
                                            <c:set var="path" value="${board.imageList[i].imgPath}${board.imageList[i].imgReName}"/>
                                            <img src="${path}">
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </c:if> --%>

                            <%-- 세로사진 --%>
                            <div class="image-content">
                                <img src="/resources/images/mainFeed/sample/1.jpg">
                            </div>
                            <div class="image-content">
                                <img src="/resources/images/mainFeed/sample/2.jpg">
                            </div>
                            <div class="image-content">
                                <img src="/resources/images/mainFeed/sample/3.jpg">
                            </div>
                            <%-- <div class="image-content">
                                <img src="/resources/images/mainFeed/sample/3.jpg">
                            </div>
                            <div class="image-content">
                                <img src="/resources/images/mainFeed/sample/3.jpg">
                            </div> --%>


                            <%-- 가로사진--%>
                            <%-- <div class="image-content">
                                <img src="/resources/images/mainFeed/sample/1-1.jpg">
                            </div>
                            <div class="image-content">
                                <img src="/resources/images/mainFeed/sample/2-1.jpg">
                            </div>
                            <div class="image-content">
                                <img src="/resources/images/mainFeed/sample/2-1.jpg">
                            </div> 
                            <div class="image-content">
                                <img src="/resources/images/mainFeed/sample/2-1.jpg">
                            </div> 
                            <div class="image-content">
                                <img src="/resources/images/mainFeed/sample/2-1.jpg">
                            </div>  --%>
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
                                            <a class="re-reply" onclick="replyWrite(${reply.replyNo}, ${reply.memberNo}, ${reply.memberName})">답글 달기</a>
                                            <a class="date">${reply.replyDate}</a>
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
        </div> <%-- Grid 2 : 중심 내용 종료 --%>

        <%-- Grid 3 : 사이드바(오른쪽) --%>
        <jsp:include page="/WEB-INF/views/mainFeed/sidebarR.jsp"/>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="/resources/js/mainFeed/main.js"></script>
    <script src="/resources/js/mainFeed/reply.js"></script>

</body>
</html>