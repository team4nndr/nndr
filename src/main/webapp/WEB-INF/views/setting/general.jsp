<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설정</title>
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/admin/users.css">
    <link rel="stylesheet" href="/resources/css/setting/general.css">
    <script src="https://kit.fontawesome.com/9c2aaccfe5.js" crossorigin="anonymous"></script>
</head>
<body>
    <%-- 상단바 메뉴 --%>
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
    
    <main>
        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/setting/sidebar.jsp" />

        <%-- 회원 의견 상세 페이지 --%>
        <form action="#" id="content">
            <div id="details">
                <h3>내 정보</h3>
                <hr>

                <!-- 계정(이메일) -->
                <div class="row">
                    <span class="title">로그인계정</span>
                    <span class="data">cyunanne@gmail.com</span>
                </div>

                <!-- 이름 -->
                <div class="row">
                    <span class="title">이름</span>
                    <span class="data">최유나</span>
                </div>

                <!-- 비밀번호 -->
                <div class="row passwd">
                    <span class="title">비밀번호</span>
                    <span class="data info-print">**************</span>
                    <div class="mod-button mod">수정</div>
                </div>
                <div class="row mod passwd hidden">
                    <span class="title">비밀번호 수정</span>
                    <div class="mod-wrapper passwd">
                        <div>
                            <span>현재 비밀번호</span>
                            <span class="input-wrapper passwd">
                                <input class="mod-input" type="password" />
                            </span>
                        </div>
                        <div>
                            새 비밀번호
                            <span class="input-wrapper passwd">
                                <input class="mod-input" type="password" />
                            </span>
                        </div>
                        <div>
                            새 비밀번호 재입력
                            <span class="input-wrapper passwd">
                                <input class="mod-input" type="password" />
                            </span>
                        </div>
                    </div>
                    <div class="mod-button submit">변경 내용 저장</div>
                    <div class="mod-button close">닫기</div>
                </div>

                <!-- 성별 -->
                <div class="row gender">
                    <span class="title">성별</span>
                    <span class="data info-print">여</span>
                    <div class="mod-button mod">수정</div>
                </div>
                <div class="row mod gender hidden">
                    <span class="title">성별 수정</span>
                    <div class="mod-wrapper gender">
                        <label><input type="radio" name="gender" value="M">남</label>
                        <label><input type="radio" name="gender" value="F">여</label>
                        <label><input type="radio" name="gender" value="None">알리고 싶지 않음</label>
                    </div>
                    <div class="mod-button submit">변경 내용 저장</div>
                    <div class="mod-button close">닫기</div>
                </div>

                <!-- 주소 -->
                <div class="row address">
                    <span class="title">주소</span>
                    <span class="data">경기도 하남시 아리수로 499 미사강변루나리움아파트 502동 1302호</span>
                    <!-- <input class="data info-input" value="경기도 하남시 아리수로 499 미사강변루나리움아파트 502동 1302호" /> -->
                    <div class="mod-button mod">수정</div>
                </div>
                <div class="row mod address hidden">
                    <span class="title">주소 수정</span>
                    <div class="input-wrapper address">
                        <input class="mod-input" type="text" />
                    </div>
                    <div class="mod-button submit">변경 내용 저장</div>
                    <div class="mod-button close">닫기</div>
                </div>

                <!-- 연락처 -->
                <div class="row tel">
                    <span class="title">연락처</span>
                    <span class="data">010-5923-9363</span>
                    <!-- <input class="data info-input" value="010-5923-9363" /> -->
                    <div class="mod-button mod">수정</div>
                </div>
                <div class="row mod tel hidden">
                    <span class="title">연락처 수정</span>
                    <div class="input-wrapper tel">
                        <input class="mod-input" type="text" />
                    </div>
                    <div class="mod-button submit">변경 내용 저장</div>
                    <div class="mod-button close">닫기</div>
                </div>
                <hr>
            </div>
        </form>
    </main>

    <script src="/resources/js/setting/general.js"></script>
</body>
</html>