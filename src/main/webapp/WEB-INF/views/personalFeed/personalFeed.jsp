<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="hobbyList"  value="${HobbyMap.hobbyList}"/>
<c:set var="perhobbyList"  value="${HobbyMap.perhobbyList}"/>


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
    <header>
	<jsp:include page="/WEB-INF/views/topMenu/header.jsp" /> 
	<jsp:include page="/WEB-INF/views/personalFeed/personalFeedHeader.jsp" /> 
    <style>
        .item5 > li:nth-child(1){
            border-bottom: 3px solid #56A8C5;
        }
    </style>
    </header>
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
                    <div class="who">
                        <div class="who-pic">사진9</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" href="">친구 추가</button></li>
                        </div>
                    </div>
                    <div class="who">
                        <div class="who-pic">사진10</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" href="">친구 추가</button></li>
                        </div>
                    </div>
                    <div class="who">
                        <div class="who-pic">사진11</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" href="">친구 추가</button></li>
                        </div>
                    </div>
                    <div class="who">
                        <div class="who-pic">사진12</div>
                        <div class="who-name">&nbsp;&nbsp;<strong>이름</strong></div>
                        <div class="add-friend">
                            <li><button class="add-friend2" onclick="addfriend">친구 추가</button></li>
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
                                <div id="intro-hobby">취미</div>
                                    <c:if test="${infoMember.memberNo eq loginMember.memberNo}" > 
                                    <div class="hobby-main hobby-center intro-1">
                                        <input type="checkbox" id="add-hobby">
                                        <label class="hobby-btn" id="login" for="add-hobby">취미 수정</label>
                            
                                    <div class="hobby-box hobby-center">
                                    <form action="infoHobby" id="hobby-choose">
                                            <h2>취미</h2>
                                            <div id="hobby-list">
                                            
                                            <c:forEach items="${hobbyList}" var="hobby">
                                                <input class="hobby-check" type="checkbox" id="${hobby.hobby}">
                                                <label for="${hobby.hobby}">${hobby.hobby}</label> 

                                            </c:forEach>
                                                
                                            </div>
                                            <div id="hobt"><button id="hobby-checked"><div class="btn-sty">확인</div></button>
                                            <label for="add-hobby" class="hobby-btn">
                                                <a id="hobby-no"><div class="btn-sty">닫기</div></a>
                                            </label>
                                        </div>
                                        </form>
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
                        <div id="main-im1" ><img src="/resources/images/common/user-deafult.png" alt="로고" class="main-im"></div>
                        <div id="main-im2"><img src="/resources/images/common/user-deafult.png" alt="로고" class="main-im"></div>
                        <div id="main-im3"><img src="/resources/images/common/user-deafult.png" alt="로고" class="main-im"></div>
                        <div class="something"></div>
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
                            <div id="main-im1" ><img src="/resources/images/common/user-deafult.png" alt="로고" class="main-im"></div>
                            <div id="main-im2"><img src="/resources/images/common/user-deafult.png" alt="로고" class="main-im"></div>
                            <div id="main-im3"><img src="/resources/images/common/user-deafult.png" alt="로고" class="main-im"></div>
                            <div class="something"></div>
                        </div>
                    </div>
                    <hr>
                </div> 
                <div class="item item2-3"><h4>
                    ?
                    게시물
                    장반석
                </h4></div>
            </div>
        </div>
    </div>


<script src="/resources/js/personalFeed/personalFeed.js"></script>
</body>
</html>