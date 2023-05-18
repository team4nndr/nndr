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
    <link rel="shortcut icon" href="#" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/topMenu/header.jsp" /> 
	<jsp:include page="/WEB-INF/views/personalFeed/personalFeedHeader.jsp" /> 
    <style>
        .item5 > li:nth-child(1){
            border-bottom: 3px solid #56A8C5;
        }
    </style>
    <div class="flex-container">
        <div class="main-container2">
            <c:if test="${infoMember.memberNo eq loginMember.memberNo}" > 
                            
            <div id="fr-border">
                <div class="item1-2">
                    <h4>&nbsp;&nbsp;알 수도 있는 사람</h4>
                </div>
                <div class="item1-3">
                    <div class="who">
                        <div class="who-pic">사진1</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" href="">친구 추가</button></li>
                        </div>
                    </div><div class="who">
                        <div class="who-pic">사진2</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" href="">친구 추가</button></li>
                        </div>
                    </div><div class="who">
                        <div class="who-pic">사진3</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" href="">친구 추가</button></li>
                        </div>
                    </div><div class="who">
                        <div class="who-pic">사진4</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" href="">친구 추가</button></li>
                        </div>
                    </div><div class="who">
                        <div class="who-pic">사진5</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" href="">친구 추가</button></li>
                        </div>
                    </div><div class="who">
                        <div class="who-pic">사진6</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" href="">친구 추가</button></li>
                        </div>
                    </div>
                    <div class="who">
                        <div class="who-pic">사진7</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" href="">친구 추가</button></li>
                        </div>
                    </div>
                    <div class="who">
                        <div class="who-pic">사진8</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" href="">친구 추가</button></li>
                        </div>
                    </div>
                </div>
                
                <p class="controller">
                    <!-- &lang: 왼쪽 방향 화살표
                    &rang: 오른쪽 방향 화살표 -->
                    <span class="prev">&lang;</span>  
                    <span class="next">&rang;</span>
                </p>

                </div>
                </c:if>
                <div class=" item2-1">
                <div class=" item2-2">
                    <div class="item2-2-1">
                        <div class="so"><h2>&nbsp;&nbsp;소개</h2></div>
                        <div>
                            <div id="intro-my">${infoMember.infoIntro}</div>
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
                                <div id="intro-hobby">
                                    <h3 id=zzs>관심있는 취미</h3>
                                    <div id="dhho" style="display:none">
                                        <c:forEach items="${hobbyList}" var="hobby">${hobby.hobby}　</c:forEach>
                                    </div>
                                    <div id="myhho">
                                        <c:if test="${not empty perHobbyList}" >
                                            <c:forEach items="${perHobbyList}" var="hobby">${hobby.hobby}　</c:forEach>
                                        </c:if>
                                    </div>
                                </div>
                                <c:if test="${infoMember.memberNo eq loginMember.memberNo}" > 
                                <div class="hobby-main hobby-center intro-1">
                                    <input type="checkbox" id="add-hobby">
                                    <label class="hobby-btn" id="login" for="add-hobby">취미 수정</label>
                                    <div class="hobby-box hobby-center">
                                    <%-- <form action="infoHobby" method="get" id="hobby-choose"> --%>
                                        <h2>취미</h2>
                                        <div id="hobby-list">
                                        <c:forEach items="${hobbyList}" var="hobby">
                                            <c:forEach items="${perHobbyList}" var="perHobby">
                                                <c:if test="${hobby.hobby eq perHobby.hobby}">
                                                    <c:set var="ch"  value="checked"/>
                                                </c:if>
                                            </c:forEach>
                                            <input class="hobby-check" type="checkbox" name="hobbychecked" id="${hobby.hobby}" ${ch}>
                                            <label for="${hobby.hobby}">${hobby.hobby}</label> 
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
                                        <%-- </form> --%>
                                    </div>
                                    <label class="hobby-overlay" for="add-hobby"></label>
                                </div>
                                    </c:if>
                                    <c:if test="${infoMember.memberNo eq loginMember.memberNo}" > 
                            <button class="intro-1" href="">대표 사진 추가</button>
                            </c:if>
                            <br>
                            </div>
                    </div>
                        <br>
                    <div class="item2-2-2">
                        <div class="item2-2-2-1" >
                            <div class="so">
                                <h3>&nbsp;&nbsp;사진</h3>
                            
                            </div>
                            <a class="my-info" href="Main_im.html">모든 사진 보기</a>
                            
                        </div>
                        <div class="main-imset">
                            <c:forEach items="${imgSet}" var="i">
                                <div id="main-im3"><img src="${i.imgPath}${i.imgRename}" alt="로고" class="main-im"></div>
                            </c:forEach>
                        <div class="something"></div>3
                        </div>
                    </div>
                    <br>
                    <div class="item2-2-2">
                        <div class="item2-2-2-1">
                        <div class="so">
                            <h3>&nbsp;&nbsp;친구</h3>
                            </div>
                            <a class="my-info" href="Main_fr.html">모든 친구 보기</a>
                        </div>
                        <div class="main-imset">
                            <c:forEach items="${imgSet}" var="i">
                                <div id="main-im3"><img src="${i}" alt="로고" class="main-im"></div>
                            </c:forEach>
                            <div class="something"></div>
                        </div>
                    </div>
                    <hr>
                </div> 
                <div class="item item2-3">
                    <div class="centerArea-1"><!-- 나의 피드 올리기 -->
                        <section id="cArea-1">
                        <section>  
                            <a href="#">
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
                    <section>asd</section>

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


<script src="/resources/js/personalFeed/personalFeed.js"></script>
</body>
</html>