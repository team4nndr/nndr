<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 기능</title>
    <link rel="stylesheet" href="/resources/css/admin/admin.css">
    <link rel="stylesheet" href="/resources/css/admin/users.css">
    <link rel="stylesheet" href="/resources/css/admin/users_detail.css">
    <script src="https://kit.fontawesome.com/9c2aaccfe5.js" crossorigin="anonymous"></script>
</head>
<body>
    <%-- 상단바 메뉴 --%>
    <jsp:include page="/WEB-INF/views/topMenu/header.jsp" />
    
    <main>
        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

        <%-- 회원 관리 상세 페이지 --%>
        <form action="#" method="POST" id="content">
            <button type="button" id="backBtn" class="back">
                <i class="fa-solid fa-arrow-left"></i>
                <span>뒤로가기</span>                
            </button>
            <div id="details">
                <h3>회원 상세 정보</h3>
                <hr>
                <div class="row">
                    <span class="title">이름</span>
                    <span class="data">${member.memberName}</span>
                </div>
                <div class="row">
                    <span class="title">이메일</span>
                    <span class="data">${member.memberEmail}</span>
                </div>
                <div class="row">
                    <span class="title">성별</span>
                    <span class="data">${member.infoGender}</span>
                </div>
                <div class="row">
                    <span class="title">주소</span>
                    <span class="data">${member.infoResidence}</span>
                </div>
                <div class="row">
                    <span class="title">연락처</span>
                    <span class="data" id="telData">${member.memberTel}</span>
                </div>
                <div class="row">
                    <span class="title">회원상태</span>
                    <div class="data account">
                        <div class="normal account-label N">정상</div>
                        <div class="disabled account-label B">비활성화</div>
                        <span class="date account-label B">(비활성화 일시 : ${member.disableDate})</span>
                        <div class="dropped account-label D">탈퇴</div>
                        <span class="date account-label D">(탈퇴 일시 : ${member.deleteDate})</span>
                        <div class="admin account-label A">관리자</div>
                        <%-- <c:choose>
                            <c:when test="${member.memberCode == 'N'}">
                                <div class="normal account-label N">정상</div>
                            </c:when>
                            <c:when test="${member.memberCode == 'B'}">
                                <div class="disabled account-label B">비활성화</div>
                                <span class="date account-label B">(비활성화 일시 : ${member.disableDate})</span>
                            </c:when>
                            <c:when test="${member.memberCode == 'D'}">
                                <div class="dropped account-label D">탈퇴</div>
                                <span class="date account-label D">(탈퇴 일시 : ${member.deleteDate})</span>
                            </c:when>
                            <c:otherwise>
                                <div class="admin account-label A">관리자</div>
                            </c:otherwise>
                        </c:choose> --%>
                    </div>
                </div>
            </div>
            <div id="bottom">
                <%-- <c:choose>
                    <c:when test="${member.memberCode == 'N'}">
                        <button type="button" class="N" id="disableBtn">유저 비활성</button>
                        <button type="button" class="N" id="deleteBtn">계정 삭제</button>
                    </c:when>

                    <c:when test="${member.memberCode == 'B'}">
                        <button type="button" class="B" id="enableBtn">비활성 해제</button>
                        <button type="button" class="B" id="deleteBtn">계정 삭제</button>
                    </c:when>
                
                    <c:otherwise>
                        <button type="button" class="D" id="enableBtn">계정 복구</button>
                    </c:otherwise>
                </c:choose> --%>

                <button type="button" class="N disable-btn">유저 비활성</button>
                <button type="button" class="B enable-btn">비활성 해제</button>
                <button type="button" class="N B delete-btn alert">계정 삭제</button>
                <button type="button" class="D enable-btn">계정 복구</button>
            </div>
        </form>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
        const memberNo = "${member.memberNo}";
        let memberCode = "${member.memberCode}";
    </script>
    <script src="/resources/js/admin/users.js"></script>
</body>
</html>