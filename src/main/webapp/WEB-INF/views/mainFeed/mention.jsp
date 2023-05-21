<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section id="sidebarR" class="sidebar">

<style>

    .bubble-container {
        margin: 0;
        width: 364px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
    }
    .bubble {
        height: 52px;
        padding: 6px;
        border-radius: 10px;
        cursor: pointer;

        display: flex;
        align-items: center;
    }
    .bubble:hover {
        background-color: #e0e0e0;
        transition-duration: 0.1s;
    }
    .bubble-content {
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    .bubble-content > p {
        display: block;
    }

    ul {
        list-style: none;
    }

    .mention-name {
        font-weight: bold;
    }
    .mention-friend {
        font-size: 0.8rem;
        color: #666;
    }
    .me {
        background-color: #f1f1f1;
    }

</style>





<ul class="bubble-container">
    <li class="bubble hover me">
        <img src="/resources/images/common/user-default.png">
        <div class="bubble-content">
            <p class="mention-name">최유나</p>
            <p class="mention-friend"></p>
        <div>
    </li>
    <li class="bubble hover">
        <img src="/resources/images/common/user-default.png">
        <div class="bubble-content">
            <p class="mention-name">친구1</p>
            <p class="mention-friend">친구</p>
        <div>
    </li>
    <li class="bubble hover">
        <img src="/resources/images/common/user-default.png">
        <div class="bubble-content">
            <p class="mention-name">아무개</p>
            <p class="mention-friend"></p>
        <div>
    </li>
</ul>





</section>

<script>
    // 초기 렌더링 시 사이드바 높이 설정
    const sidebarR = document.querySelector("#sidebarR");
    sidebarR.style.height = window.innerHeight - 56 + "px";

    // 윈도우 창 크기 변할 때마다 사이즈바 높이 재설정
    window.onresize = e => {
        sidebarR.style.height = window.innerHeight - 56 + "px"; 
    };


    function makeMentionList() {
        const li = document.createElement("li");
        il.classList.add("bubble");
        if(el.memberNo == loginMemberNo) il.classList.add("me");
        

        const img = document.createElement("image");
        if(el.profileImage != null) {
            img.setAttribute("src", el.profileImage);
        } else {
            img.setAttribute("src", "/resources/images/common/user-default.png");
        }

        const content = document.createElement("div");
        content.classList.add("bubble-content");

        const name = document.createElement("p");
        name.classList.add("mention-name");
        name.innerText = el.memberName;

        const friend = document.createElement("p");
        friend.classList.add("mention-friend");
        if(el.memberNo != loginMemberNo) name.innerText = "친구";
        

    }

</script>
