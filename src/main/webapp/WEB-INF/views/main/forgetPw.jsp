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
    <div>
        <div>
            <img src="nndr로고">
                <div>
                    <form action="#" method="post" class="forgetPwLogin" >
                        <div><input type="text" placeholder="이메일" ></div>
                        <div><input type="password" placeholder="비밀번호"></div>
                        <div><button type="submit">로그인</button></div>
                        <a href="#">계정을 잊으셨나요?</a>
                    </form>
                </div>
        </div>
    </div>

    <div>
        <div class="found">
            <div class="found2">
                <div class="headerTitle"><h3>내 계정 찾기</h3></div>
                <br>
                <div class="margin">계정을 검색하려면 이메일 주소 또는 휴대폰 번호를 입력하세요.</div>
                <div><input type="text" class="inputText" placeholder="이메일 또는 휴대폰 번호"></div> 
                <br>
                <div>
                    <a class="cancel">취소</a>
                    <button type="button" class="buttonBtn">검색</button>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <div>한국어</div>
        <div>가입하기</div>
        <div>로그인</div>
    </footer>


    <script src="/resources/js/main/forgetPw.js"></script>

</body>
</html>




