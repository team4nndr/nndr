<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <li>
            <a href="https://www.naver.com/">
                <img src="/resources/images/mainFeed/mainSearch.png">
                <span>초록검색창</span>
            </a>
        </li>
    </ul>
</section>