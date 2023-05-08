<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>nndr 로그인 실패</title>

    <link rel="stylesheet" href="resources/css/main/main.css">
</head>
<body>
    <div id="top">
        <div class="init">
                <div class="frame">
                    <div class="logo">
                        <a href="#"><img src="/main_img/logo.png"></a>
                    </div>
                    <div class="authentication">
                        <form class="login" action="#" method="#">
                            <div class="unlogin">
                                Facebook에 로그인    
                            </div>
                            <div class="loginfail">
                                <div>
                                    로그인 정보가 올바르지 않습니다.
                                    <br>
                                    사용자 이름 또는 비밀번호가 올바르지 않습니다.
                                </div>
                            </div>
                            <input type="text" placeholder="이메일 또는 전화번호"><br><br>
                            <input type="password" placeholder="비밀번호"><br><br>
                            <button type="submit" class="submit2">로그인</button><br>
                            <br>
                            <a href="#" class="pwCheck">비밀번호를 잊으셨나요?</a>
                            
                           
                            

                            
                        </form>
                    </div>
                </div>
            </div>
            <footer>
                <p></p>

                <article>
                    <a href="#">한국어</a>
                    <span>|</span>
                    <a href="#">로그인</a>
                    <span>|</span>
                    <a href="#">친구</a>
                    <span>|</span>
                    <a href="#">고객센터</a>
                </article>
            </footer>
        </div>

</body>
</html> 