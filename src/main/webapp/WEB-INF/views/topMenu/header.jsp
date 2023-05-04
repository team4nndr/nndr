<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/topMenu/header.css">

<div id="nndrContainer">

    <div class="nndr-home-logo">
        <a href="#"><img src="/resources/images/topMenu/topLogo-01.png"></a>
    </div>

    <div class="nndr-search-area">
        <form action="#" method="GET">
            <fieldset id="nndrSearchBox">
                <div>
                    <input type="search" class="nndr-input" name="query" id="nndrQuery" autocomplete="off" placeholder="N-NDR 검색">
                    <button type="submit" id="nndrSearchBtn"></button>

                    <!-- 검색어 저장 영역 -->
                </div>
                <div class="nndr-suggestions nndr-suggestions_pannel">
                </div>
            </fieldset>
        </form>
    </div>

    <div class="nndr-top-menu">
        <ul class="nndr-menu">
            <!-- 버튼 영역  -->
            <!-- 홈 버튼 -->
            <li>
                <a href="#">
                    <img src="/resources/images/topMenu/topHome.png" id="nndrImage1">
                </a>
            </li>
            <!-- 친구 버튼  -->
            <li>
                <a href="#">
                    <img src="/resources/images/topMenu/topFriend.png" id="nndrImage2">
                </a>
            </li>
        </ul>
        
        <div id="nndrDropdownBox">
            <!-- 알림 버튼 -->
            <div id="nndrDropdown1">
                <button onclick="bell()" id="nndrDropBtn1"><img src="/resources/images/topMenu/topAlarm.png" id="nndrImage3"></button>
                
                <!-- 알림 버튼 클릭 시 하위 메뉴 -->
                <div id="nndrBellDropdown" class="nndr-dropdown-content1">
                    <a href="#">알림 내용</a>
                </div>
            </div>
            
            <div id="nndrDropdown2">
                <!-- 내정보 버튼 -->
                <button onclick="my()" id="nndrDropBtn2"><img src="/resources/images/topMenu/topMyInfo.png" id="nndrImage4"></button>
                
                <!-- 내정보 버튼 클릭 시 하위 메뉴 -->
                <div id="nndrMyDropdown" class="nndr-dropdown-content2">
                    <a href="/setting">설정</a>
                    <a href="#">의견 보내기</a>
                    <a href="#">1:1문의</a>
                    <a href="#">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/resources/js/topMenu/header.js"></script>