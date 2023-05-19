<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>nndr 메인</title>

    <link rel="stylesheet" href="/resources/css/main/main.css">
    <link rel="stylesheet" href="/resources/css/main/temp.css">
</head>

<body>

    <%-- 간편 로그인 기능(추후 삭제 예정) --%>
    <div class="temp">
        <form action="/login" method="POST">
            <input type="text" name="memberEmail" value="admin">
            <input type="text" name="memberPw" value="admin">
            <button id="admin">관리자 로그인</button>
        </form>

        <form action="/login" method="POST">
            <input type="text" name="memberEmail" value="user01@mail.com">
            <input type="text" name="memberPw" value="pass01">
            <button id="user">일반유저 로그인<br>(user01@mail.com)</button>
        </form>

        <form action="/login" method="POST">
            <input type="text" name="memberEmail" value="user04@mail.com">
            <input type="text" name="memberPw" value="pass04">
            <button id="user">일반유저 로그인<br>(user04@mail.com)</button>
        </form>
    </div>
    <%-- 위 코드는 추후 삭제 예정 --%>

    <div id="top">
        <div class="init">
            <div class="frame">
                <div class="logo">
                    <h2>Facebook</h2>
                    <h3>Facebook에서 전세계에 있는 친구,가족,지인들과 함께 이야기를 나눠보세요.</h3>
                </div>
                <div class="authentication">
                    <form class="login" action="/login" method="POST">
                        <input name="memberEmail" type="text" placeholder="이메일 또는 전화번호" required><br><br>
                        <input name="memberPw" type="password" placeholder="비밀번호" required><br><br>
                        <button type="submit" class="submit2">로그인</button><br>
                        <br>
                        <a href="main/forgetPw" class="pwCheck">비밀번호를 잊으셨나요?</a>

                        <div class="line"></div>

                        <div class="create">
                            <button type="button" class="signup" id="openBtn">새 계정 만들기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer>
            <p></p>

            <article>
                <a href="#">로그인</a>
                <span>|</span>
                <a href="#">친구</a>
                <span>|</span>
                <a href="#">고객센터</a>
            </article>
        </footer>
    </div>

    <div id="modal">
        <section id="insert">
            <div id="remove">
                &times;
            </div>
            <form action="/" method="post" name="signUpFrm" id="signUpFrm">
                <div id="insert2">
                    <p>가입하기</p>
                </div>
                <div id="cross">
                    빠르고 쉽게 가입할 수 있습니다.
                </div>
                <div id="box1">
                    <div class="box">
                        <input type="text" name="memberName" placeholder="이름">
                    </div>
                    <div class="box">
                        <input type="email" name="memberEmail" id="memberEmail" placeholder="이메일"
                                maxlength="30" autocomplete="off">

                        <button id="sendAuthKeyBtn" type="button">인증번호 받기</button>
                    <div class="box">
                        <input type="text" name="authKey" id="authKey" placeholder="인증번호 입력" maxlength="6" autocomplete="off" >
                    
                        <button id="checkAuthKeyBtn" type="button">인증하기</button>
                    </div>
                    <div class="box">
                        <input type="password" name="memberPw" id="memberPw" placeholder="비밀번호" maxlength="20">
                    </div>
                    <div class="box">
                        <input type="password" name="memberPwConfirm" id="memberPwConfirm" placeholder="비밀번호 확인" maxlength="20">
                    </div>
                    <div class="box">
                        <input type="number" placeholder="(- 없이 숫자만 입력)" id="memberTel" maxlength="11">
                    </div>
                    <div class="bir" name="memberBirth">
                        생일
                        <a href="_58ms mlm" id="birthday-help" href="#" role="button">
                        </a>
                    </div>
                    <span id="date">
                        <select aria-label="연도" id="birthday" title="연도">
                            <option value="2023" selected="1">2023</option>
                            <option value="2022">2022</option>
                            <option value="2021">2021</option>
                            <option value="2020">2020</option>
                            <option value="2019">2019</option>
                            <option value="2018">2018</option>
                            <option value="2017">2017</option>
                            <option value="2016">2016</option>
                            <option value="2015">2015</option>
                            <option value="2014">2014</option>
                            <option value="2013">2013</option>
                            <option value="2012">2012</option>
                            <option value="2011">2011</option>
                            <option value="2010">2010</option>
                            <option value="2009">2009</option>
                            <option value="2008">2008</option>
                            <option value="2007">2007</option>
                            <option value="2006">2006</option>
                            <option value="2005">2005</option>
                            <option value="2004">2004</option>
                            <option value="2003">2003</option>
                            <option value="2002">2002</option>
                            <option value="2001">2001</option>
                            <option value="2000">2000</option>
                            <option value="1999">1999</option>
                            <option value="1998">1998</option>
                            <option value="1997">1997</option>
                            <option value="1996">1996</option>
                            <option value="1995">1995</option>
                            <option value="1994">1994</option>
                            <option value="1993">1993</option>
                            <option value="1992">1992</option>
                            <option value="1991">1991</option>
                            <option value="1990">1990</option>
                        </select>
                        <select aria-label="월" id="month" title="월">
                            <option value="1">1월</option>
                            <option value="2">2월</option>
                            <option value="3">3월</option>
                            <option value="4">4월</option>
                            <option value="5">5월</option>
                            <option value="6">6월</option>
                            <option value="7">7월</option>
                            <option value="8">8월</option>
                            <option value="9">9월</option>
                            <option value="10">10월</option>
                            <option value="11">11월</option>
                            <option value="12">12월</option>
                        </select>
                        <select aria-label="일" name="birthday_day" id="day" title="일" class="9405">
                            <option value="1">1일</option>
                            <option value="2">2일</option>
                            <option value="3">3일</option>
                            <option value="4">4일</option>
                            <option value="5">5일</option>
                            <option value="6">6일</option>
                            <option value="7">7일</option>
                            <option value="8">8일</option>
                            <option value="9">9일</option>
                            <option value="10">10일</option>
                            <option value="11">11일</option>
                            <option value="12">12일</option>
                            <option value="13">13일</option>
                            <option value="14">14일</option>
                            <option value="15">15일</option>
                            <option value="16">16일</option>
                            <option value="17">17일</option>
                            <option value="18">18일</option>
                            <option value="19">19일</option>
                            <option value="20">20일</option>
                            <option value="21">21일</option>
                            <option value="22">22일</option>
                            <option value="23">23일</option>
                            <option value="24">24일</option>
                            <option value="25">25일</option>
                            <option value="26">26일</option>
                            <option value="27">27일</option>
                            <option value="28">28일</option>
                            <option value="29">29일</option>
                            <option value="30">30일</option>
                            <option value="31">31일</option>
                        </select>
                    </span>
                    <div class="gender" name="memberGen">
                        성별
                    </div>
                    <span id="choose">
                        <label class="gender1" for="gen">여성</label>
                        <input type="radio" name="gen">

                        <label for="gender2">남성</label>
                        <input type="radio" name="gen">

                        <label for="gender3">선택 없음</label>
                        <input type="radio" name="gen">

                    </span>

                </div>
                <button id="btn">가입하기</button>

            </form>

        </section>

    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="resources/js/main/main.js"></script>
</body>
</html>