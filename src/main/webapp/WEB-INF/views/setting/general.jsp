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
        <form id="content">
            <div id="details">
                <h3>내 정보</h3>
                <hr>

                <!-- 계정(이메일) -->
                <div class="row">
                    <span class="title">로그인계정</span>
                    <span class="data">${loginMember.memberEmail}</span>
                </div>

                <!-- 이름 -->
                <div class="row">
                    <span class="title">이름</span>
                    <span class="data">${loginMember.memberName}</span>
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
                                <input id="currentPw" class="mod-input" type="password" />
                            </span>
                        </div>
                        <div>
                            새 비밀번호
                            <span class="input-wrapper passwd">
                                <input id="newPw" class="mod-input" type="password" />
                            </span>
                        </div>
                        <div>
                            새 비밀번호 재입력
                            <span class="input-wrapper passwd">
                                <input id="newPwConfirm" class="mod-input" type="password" />
                            </span>
                        </div>
                        <a href="#">비밀번호를 잊으셨나요?</a>
                    </div>

                    <div class="mod-button submit">변경 내용 저장</div>
                    <div class="mod-button close">닫기</div>
                </div>

                <!-- 성별 -->
                <div class="row gender">
                    <span class="title">성별</span>
                    <span class="data info-print">
                    <c:choose>
                        <c:when test="${loginMember.infoGender == '남'}">남</c:when>
                        <c:when test="${loginMember.infoGender == '여'}">여</c:when>
                        <c:otherwise>선택하지 않음</c:otherwise>
                    </c:choose>
                    </span>
                    
                    <div class="mod-button mod">수정</div>
                </div>
                <div class="row mod gender hidden">
                    <span class="title">성별 수정</span>
                    <div class="mod-wrapper gender">
                        <label><input type="radio" name="gender" id="genderMale" value="남" <c:if test="${loginMember.infoGender == '남'}" >checked</c:if>>남</label>
                        <label><input type="radio" name="gender" id="genderFemale" value="여" <c:if test="${loginMember.infoGender == '여'}" >checked</c:if>>여</label>
                        <label><input type="radio" name="gender" id="genderNone" value="없음" <c:if test="${loginMember.infoGender == '없음'}" >checked</c:if>>선택하지 않음</label>
                    </div>
                    <div class="mod-button submit">변경 내용 저장</div>
                    <div class="mod-button close">닫기</div>
                </div>

                <!-- 주소 -->
                <div class="row address">
                    <span class="title">주소</span>
                    <span class="data info-print">${loginMember.infoResidence}</span>
                    <div class="mod-button mod">수정</div>
                </div>
                <div class="row mod address hidden">
                    <span class="title">주소 수정</span>
                    <div class="input-wrapper address">
                        <input class="mod-input" type="text" value="${loginMember.infoResidence}"/>
                    </div>
                    <div class="mod-button submit">변경 내용 저장</div>
                    <div class="mod-button close">닫기</div>
                </div>

                <!-- 연락처 -->
                <div class="row tel">
                    <span class="title">연락처</span>
                    <span class="data info-print" id="telData">${loginMember.memberTel}</span>
                    <div class="mod-button mod">수정</div>
                </div>
                <div class="row mod tel hidden">
                    <span class="title">연락처 수정</span>
                    <div class="input-wrapper tel">
                        <input class="mod-input" type="text" value="${loginMember.memberTel}" maxlength="11"/>
                    </div>
                    <span class="mod-message"></span>
                    <div class="mod-button submit">변경 내용 저장</div>
                    <div class="mod-button close">닫기</div>
                </div>
                <hr>
            </div>
        </form>
    </main>

    <script>
        const infoGender = "${loginMember.infoGender}";
        const infoResidence = "${loginMember.infoResidence}";
        const memberTel = "${loginMember.memberTel}";
    </script>
    
    <script src="/resources/js/setting/general.js"></script>
</body>
</html>