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
            <div class="centerArea-1">
                <section id="cArea-1">
                    
                    <section>  <a href="/personalFeed/${loginMember.memberNo}">
                        <img src="/resources/images/mainFeed/mainMy.png" alt="로고" id="myLogo">
                    </a>
                </section>

                    <section>
                        <form action="#" method="get">
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
                            <textarea placeholder="${loginMember.memberName}님은 무슨 생각을 하고 계신가요?"></textarea>
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

                                
                            <button id=plusBtn><img src="/resources/images/mainFeed/plusLogo.png" id="plusLogo" ></button>

                            </div>

                            

                            



                            
                            
                        </section>
                        
                        <section class="modalBot">
                            <button type="button" id="submitBtn">게시</button>

                        </section>




                            
                                
                            

                        <!-- <%-- </fieldset> --%> -->


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
                            <a href="/personalFeed/${board.memberNo}" class="change">${board.memberName}</a>
                            <a href="#" class="change">${board.uploadDate}</a>
                        </section> 

                    </section>
                    


                    <!--  나의 게시물 중간  -->
                    <div class="feedContent">

                        <section>${board.boardText}</section>
                        
                        <%-- 이미지가 있다면 --%>
                        <c:if test="${not empty board.imageList}" >
                            <c:set var="start" value="0"/>
                            <c:if test="${fn:length(board.imageList)>start}" >
                                <div class="img-box1">
                                    <c:forEach var="i" begin="${start}" end="${fn:length(board.imageList)}">
                                        <div class="boardImg1">
                                            <c:set var="path" value="${board.imageList[i].imgPath}${board.imageList[i].imgReName}"/>
                                            <img src="${path}">
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </c:if>

                    </div>


                    <!--  나의 게시물 좋아요 등등등 -->
                    <section class="like">
                        <ul>
                            <li><a href="#"><img src="/resources/images/mainFeed/mainLike.png">좋아요</a></li>
                            <li><a href="#"><img src="/resources/images/mainFeed/mainReply.png">댓글 달기</a></li>
                            <li><a href="#"><img src="/resources/images/mainFeed/mainNext.png">공유하기</a></li>
                        </ul>
                    </section>


                    <!-- 댓글 작성칸  -->
                    <section calss="cBot reply-container">

                        <section>
                            <a href="/personalFeed/${loginMember.memberNo}">
                                <img src="/resources/images/common/user-default.png" class="reply-profile-image">
                            </a>
                        </section>


                        <section>
                            <input type="text" name="reply" id="reply" 
                            placeholder="댓글을 입력하세요....." autocomplete="off">
                        </section>
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