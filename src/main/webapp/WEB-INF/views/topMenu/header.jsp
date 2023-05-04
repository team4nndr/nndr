<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>NNDR :: 너나들이</title>

    <link rel="stylesheet" href="/resources/css/topMenu/header.css">



    <div id="container">

        <div class="home-logo">
            <a href="#"><img src="/세미프로젝트_아이콘/상단바 홈 로고 이미지-001.png"></a>
        </div>

        <div class="search-area">
            <form action="#" method="GET">
                <fieldset id="searchBox">

                    <div>
                        <input type="search" name="query" id="query" autocomplete="off" placeholder="N-NDR 검색">
                        <button type="submit" id="searchBtn"></button>

                        <!-- 검색어 저장 영역 -->
                    </div>
                    <div class="suggestions suggestions_pannel">
                    </div>

                </fieldset>
            </form>
        </div>


        
            <div class="top-menu">
                <ul class="menu">
                    <!-- 버튼 영역  -->
                    <!-- 홈 버튼 -->
                    <li>
                        <a href="#">
                            <img src="/세미프로젝트_아이콘/home.png" id="image1">
                        </a>
                    </li>
                    <!-- 친구 버튼  -->
                    <li>
                        <a href="#">
                            <img src="/세미프로젝트_아이콘/friend.png" id="image2">
                        </a>
                    </li>
                </ul>
                
                <div id="dropdownBox">
                    <!-- 알림 버튼 -->
                    <div id="dropdown1">
                        <button onclick="bell()" id="dropBtn1"><img src="/세미프로젝트_아이콘/alarm.png" id="image3"></button>
                        
                        <!-- 알림 버튼 클릭 시 하위 메뉴 -->
                        <div id="bellDropdown" class="dropdown-content1">
                            <a href="#">알림 내용</a>
                        </div>
                    </div>
                    
                    <div id="dropdown2">
                        <!-- 내정보 버튼 -->
                        <button onclick="my()" id="dropBtn2"><img src="/세미프로젝트_아이콘/my.png" id="image4"></button>
                        
                        <!-- 내정보 버튼 클릭 시 하위 메뉴 -->
                        <div id="myDropdown" class="dropdown-content2">
                            <a href="#">내정보</a>
                            <a href="#">설정</a>
                            <a href="#">의견 보내기</a>
                            <a href="#">1:1문의</a>
                            <a href="#">로그아웃</a>
                        </div>
                    </div>
                </div>
            </div>
                
            </div>

            
            <script src="/resources/js/topMenu/header.js"></script>
