<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section id="sidebarR" class="sidebar">
<!--     
    <h1>나중에 뭔가 채워넣으면 좋을듯 </h1>
    <h3>id : sidebarR</h3>
    <h3>class : sidebar </h3>
    채팅이나. .그런거 .. 
-->
</section>

<script>
    // 초기 렌더링 시 사이드바 높이 설정
    const sidebarR = document.querySelector("#sidebarR");
    sidebarR.style.height = window.innerHeight - 56 + "px";
    
    // 윈도우 창 크기 변할 때마다 사이즈바 높이 재설정
    window.onresize = e => {
        sidebarR.style.height = window.innerHeight - 56 + "px"; 
    };
</script>
