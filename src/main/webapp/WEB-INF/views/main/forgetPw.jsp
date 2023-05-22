<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="/resources/css/main/forgetPw.css">
</head>
<body>
    <div class="forgetBox">
        <div class="main-logo-box">
            <a href="/">
            <img src="/resources/images/topMenu/상단바 홈 로고 이미지-002.png" class="main-logo">
            </a>
        </div>
                <div >
                    <form action="#" method="post" class="forgetPwLogin" >
                        <div>
                            <input type="text" placeholder="이메일" class="main-top-inputBox">
                        </div>
                        <div>
                            <input type="password" placeholder="비밀번호" class="main-top-inputBox">
                        </div>
                        <div>
                            <button type="submit" class="submit">로그인</button>
                        </div>
                        <a href="#" class="main-forget-account">계정을 잊으셨나요?</a>
                    </form>
                </div>
    </div>

    <div>
        <div class="found">
            <div class="found2">
                <div class="headerTitle"><h3 class="mine">내 계정 찾기</h3></div>
                <div class="line1"></div>
                
                <div class="forgetFail" id="forgetFail"><h3> 검색결과가 없음</h3>
                    <br>
                    일치하는 이메일이 없습니다.
                </div>
                <div class="margin">계정을 검색하려면 이메일 입력하시오.</div>
                    <form action="#" method="POST" name="inputEmail">
                        <input type="email"  id="emailCheck" class="inputText" placeholder="이메일">
                    </form> 

                <button id="sendAuthKeyBtn" type="button">인증번호 받기</button>
                <div class="line2"></div>
                <div class="emailCheck" id="certification">
                    <form action="#" method="POST" name="certification">
                        <input type="email" id="inputText" class="inputText" placeholder="이메일 인증 입력">
                    </form>
                    <button id="checkAuthKeyBtn" type="button">인증하기</button>
                </div>
                <div class="cancelBox">
                    <a class="cancel" >취소</a>
                    <button type="button" class="buttonBtn" id="buttonBtn">확인</button>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <span>가입하기</span>
        <span>로그인</span>
    </footer>


    <script src="/resources/js/main/forgetPw.js"></script>

</body>
</html>




