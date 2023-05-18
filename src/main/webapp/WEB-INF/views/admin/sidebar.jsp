<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/admin/sidebar.css">

<section id="sidebar">
    <h1>관리자 기능</h1>
    <hr>
    <ul>
        <li>
            <a href="/admin">
                <img src="/resources/images/admin/manage-users-icon.png" alt="회원 관리">
                <span>회원 관리</span>
            </a>
        </li>
        <li>
            <a href="/admin/feedback">
                <img src="/resources/images/admin/feedback-icon.png" alt="회원 의견" style="width: 30px;">
                <span>회원 의견</span>
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