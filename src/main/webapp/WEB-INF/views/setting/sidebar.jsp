<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/admin/sidebar.css">

<section id="sidebar">
    <h1>설정</h1>
    <hr>
    <ul>
        <li>
            <a href="/setting/general">
                <img src="/resources/images/setting/setting-icon.png" alt="회원 관리">
                <span>일반</span>
            </a>
        </li>
        <li>
            <a href="/setting/security">
                <img src="/resources/images/setting/shield-icon.png" alt="회원 의견" style="width: 30px;">
                <span>보안 관련 설정</span>
            </a>
        </li>
        <li>
            <a href="/setting/alarm">
                <img src="/resources/images/setting/alarm-icon.png" alt="회원 의견" style="width: 30px;">
                <span>알림 설정</span>
            </a>
        </li>
        <li>
            <a href="/setting/feedback">
                <img src="/resources/images/setting/feedback-icon.png" alt="회원 의견" style="width: 30px;">
                <span>의견 보내기</span>
            </a>
        </li>
    </ul>
</section>

<script>
    document.getElementById("sidebar").style.height = window.innerHeight - 56 + "px";
    
    // 윈도우 창 크기 변할 때마다 사이즈바 높이 재설정
    window.onresize = e => {
    document.getElementById("sidebar").style.height = window.innerHeight - 56 + "px";
        
    };
</script>