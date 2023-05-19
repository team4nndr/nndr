<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/mainFeed/sidebar.css">

<section id="sidebarL" class="sidebar">
    <ul>
        <li>
            <a href="/mainFeed">
                <img src="/resources/images/mainFeed/mainHome.png">
                <span>홈</span>
            </a>
        </li>
        <li>
            <a href="/personalFeed/${loginMember.memberNo}">
                <img src="/resources/images/mainFeed/mainMy.png">
                <span>나의 피드</span>
            </a>
        </li>
        <li>
            <a href="/friend">
                <img src="/resources/images/mainFeed/mainFriends.png">
                <span>친구</span>
            </a>
        </li>
        <li>
            <a href="#">
                <img src="/resources/images/mainFeed/mainLike.png">
                <span>내가 저장한 피드</span>
            </a>
        </li>
        <hr class="sidebar-hr">
        <li>
            <a href="https://www.naver.com/">
                <img src="/resources/images/mainFeed/mainSearch.png">
                <span>초록검색창</span>
            </a>
        </li>
    </ul>
</section>

<script>
    // 초기 렌더링 시 사이드바 높이 설정
    const sidebarL = document.querySelector("#sidebarL");
    sidebarL.style.height = window.innerHeight - 56 + "px";
    
    // 윈도우 창 크기 변할 때마다 사이즈바 높이 재설정
    window.onresize = e => {
        sidebarL.style.height = window.innerHeight - 56 + "px";    
    };
</script>