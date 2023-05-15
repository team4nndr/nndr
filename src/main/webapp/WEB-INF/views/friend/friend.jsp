<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>friendTab</title>
    <link rel="stylesheet" href="/resources/css/friend/friend.css">
</head>

	<jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
<body>
    <main>
        <div class="content">
            <div class="friendNav">
                <ul>
                    <strong id="friend">친구</strong>
                    <li><a href="friend"><img class="friendimg" src="/resources/images/friend/free-icon-friend-5003758.png" alt=""> 홈</a>
                    </li>
                    <li><a href="friend/request"><img class="friendimg" src="/resources/images/friend/free-icon-add-friend-3394625.png" alt="">
                            친구요청</a></li>
                    <li><a href="friend/recom"><img class="friendimg" src="/resources/images/friend/free-icon-friends-2583035.png" alt=""> 친구추천</a>
                    </li>
                    <li><a href="friend/all"><img class="friendimg" src="/resources/images/friend/free-icon-friends-7596695.png" alt=""> 모든친구</a>
                    </li>
                </ul>
            </div>
            <div class="topdiv">
                <div class="topfr">친구요청</div>
                <div class="friendContent">
                    <div class="friendbax">
                        <!-- pick = img로  -->
                        <div class="tbox"> <img class="pick"
                                src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
                        </div>
                        <div class="boxname">
                            <div class="namebar"><span class="frName">정용화</span></div>
                            <div class="plusfr"><span class="together">함께 아는 친구 1명</span></div>
                            <div class="btnbox"><button class="checkYes">확인</button></div>
                            <div class="btnbox"><button class="checkNo">삭제</button></div>
                        </div>
                    </div>
                    <div class="friendbax">
                        <div class="tbox"> <img class="pick"
                                src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
                        </div>
                        <div class="boxname">
                            <div class="namebar"><span class="frName">박종욱</span></div>
                            <div class="plusfr"><span class="together">함께 아는 친구 1명</span></div>
                            <div class="btnbox"><button class="checkYes">확인</button></div>
                            <div class="btnbox"><button class="checkNo">삭제</button></div>
                        </div>
                    </div>
                    <div class="friendbax">
                        <div class="tbox"> <img class="pick"
                                src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
                        </div>
                        <div class="boxname">
                            <div class="namebar"><span class="frName">이예슬</span></div>
                            <div class="plusfr"><span class="together">함께 아는 친구 1명</span></div>
                            <div class="btnbox"><button class="checkYes">확인</button></div>
                            <div class="btnbox"><button class="checkNo">삭제</button></div>
                        </div>
                    </div>
                    <div class="friendbax">
                        <div class="tbox"> <img class="pick"
                                src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
                        </div>
                        <div class="boxname">
                            <div class="namebar"><span class="frName">최유나</span></div>
                            <div class="plusfr"><span class="together">함께 아는 친구 1명</span></div>
                            <div class="btnbox"><button class="checkYes">확인</button></div>
                            <div class="btnbox"><button class="checkNo">삭제</button></div>
                        </div>
                    </div>
                    <div class="friendbax">
                        <div class="tbox"> <img class="pick"
                                src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
                        </div>
                        <div class="boxname">
                            <div class="namebar"><span class="frName">정반석</span></div>
                            <div class="plusfr"><span class="together">함께 아는 친구 1명</span></div>
                            <div class="btnbox"><button class="checkYes">확인</button></div>
                            <div class="btnbox"><button class="checkNo">삭제</button></div>
                        </div>
                    </div>
                    <div class="friendbax">
                        <div class="tbox"> <img class="pick"
                                src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
                        </div>
                        <div class="boxname">
                            <div class="namebar"><span class="frName">조우형</span></div>
                            <div class="plusfr"><span class="together">함께 아는 친구 1명</span></div>
                            <div class="btnbox"><button class="checkYes">확인</button></div>
                            <div class="btnbox"><button class="checkNo">삭제</button></div>
                        </div>
                    </div>
                    <div class="friendbax">
                        <div class="tbox"> <img class="pick"
                                src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
                        </div>
                        <div class="boxname">
                            <div class="namebar"><span class="frName">홍길동</span></div>
                            <div class="plusfr"><span class="together">함께 아는 친구 1명</span></div>
                            <div class="btnbox"><button class="checkYes">확인</button></div>
                            <div class="btnbox"><button class="checkNo">삭제</button></div>
                        </div>
                    </div>
                    <div class="friendbax">
                        <div class="tbox"> <img class="pick"
                                src="/resources/images/friend/143086968_2856368904622192_1959732218791162458_n.png" alt="">
                        </div>
                        <div class="boxname">
                            <div class="namebar"><span class="frName">홍길동</span></div>
                            <div class="plusfr"><span class="together">함께 아는 친구 1명</span></div>
                            <div class="btnbox"><button class="checkYes">확인</button></div>
                            <div class="btnbox"><button class="checkNo">삭제</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script src="/resources/js/friend/friend.js"></script>
</body>

</html>