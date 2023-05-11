<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="/resources/css/mainFeed/main.css">

</head>
<body>
<main>
    <!-- 헤더는 아마 상단바가 들어갈거임 이거는 
    fixed나 sticky를 사용해서 고정시켜주는게 좋을 것 같음 -->
        <header>
        	<jsp:include page="/WEB-INF/views/topMenu/header.jsp"/>
        </header>

        <!-- 중심 내용이 들어갈 것들  -->
        <div class="mainView">
            <div class="leftArea">
                <div class="leftArea-1"> 
                    <ul>
                        <li>
                        <a href="/mainFeed" class="imgLink">
                        <img src="/resources/images/mainFeed/mainHome.png" alt="home" id="mainHome">
                        </a> <a href="/mainFeed" class="aLink">홈</a>
                        </li>

                        <li>
                        <a href="/personalFeed/4" class="imgLink">
                        <img src="/resources/images/mainFeed/mainMy.png" alt="myHome" id="myHome">
                        </a><a href="/personalFeed/${loginMember.memberNo}" class="aLink">나의피드</a>
                        </li>

                        <li>
                        <a href="#" class="imgLink">
                        <img src="/resources/images/mainFeed/mainFriends.png" alt="friends" id="friend">
                        </a>
                        <a href="/friend" class="aLink">친구</a></li>
                        
                        <li>
                        <a href="#" class="imgLink">
                        <img src="/resources/images/mainFeed/mainLike.png" alt="like" id="likeLogo">
                        </a>
                        <a href="#" class="aLink">내가 저장한 피드</a></li>


                        <li>
                        <a href="" class="imgLink">
                        <img src="/resources/images/mainFeed/mainSearch.png" alt="search" id="searchLogo" >
                        </a>
                        <a href="https://www.naver.com/" target="_blank"class="aLink">초록검색창</a></li>
                    </ul>
                </div>

            </div>


            <div class="centerArea"><!--  가운데를 각 needs에 맞춰서 섹터를 나누는게 좋을 것 같아 -->
                <div class="centerArea-1"><!-- 나의 피드 올리기 -->
                    <section id="cArea-1">
                        
                        <section>  <a href="#">
                            <img src="/resources/images/mainFeed/mainMy.png" alt="로고" id="myLogo">
                        </a>
                    </section>

                        <section>
                            <form action="#" method="get">
                            <%-- <fieldset>  --%>
                                <!-- <input type="text" name="query" id="query" 
                                placeholder="무슨 생각을 하고 계신가요?" autocomplete="off">  -->
                                <div>
                                <span id="think">고객님은 무슨생각을 하고 계신가요?</span>    
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
                                    <a href="#">
                                    <img src="/resources/images/mainFeed/mainMy.png" alt="로고" id="myLogo">
                                    </a>
                                </section>



                                <section id="modal-my2"> 

                                <section>
                                <span><a href="/personalFeed/${loginMember.memberNo}" class="change">${loginMember.memberName}</a></span>
                                </section>


                                <section>
                                <li>
                                    <a href="#" class="change">현재 시간</a>
                                </li> 
                                </section>


                                </section>
                                </div>




                                <div></div>
                                
                                
                                </div>
                                    
                                
    
                            <%-- </fieldset> --%>
    
    
                        </form>
    
    </section>

                    </section>
                    
                    <section id="cArea-2">                  
                    <ul>
                        
                        <li><button >사진/동영상</button></li>
                        <li><button >기분/활동</button></li>
                    </ul>
                    </section>

                    
                </div>
                <div class="centerArea-2">
                    <section > <!-- 나의 게시물 상단  -->
                        <section id="cTopArea1"> <a href="#">
                            <img src="/resources/images/mainFeed/mainMy.png" alt="로고" id="myLogo">
                        </a>

                        </section> <!-- 상단의 이미지 -->

                        <section id="cTopArea2">
                            <section >
                                <span><a href="#" class="change">송혜교</a></span>
                            </section>

                            <section >
                                <li>
                                    <a href="#" class="change">현재 시간</a>
                                </li> 

                            </section>

                        </section> <!-- 상단의 이름 and 시간  -->
                        
                        

                    </section>
                    
                    <!--  나의게시물 중간  -->
                    <section></section>

                    <!--  나의 게시물 좋아요 등등등 -->
                    <section id="like">

                        <ul>
                            <li><a href="#"><img src="/resources/images/mainFeed/mainLike.png" alt="like" id="likeLogo"> 좋아요</a></li>
                            <li><a href="#reply"><img src="/resources/images/mainFeed/mainReply.png" alt="reply" id="replyLogo"> 댓글 달기</a></li>
                            <li><a href="#"><img src="/resources/images/mainFeed/mainNext.png" alt="share" id="shareLogo"> 공유하기</a></li>
                        </ul>
                        
                    </section>


                    <!-- 댓글 작성칸  -->
                    <section id="cBot">

                        <section>  <a href="#">
                            <img src="/resources/images/mainFeed/mainMy.png" alt="로고" id="myLogo">
                        </a>
                        </section>


                        <section>
                            <input type="text" name="reply" id="reply" 
                            placeholder="댓글을 입력하세요....." autocomplete="off"> 

                        </section>
                    </section>

                </div>
                
                





            </div>




            <div class="rightArea"></div>
        </div>



    









</main>



    <script src="/resources/js/mainFeed/main.js"></script>
    
</body>
</html>