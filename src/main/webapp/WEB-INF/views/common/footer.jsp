<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<footer>
</footer>

<c:if test="${not empty message}">
    <script>
        alert('${message}');
    </script>
</c:if>