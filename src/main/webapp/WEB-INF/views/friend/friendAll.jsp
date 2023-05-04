<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든친구</title>
    <link rel="stylesheet" href="/resources/css/friend/friendAll.css">
</head>

<body>
    <div class="content">
        <div class="friendNav">

            <div class="frtopbox"> <!-- 맨위 친구요청 text hr위-->

                <a href="/friend"><img class="back" src="/resources/images/friend/—Pngtree—vector back icon_4187319.png"
                        alt=""></a>
                <div class="frmidbox">
                    <div><span><a class="backfriend" href="#">친구</a></span></div>
                    <div>
                        <h1 class="allfriend">모든 친구</h1>
                    </div>
                </div>
            </div>
            <div id="searchFrBox"> <!-- 검색 기능-->
                <label for="searchfr" id="lafrbel">
                    <span id="searchimg"> <img src="/resources/images/friend/KakaoTalk_20230420_151612862.png" alt=""></span>
                    <input type="text" id="searchfr" placeholder="친구 검색">
                </label>
            </div>
            <div class="hr2"> <!-- 줄 -->
            </div>
            <div id="friendRQBox">
                <span id="friendRQ">친구 128명</span>
            </div>
            <div class="frtopdiv">
                <img class="proimg" src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
                <div class="frbox"> <!--이름 + 확인,삭제-->
                    <div class="namecount"><!--이름, 함께 아는친구-->
                        <span class="freindName">정용화</span>
                        <span class="pulsnav"><img src="/resources/images/friend/free-icon-three-dots-6941941.png" alt="">
                            </span>
                            <div class="frmenu"> 
                                <div class="noProfile">정용화님의 프로필 차단</div>
                                <div class="noFriend">정용화님과 친구 관계 끊기</div>
                            </div>
                    </div>
                </div>
            </div>
            <div class="frtopdiv">
                <img class="proimg" src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
                <div class="frbox"> <!--이름 + 확인,삭제-->
                    <div class="namecount"><!--이름, 함께 아는친구-->
                        <span class="freindName">정용화</span>
                        <span class="pulsnav"><img src="/resources/images/friend/free-icon-three-dots-6941941.png" alt="">
                            </span>
                            <div class="frmenu"> 
                                <div class="noProfile">정용화님의 프로필 차단</div>
                                <div class="noFriend">정용화님과 친구 관계 끊기</div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="mainfrbox"> <!--메인 피드-->
            <div id="mainbox">
                <img id="imgmain" src="/resources/images/friend/null_states_people_gray_wash.svg" alt="">
                <span id="maintext">프로필을 미리 볼 사람의 이름을 선택하세요.</span>
            </div>
        </div>
    </div>
    
    <script src="/resources/js/friend/friendAll.js"></script>
</body>

</html>