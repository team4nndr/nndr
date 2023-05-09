<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <header>
    </header>
    <div class="flex-container">
        <div class="main-container1">
            <img src="../images/cats/cat2.jpg" alt="로고"id="backLogo">
            <div class="item3">
                <div class="myname1">
                    <a class ="backLogobutton" href=""> 커버 사진 추가</a>
                </div>
            </div>
            <div class="item4">
                <div class="main1-1">
                    <a href="#"><img src="../images/cats/cat2.jpg" alt="로고"id="homeLogo"></a>
                </div>
                <h2 class="name">${infoMember.memberName}</h2>
                
                
                <div class="main1-2">
                    <div class="myname2">
                        <button class ="storypuls" href=""> 친구추가
                        </button>
                        <a class ="plo" href=""> 프로필 편집
                        </a>
                    </div>
                </div>
            </div>
            
            <nav class="item5">
                <li class="main-li pick"><a class="main-li" href="/personalFeed/${infoMember.memberNo}"> 게시물</a></li>
                    <li class="main-li"><a class="main-li " href="/personalFeedInfo/${infoMember.memberNo}">정보</a></li>
                        <li class="main-li"><a class="main-li" href="/personalFeedFriend/${infoMember.memberNo}">친구</a></li>
                            <li class="main-li"><a class="main-li" href="/personalFeedPic/${infoMember.memberNo}">사진</a></li>
                                <div></div>
                                </nav>
                                </div>
                                <div class="main-container2">
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
                <div class=" item2-1">
                <div class=" item2-2">
                    <div class="item2-2-1">
                        <div class="so"><h3>&nbsp;&nbsp;소개</h3></div>
                        <div>
                            <div id="intro-my">${infoMember.infoIntro}</div>
                            <div id="input-intro">
                                <form action="">
                                    <textarea name="" id="intro-text" cols="50" rows="3"></textarea><br>
                                    <div id="texta"></div>
                                    <div id="public">
                                        <div>&nbsp;전체 공개</div>
                                        <div id="btn-set">
                                            <button class="in-btn" id="intro-save" type="button" >저장</button>
                                        <button class="in-btn" id="intro-can" type="button" onclick="infoCan()">취소</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <button class="intro-1" onclick="infoMy()">소개수정</button></div>
                            <!-- <div> -->
                            <div id="info-job">${infoMember.infoJob}</div><br>
                            <div id="info-college">${infoMember.infoCollege}</div><br>
                            <div id="info-high">${infoMember.infoHigh}</div><br>
                            <div id="info_residence">${infoMember.infoResidence}</div><br>
                            <div id="info_birth">${infoMember.infoBirthplace}</div><br>
                            <div id="info_romantic">
                                <div>연애/결혼 분류</div>
                                <div href="#">연애/결혼 상대방</div>
                                <div>연애/결혼 시작일</div>
                            </div>
                            <div class="intro-1"  id="info-link"><a id="info-link" href="Main_info.html">상세정보 수정</a></div>
                            
                            
                            <div>
                                <div id="intro-hobby">취미</div>
                                <div class="hobby-main hobby-center intro-1">
                                    <input type="checkbox" id="add-hobby">
                                    <label class="hobby-btn" id="login" for="add-hobby">취미 수정</label>
                            
                                    <div class="hobby-box hobby-center">
                                    <form action="" id="hobby-choose">
                                            <h2>취미</h2>
                                            <div id="hobby-list">
                                                <input class="hobby-check" type="checkbox" id="hobby-baseball">
                                                <label for="baseball">baseball</label> 
                                                <input class="hobby-check" type="checkbox" id="hobby-game">
                                                <label for="game">game</label>
                                                <input class="hobby-check" type="checkbox" id="hobby-read">
                                                <label for="read">read</label>
                                                <input class="hobby-check" type="checkbox" id="hobby-run">
                                                <label for="run">run</label>
                                                <input class="hobby-check" type="checkbox" id="hobby-java">
                                                <label for="java">java</label>
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
                            
                            <button class="intro-1" href="">대표 사진 추가</button></div>
                            <br>
                    </div>
                        <br>
                    <div class="item2-2-2">
                        <div class="item2-2-2-1">
                            <h3>&nbsp;&nbsp;사진</h3>
                            <a class="my-info" href="Main_im.html">모든 사진 보기</a>
                            
                        </div>
                        <div class="main-imset">
                        <div id="main-im1" ><img src="../images/cats/cat4.jpg" alt="로고" class="main-im"></div>
                        <div id="main-im2"><img src="../images/cats/cat5.jpg" alt="로고" class="main-im"></div>
                        <div id="main-im3"><img src="../images/cats/진주_2.jpg" alt="로고" class="main-im"></div>
                        <div class="something"></div>
                        </div>
                    </div>
                    <br>
                    <div class="item2-2-2">
                        <div class="item2-2-2-1">
                            <h3>&nbsp;&nbsp;친구</h3>
                            <a class="my-info" href="Main_fr.html">모든 친구 보기</a>
                        </div>
                        <div class="main-imset">
                            <div id="main-im1" ><img src="../images/cats/로미.jpg" alt="로고" class="main-im"></div>
                            <div id="main-im2"><img src="../images/cats/진주_1.jpg" alt="로고" class="main-im"></div>
                            <div id="main-im3"><img src="../images/cats/cat1.jpg" alt="로고" class="main-im"></div>
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