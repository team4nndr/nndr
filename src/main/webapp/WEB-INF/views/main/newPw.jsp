<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새 비밀번호</title>
    <link rel="stylesheet" href="/resources/css/main/newPw.css">
</head>
<body>
    <div class="forgetBox">
        <div class="main-logo-box">
            <a href="/">
                <img src="/resources/images/topMenu/상단바 홈 로고 이미지-002.png" class="main-logo">
            </a>
        </div>
                <div >
                    <form action="/login" method="post" class="forgetPwLogin" >
                        <div><input type="text" name="memberEmail" placeholder="이메일" class="main-top-inputBox"></div>
                        <div><input type="password" name="memberPw" placeholder="비밀번호" class="main-top-inputBox"></div>
                        <div><button type="submit" class="submit">로그인</button></div>
                        <a href="#" class="main-forget-account">계정을 잊으셨나요?</a>
                    </form>
                </div>
    </div>

    <div>
        <div class="found">
            <div class="found2">
                
                <div class="margin">비밀번호를 입력하시오.</div>

                    <form action="changePw" method="POST" name="inputEmail" id="changePwFrm">

                        <input type="password" class="inputText" id="newPw" name="newPw" maxlength="30" placeholder="새 비밀번호 입력"> 

                <div class="line2"></div>

                <div>
                    <input type="password" class="inputText" id="newPwConfirm" maxlength="30" placeholder="새 비밀번호 확인">
                </div>

                <div class="cancelBox">
                    <button type="button" id="cancel" a class="cancel">취소</button>
                    <button type="submit" class="buttonBtn">확인</button>
                </div>

                </form>
            </div>
        </div>
    </div>

    <footer>
        <span>한국어</span>
        <span>가입하기</span>
        <span>로그인</span>
    </footer>


    <script src="/resources/js/main/forgetPw.js"></script>
    <script src="/resources/js/main/newPw.js"></script>

</body>
</html>




